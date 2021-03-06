#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "chess.h"
#include "data.h"

/* modified 10/06/97 */
/*
********************************************************************************
*                                                                              *
*   Search() is the recursive routine used to implement the alpha/beta         *
*   negamax search (similar to minimax but simpler to code.)  Search() is      *
*   called whenever there is "depth" remaining so that all moves are subject   *
*   to searching, or when the side to move is in check, to make sure that this *
*   side isn't mated.  Search() recursively calls itself until depth is ex-    *
*   hausted, at which time it calls Quiesce() instead.                         *
*                                                                              *
********************************************************************************
*/
int Search(int alpha, int beta, int wtm, int depth, int ply, int do_null)
{
  register int first_move=1, threat=0;
  register BITBOARD save_hash_key;
  register int initial_alpha, value;
  register int extensions, pieces;
/*
 ----------------------------------------------------------
|                                                          |
|   check to see if we have searched enough nodes that it  |
|   is time to peek at how much time has been used, or if  |
|   is time to check for operator keyboard input.  this is |
|   usually enough nodes to force a time/input check about |
|   once per second, except when the target time per move  |
|   is very small, in which case we try to check the time  |
|   at least 10 times during the search.                   |
|                                                          |
 ----------------------------------------------------------
*/
  if (ply >= MAXPLY-2) return(beta);
  nodes_searched++;
  if (--next_time_check <= 0) {
    next_time_check=nodes_between_time_checks;
    if (CheckInput()) Interrupt(ply);
    time_abort+=TimeCheck(0);
    if (time_abort) {
      abort_search=1;
      return(0);
    }
  }
/*
 ----------------------------------------------------------
|                                                          |
|   check for draw by repetition.                          |
|                                                          |
 ----------------------------------------------------------
*/
  if (RepetitionCheck(ply,wtm)) {
    value=(wtm==root_wtm) ? DrawScore() : -DrawScore();
    if (value < beta) SavePV(ply,value,0);
#if !defined(FAST)
    if(ply <= trace_level) printf("draw by repetition detected, ply=%d.\n",ply);
#endif
    return(value);
  }
/*
 ----------------------------------------------------------
|                                                          |
|   now call LookUp() to see if this position has been     |
|   searched before.  if so, we may get a real score,      |
|   produce a cutoff, or get nothing more than a good move |
|   to try first.  there are four cases to handle:         |
|                                                          |
|   1. LookUp() returned "EXACT_SCORE" if this score is    |
|   greater than beta, return beta.  otherwise, return the |
|   score.  In either case, no further searching is needed |
|   from this position.  note that lookup verified that    |
|   the table position has sufficient "draft" to meet the  |
|   requirements of the current search depth remaining.    |
|                                                          |
|   2.  LookUp() returned "UPPER_BOUND" which means that   |
|   when this position was searched previously, every move |
|   was "refuted" by one of its descendents.  as a result, |
|   when the search was completed, we returned alpha at    |
|   that point.  we simply return alpha here as well.      |
|                                                          |
|   3.  LookUp() returned "LOWER_BOUND" which means that   |
|   when we encountered this position before, we searched  |
|   one branch (probably) which promptly refuted the move  |
|   at the previous ply.                                   |
|                                                          |
|   4.  LookUp() returned "AVOID_NULL_MOVE" which means    |
|   the hashed score/bound was no good, but it indicated   |
|   that trying a null-move in this position will be a     |
|   waste of time.                                         |
|                                                          |
 ----------------------------------------------------------
*/
  switch (LookUp(ply,depth,wtm,&alpha,&beta)) {
    case EXACT_SCORE:
      if(alpha < beta) SavePV(ply,alpha,1);
      return(alpha);
    case LOWER_BOUND:
      return(beta);
    case UPPER_BOUND:
      return(alpha);
    case AVOID_NULL_MOVE:
      do_null=0;
  }
/*
 ----------------------------------------------------------
|                                                          |
|   initialize.                                            |
|                                                          |
 ----------------------------------------------------------
*/
  in_check[ply+1]=0;
  extended_reason[ply+1]=no_extension;
  initial_alpha=alpha;
  last[ply]=last[ply-1];
  killer_count1[ply+1]=0;
  killer_count2[ply+1]=0;
/*
 ----------------------------------------------------------
|                                                          |
|  first, we try a null move to see if we can get a quick  |
|  cutoff with only a little work.  this operates as       |
|  follows.  instead of making a legal move, the side on   |
|  move 'passes' and does nothing.  the resulting position |
|  is searched to a shallower depth than normal (usually   |
|  one ply less but settable by the operator) this should  |
|  result in a cutoff or at least should set the lower     |
|  bound better since anything should be better than not   |
|  doing anything.                                         |
|                                                          |
|  this is skipped for any of the following reasons:       |
|                                                          |
|  1.  the side on move is in check.  the null move        |
|      results in an illegal position.                     |
|  2.  no more than one null move can appear in succession |
|      or else the search will degenerate into nothing.    |
|  3.  the side on move has little material left making    |
|      zugzwang positions more likely.                     |
|                                                          |
 ----------------------------------------------------------
*/
# if defined(NULL_MOVE_DEPTH)
  pieces=(wtm) ? TotalWhitePieces : TotalBlackPieces;
  if (do_null && !in_check[ply] && pieces &&
      (pieces>5 || depth<421)) {
    current_move[ply]=0;
    current_phase[ply]=NULL_MOVE;
#if !defined(FAST)
    if (ply <= trace_level)
      SearchTrace(ply,depth,wtm,alpha,beta,"Search",0);
#endif
    position[ply+1]=position[ply];
    Rule50Moves(ply+1)++;
    save_hash_key=HashKey;
    if (EnPassant(ply)) {
      HashEP(EnPassant(ply+1),HashKey);
      EnPassant(ply+1)=0;
    }
    value=-ABSearch(-beta,-alpha,ChangeSide(wtm),
                    depth-NULL_MOVE_DEPTH-INCREMENT_PLY,ply+1,NO_NULL);
    HashKey=save_hash_key;
    if (abort_search) return(0);
    if (value >= beta) {
      StoreRefutation(ply,depth,wtm,value);
      return(value);
    }
    if (value == MATE-ply-2) threat=1;
  }
# endif
/*
 ----------------------------------------------------------
|                                                          |
|   if there is no best move from the hash table, and this |
|   is a PV node, then we need a good move to search       |
|   first.  while killers and history moves are good, they |
|   are not "good enough".  the simplest action is to try  |
|   a shallow search (depth-2) to get a move.  note that   |
|   when we call Search() with depth-2, it, too, will      |
|   not have a hash move, and will therefore recursively   |
|   continue this process, hence the name "internal        |
|   iterative deepening."                                  |
|                                                          |
 ----------------------------------------------------------
*/
  next_status[ply].phase=FIRST_PHASE;
  if (hash_move[ply]==0 && (depth > 2*INCREMENT_PLY) &&
      (((ply & 1) && alpha == root_alpha && beta == root_beta) ||
      (!(ply & 1) && alpha == -root_beta && beta == -root_alpha))) {
    current_move[ply]=0;
    value=ABSearch(alpha,beta,wtm,depth-2*INCREMENT_PLY,ply,DO_NULL);
    if (abort_search) return(0);
    if (value <= alpha) {
      value=ABSearch(-MATE,beta,wtm,depth-2*INCREMENT_PLY,ply,DO_NULL);
      if (abort_search) return(0);
    }
    else if (value < beta) {
      if ((int) pv[ply-1].path_length >= ply) hash_move[ply]=pv[ply-1].path[ply];
    }
    else hash_move[ply]=current_move[ply];
    last[ply]=last[ply-1];
    next_status[ply].phase=FIRST_PHASE;
  }
/*
 ----------------------------------------------------------
|                                                          |
|   now iterate through the move list and search the       |
|   resulting positions.  note that Search() culls any     |
|   move that is not legal by using Check().  the special  |
|   case is that we must find one legal move to search to  |
|   confirm that it's not a mate or draw.                  |
|                                                          |
 ----------------------------------------------------------
*/
  while ((current_phase[ply]=(in_check[ply]) ? NextEvasion(ply,wtm) : 
                                               NextMove(ply,wtm))) {
    extended_reason[ply]&=check_extension;
#if !defined(FAST)
    if (ply <= trace_level) SearchTrace(ply,depth,wtm,alpha,beta,"Search",current_phase[ply]);
#endif
/*
 ----------------------------------------------------------
|                                                          |
|   if two successive moves are capture / re-capture so    |
|   that the material score is restored, extend the search |
|   by one ply on the re-capture since it is pretty much   |
|   forced and easy to analyze.                            |
|                                                          |
 ----------------------------------------------------------
*/
    extensions=(threat) ? 0 : -INCREMENT_PLY;
    if (Captured(current_move[ply]) && Captured(current_move[ply-1]) &&
        To(current_move[ply-1]) == To(current_move[ply]) &&
        (p_values[Captured(current_move[ply-1])+7] == 
         p_values[Captured(current_move[ply])+7] ||
         Promote(current_move[ply-1])) &&
        !(extended_reason[ply-1]&recapture_extension)) {
      if (extensions < 0) {
        extended_reason[ply]|=recapture_extension;
        recapture_extensions_done++;
        extensions=0;
      }
    }
/*
 ----------------------------------------------------------
|                                                          |
|   if we push a passed pawn, we need to look deeper to    |
|   see if it is a legitimate threat.                      |
|                                                          |
 ----------------------------------------------------------
*/
    if (Piece(current_move[ply])==pawn &&
         ((wtm && To(current_move[ply])>H5 && TotalBlackPieces<16 &&
          !And(mask_pawn_passed_w[To(current_move[ply])],BlackPawns)) ||
         (!wtm && To(current_move[ply])<A4 && TotalWhitePieces<16 &&
          !And(mask_pawn_passed_b[To(current_move[ply])],WhitePawns)) ||
         push_extensions[To(current_move[ply])]) &&
         Swap(From(current_move[ply]),To(current_move[ply]),wtm) ==
           p_values[Captured(current_move[ply])+7]) {
      if (extensions < 0) {
        extended_reason[ply]|=passed_pawn_extension;
        passed_pawn_extensions_done++;
        extensions=0;
      }
    }
/*
 ----------------------------------------------------------
|                                                          |
|   now make the move and search the resulting position.   |
|   if we are in check, the current move must be legal     |
|   since NextEvasion ensures this, otherwise we have to   |
|   make sure the side-on-move is not in check after the   |
|   move to weed out illegal moves and save time.          |
|                                                          |
 ----------------------------------------------------------
*/
    MakeMove(ply,current_move[ply],wtm);
    if (in_check[ply] || !Check(wtm)) {
/*
 ----------------------------------------------------------
|                                                          |
|   if the move to be made checks the opponent, then we    |
|   need to remember that he's in check and also extend    |
|   the depth by one ply for him to get out.               |
|                                                          |
 ----------------------------------------------------------
*/
      if (Check(ChangeSide(wtm))) {
        in_check[ply+1]=1;
        extended_reason[ply+1]=check_extension;
        if (extensions < 0) {
          check_extensions_done++;
          extensions=0;
        }
      }
      else {
        in_check[ply+1]=0;
        extended_reason[ply+1]=no_extension;
      }
/*
 ----------------------------------------------------------
|                                                          |
|   now we toss in the "razoring" trick, which simply says |
|   if we are doing fairly badly, we can reduce the depth  |
|   an additional ply, if there was nothing at the current |
|   ply that caused an extension.                          |
|                                                          |
 ----------------------------------------------------------
*/
      if (depth<3*INCREMENT_PLY && depth>=2*INCREMENT_PLY &&
          !in_check[ply] && extensions == -INCREMENT_PLY &&
          ply <= iteration_depth) {
        register int value=-Evaluate(ply+1,ChangeSide(wtm),-(beta+501),-(alpha-501));
        if (value+50 < alpha) extensions-=60;
      }
/*
 ----------------------------------------------------------
|                                                          |
|   if there's only one legal move, extend the search one  |
|   additional ply since this node is very easy to search. |
|                                                          |
 ----------------------------------------------------------
*/
      if (first_move) {
        if (last[ply]-last[ply-1] == 1) {
          extended_reason[ply]|=one_reply_extension;
          one_reply_extensions_done++;
          if (extensions < 0) extensions+=ONE_REPLY_TO_CHECK;
        }
        value=-ABSearch(-beta,-alpha,ChangeSide(wtm),
                        depth+extensions,ply+1,DO_NULL);
        if (abort_search) {
          UnMakeMove(ply,current_move[ply],wtm);
          return(0);
        }
        first_move=0;
      }
      else {
        value=-ABSearch(-alpha-1,-alpha,ChangeSide(wtm),
                        depth+extensions,ply+1,DO_NULL);
        if (abort_search) {
          UnMakeMove(ply,current_move[ply],wtm);
          return(0);
        }
        if (value>alpha && value<beta) {
          value=-ABSearch(-beta,-alpha,ChangeSide(wtm),
                          depth+extensions,ply+1,DO_NULL);
          if (abort_search) {
            UnMakeMove(ply,current_move[ply],wtm);
            return(0);
          }
        }
      }
      if (value > alpha) {
        if(value >= beta) {
          HistoryRefutation(ply,depth,wtm);
          UnMakeMove(ply,current_move[ply],wtm);
          StoreRefutation(ply,depth,wtm,value);
          return(value);
        }
        alpha=value;
      }
    }
    UnMakeMove(ply,current_move[ply],wtm);
  }
/*
 ----------------------------------------------------------
|                                                          |
|   all moves have been searched.  if none were legal,     |
|   return either MATE or DRAW depending on whether the    |
|   side to move is in check or not.                       |
|                                                          |
 ----------------------------------------------------------
*/
  if (first_move == 1) {
    value=(Check(wtm)) ? -(MATE-ply) :
                         ((wtm==root_wtm) ? DrawScore() : -DrawScore());
    if (value >=alpha && value <beta) {
      SavePV(ply,value,0);
#if !defined(FAST)
      if (ply <= trace_level) printf("Search() no moves!  ply=%d\n",ply);
#endif
    }
    return(value);
  }
  else {
    if (alpha != initial_alpha) {
      memcpy(&pv[ply-1].path[ply],&pv[ply].path[ply],(pv[ply].path_length-ply+1)*4);
      memcpy(&pv[ply-1].path_hashed,&pv[ply].path_hashed,3);
      pv[ply-1].path[ply-1]=current_move[ply-1];
      HistoryBest(ply,depth,wtm);
    }
    StoreBest(ply,depth,wtm,alpha,initial_alpha);
/*
 ----------------------------------------------------------
|                                                          |
|   if the 50-move rule is drawing close, then adjust the  |
|   score to reflect the impending draw.                   |
|                                                          |
 ----------------------------------------------------------
*/
    if (Rule50Moves(ply) >= 99) {
      value=(wtm==root_wtm) ? DrawScore() : -DrawScore();
      if (value < beta) SavePV(ply,value,0);
#if !defined(FAST)
      if(ply <= trace_level) printf("draw by 50-move rule detected, ply=%d.\n",ply);
#endif
      return(value);
    }
    return(alpha);
  }
}
