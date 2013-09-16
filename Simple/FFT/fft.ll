; ModuleID = 'fft.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.8.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sbuf = type { i8*, i32 }
%struct.__sFILEX = type opaque

@P = global i64 1, align 8
@M = global i64 4, align 8
@test_result = global i64 1, align 8
@doprint = global i64 0, align 8
@dostats = global i64 0, align 8
@maxtotal = global i64 0, align 8
@mintotal = global i64 0, align 8
@maxfrac = global double 0.000000e+00, align 8
@minfrac = global double 0.000000e+00, align 8
@orig_num_lines = global i64 256, align 8
@num_cache_lines = global i64 256, align 8
@log2_line_size = global i64 4, align 8
@.str = private unnamed_addr constant [13 x i8] c"p:m:n:l:stoh\00", align 1
@.str1 = private unnamed_addr constant [16 x i8] c"P must be >= 1\0A\00", align 1
@.str2 = private unnamed_addr constant [24 x i8] c"P must be a power of 2\0A\00", align 1
@.str3 = private unnamed_addr constant [16 x i8] c"M must be even\0A\00", align 1
@.str4 = private unnamed_addr constant [36 x i8] c"Number of cache lines must be >= 1\0A\00", align 1
@.str5 = private unnamed_addr constant [55 x i8] c"Log base 2 of cache line length in bytes must be >= 0\0A\00", align 1
@.str18 = private unnamed_addr constant [38 x i8] c"Default: FFT -m%1d -p%1d -n%1d -l%1d\0A\00", align 1
@N = common global i64 0, align 8
@rootN = common global i64 0, align 8
@rowsperproc = common global i64 0, align 8
@.str19 = private unnamed_addr constant [48 x i8] c"Matrix not large enough. 2**(M/2) must be >= P\0A\00", align 1
@line_size = common global i64 0, align 8
@.str20 = private unnamed_addr constant [55 x i8] c"WARNING: Each element is a complex double (%ld bytes)\0A\00", align 1
@pad_length = common global i64 0, align 8
@.str23 = private unnamed_addr constant [32 x i8] c"Padding algorithm unsuccessful\0A\00", align 1
@x = common global double* null, align 8
@trans = common global double* null, align 8
@umain = common global double* null, align 8
@umain2 = common global double* null, align 8
@.str24 = private unnamed_addr constant [31 x i8] c"Could not malloc memory for x\0A\00", align 1
@.str25 = private unnamed_addr constant [35 x i8] c"Could not malloc memory for trans\0A\00", align 1
@.str26 = private unnamed_addr constant [35 x i8] c"Could not malloc memory for umain\0A\00", align 1
@.str27 = private unnamed_addr constant [36 x i8] c"Could not malloc memory for umain2\0A\00", align 1
@.str30 = private unnamed_addr constant [24 x i8] c"   %ld Complex Doubles\0A\00", align 1
@.str31 = private unnamed_addr constant [19 x i8] c"   %ld Processors\0A\00", align 1
@.str32 = private unnamed_addr constant [20 x i8] c"   %ld Cache lines\0A\00", align 1
@.str33 = private unnamed_addr constant [43 x i8] c"   %ld Cache lines for blocking transpose\0A\00", align 1
@.str34 = private unnamed_addr constant [22 x i8] c"   %d Byte line size\0A\00", align 1
@.str35 = private unnamed_addr constant [22 x i8] c"   %d Bytes per page\0A\00", align 1
@ck1 = common global double 0.000000e+00, align 8
@ck3 = common global double 0.000000e+00, align 8
@.str43 = private unnamed_addr constant [42 x i8] c"Checksum difference is %.3f (%.3f, %.3f)\0A\00", align 1
@__stderrp = external global %struct.__sFILE*
@.str46 = private unnamed_addr constant [44 x i8] c"Proc %ld could not malloc memory for upriv\0A\00", align 1
@.str47 = private unnamed_addr constant [13 x i8] c" %4.2f %4.2f\00", align 1
@.str49 = private unnamed_addr constant [11 x i8] c"ERROR: %s\0A\00", align 1
@str = private unnamed_addr constant [28 x i8] c"FFT with Blocking Transpose\00"
@str51 = private unnamed_addr constant [36 x i8] c"                 PROCESS STATISTICS\00"
@str52 = private unnamed_addr constant [53 x i8] c"            Computation      Transpose     Transpose\00"
@str53 = private unnamed_addr constant [52 x i8] c" Proc          Time            Time        Fraction\00"
@str54 = private unnamed_addr constant [39 x i8] c"              INVERSE FFT TEST RESULTS\00"
@str55 = private unnamed_addr constant [12 x i8] c"TEST FAILED\00"
@str56 = private unnamed_addr constant [12 x i8] c"TEST PASSED\00"
@str57 = private unnamed_addr constant [23 x i8] c"Data values after FFT:\00"
@str58 = private unnamed_addr constant [31 x i8] c"Data values after inverse FFT:\00"
@str59 = private unnamed_addr constant [22 x i8] c"Original data values:\00"
@str60 = private unnamed_addr constant [42 x i8] c"  => Less than one element per cache line\00"
@str61 = private unnamed_addr constant [41 x i8] c"     Computing transpose blocking factor\00"
@str62 = private unnamed_addr constant [22 x i8] c"Usage: FFT <options>\0A\00"
@str63 = private unnamed_addr constant [9 x i8] c"options:\00"
@str64 = private unnamed_addr constant [70 x i8] c"  -mM : M = even integer; 2**M total complex data points transformed.\00"
@str65 = private unnamed_addr constant [56 x i8] c"  -pP : P = number of processors; Must be a power of 2.\00"
@str66 = private unnamed_addr constant [35 x i8] c"  -nN : N = number of cache lines.\00"
@str67 = private unnamed_addr constant [54 x i8] c"  -lL : L = Log base 2 of cache line length in bytes.\00"
@str68 = private unnamed_addr constant [54 x i8] c"  -s  : Print individual processor timing statistics.\00"
@str69 = private unnamed_addr constant [67 x i8] c"  -t  : Perform FFT and inverse FFT.  Test output by comparing the\00"
@str70 = private unnamed_addr constant [71 x i8] c"        integral of the original data to the integral of the data that\00"
@str71 = private unnamed_addr constant [57 x i8] c"        results from performing the FFT and inverse FFT.\00"
@str72 = private unnamed_addr constant [39 x i8] c"  -o  : Print out complex data points.\00"
@str73 = private unnamed_addr constant [41 x i8] c"  -h  : Print out command line options.\0A\00"
@str74 = private unnamed_addr constant [7 x i8] c"start\0D\00"

; Function Attrs: nounwind ssp uwtable
define i32 @fft_compute(i32 %argc, i8** %argv) #0 {
entry:
  %call321 = tail call i32 @"\01_getopt"(i32 %argc, i8** %argv, i8* getelementptr inbounds ([13 x i8]* @.str, i64 0, i64 0)) #8
  %cmp322 = icmp eq i32 %call321, -1
  br i1 %cmp322, label %while.end, label %while.body

while.body:                                       ; preds = %while.cond.backedge, %entry
  %call323 = phi i32 [ %call, %while.cond.backedge ], [ %call321, %entry ]
  %conv = sext i32 %call323 to i64
  switch i64 %conv, label %while.cond.backedge [
    i64 112, label %sw.bb
    i64 109, label %sw.bb11
    i64 110, label %sw.bb18
    i64 108, label %sw.bb25
    i64 115, label %sw.bb32
    i64 116, label %sw.bb34
    i64 111, label %sw.bb39
    i64 104, label %sw.bb44
  ]

sw.bb:                                            ; preds = %while.body
  %call2 = tail call i32 @atoi(i8* undef) #8
  %conv3 = sext i32 %call2 to i64
  store i64 %conv3, i64* @P, align 8, !tbaa !0
  %cmp4 = icmp slt i32 %call2, 1
  br i1 %cmp4, label %if.then, label %while.cond.outer.i.preheader

while.cond.outer.i.preheader:                     ; preds = %sw.bb
  %cmp2.i312 = icmp eq i32 %call2, 1
  %notlhs313 = icmp slt i32 %call2, 2
  br i1 %notlhs313, label %log_2.exit, label %if.else.i

if.then:                                          ; preds = %sw.bb
  %0 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !3
  %call.i = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %0, i8* getelementptr inbounds ([11 x i8]* @.str49, i64 0, i64 0), i8* getelementptr inbounds ([16 x i8]* @.str1, i64 0, i64 0)) #8
  tail call void @exit(i32 -1) #9
  unreachable

if.else.i:                                        ; preds = %if.else.i, %while.cond.outer.i.preheader
  %out.0.ph.i317 = phi i64 [ %inc.i, %if.else.i ], [ 0, %while.cond.outer.i.preheader ]
  %cumulative.0.ph.i316 = phi i64 [ %mul.i, %if.else.i ], [ 1, %while.cond.outer.i.preheader ]
  %mul.i = shl nsw i64 %cumulative.0.ph.i316, 1
  %inc.i = add nsw i64 %out.0.ph.i317, 1
  %cmp2.i = icmp eq i64 %mul.i, %conv3
  %notlhs = icmp sge i64 %mul.i, %conv3
  %notrhs = icmp sgt i64 %out.0.ph.i317, 48
  %or.cond.not = or i1 %notrhs, %notlhs
  %brmerge = or i1 %or.cond.not, %cmp2.i
  br i1 %brmerge, label %while.cond.outer.i.log_2.exit_crit_edge, label %if.else.i

while.cond.outer.i.log_2.exit_crit_edge:          ; preds = %if.else.i
  %phitmp = icmp eq i64 %inc.i, -1
  br label %log_2.exit

log_2.exit:                                       ; preds = %while.cond.outer.i.log_2.exit_crit_edge, %while.cond.outer.i.preheader
  %notrhs.lcssa = phi i1 [ %notrhs, %while.cond.outer.i.log_2.exit_crit_edge ], [ false, %while.cond.outer.i.preheader ]
  %notlhs.lcssa = phi i1 [ %notlhs, %while.cond.outer.i.log_2.exit_crit_edge ], [ true, %while.cond.outer.i.preheader ]
  %cmp2.i.lcssa = phi i1 [ %cmp2.i, %while.cond.outer.i.log_2.exit_crit_edge ], [ %cmp2.i312, %while.cond.outer.i.preheader ]
  %out.0.ph.i.lcssa = phi i1 [ %phitmp, %while.cond.outer.i.log_2.exit_crit_edge ], [ false, %while.cond.outer.i.preheader ]
  %not.or.cond.not.demorgan = or i1 %notrhs.lcssa, %notlhs.lcssa
  %cmp2.i.not = xor i1 %cmp2.i.lcssa, true
  %not.cmp2.i.mux = and i1 %not.or.cond.not.demorgan, %cmp2.i.not
  %cmp7 = or i1 %out.0.ph.i.lcssa, %not.cmp2.i.mux
  br i1 %cmp7, label %if.then9, label %while.cond.backedge

if.then9:                                         ; preds = %log_2.exit
  %1 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !3
  %call.i254 = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %1, i8* getelementptr inbounds ([11 x i8]* @.str49, i64 0, i64 0), i8* getelementptr inbounds ([24 x i8]* @.str2, i64 0, i64 0)) #8
  tail call void @exit(i32 -1) #9
  unreachable

sw.bb11:                                          ; preds = %while.body
  %call12 = tail call i32 @atoi(i8* undef) #8
  %conv13 = sext i32 %call12 to i64
  store i64 %conv13, i64* @M, align 8, !tbaa !0
  %div = sdiv i64 %conv13, 2
  %mul = shl nsw i64 %div, 1
  %cmp14 = icmp eq i64 %mul, %conv13
  br i1 %cmp14, label %while.cond.backedge, label %if.then16

if.then16:                                        ; preds = %sw.bb11
  %2 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !3
  %call.i255 = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %2, i8* getelementptr inbounds ([11 x i8]* @.str49, i64 0, i64 0), i8* getelementptr inbounds ([16 x i8]* @.str3, i64 0, i64 0)) #8
  tail call void @exit(i32 -1) #9
  unreachable

sw.bb18:                                          ; preds = %while.body
  %call19 = tail call i32 @atoi(i8* undef) #8
  %conv20 = sext i32 %call19 to i64
  store i64 %conv20, i64* @num_cache_lines, align 8, !tbaa !0
  store i64 %conv20, i64* @orig_num_lines, align 8, !tbaa !0
  %cmp21 = icmp slt i32 %call19, 1
  br i1 %cmp21, label %if.then23, label %while.cond.backedge

if.then23:                                        ; preds = %sw.bb18
  %3 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !3
  %call.i256 = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %3, i8* getelementptr inbounds ([11 x i8]* @.str49, i64 0, i64 0), i8* getelementptr inbounds ([36 x i8]* @.str4, i64 0, i64 0)) #8
  tail call void @exit(i32 -1) #9
  unreachable

sw.bb25:                                          ; preds = %while.body
  %call26 = tail call i32 @atoi(i8* undef) #8
  %conv27 = sext i32 %call26 to i64
  store i64 %conv27, i64* @log2_line_size, align 8, !tbaa !0
  %cmp28 = icmp slt i32 %call26, 0
  br i1 %cmp28, label %if.then30, label %while.cond.backedge

while.cond.backedge:                              ; preds = %sw.bb39, %sw.bb34, %sw.bb32, %sw.bb25, %sw.bb18, %sw.bb11, %log_2.exit, %while.body
  %call = tail call i32 @"\01_getopt"(i32 %argc, i8** %argv, i8* getelementptr inbounds ([13 x i8]* @.str, i64 0, i64 0)) #8
  %cmp = icmp eq i32 %call, -1
  br i1 %cmp, label %while.end, label %while.body

if.then30:                                        ; preds = %sw.bb25
  %4 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !3
  %call.i257 = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %4, i8* getelementptr inbounds ([11 x i8]* @.str49, i64 0, i64 0), i8* getelementptr inbounds ([55 x i8]* @.str5, i64 0, i64 0)) #8
  tail call void @exit(i32 -1) #9
  unreachable

sw.bb32:                                          ; preds = %while.body
  %5 = load i64* @dostats, align 8, !tbaa !0
  %lnot = icmp eq i64 %5, 0
  %conv33 = zext i1 %lnot to i64
  store i64 %conv33, i64* @dostats, align 8, !tbaa !0
  br label %while.cond.backedge

sw.bb34:                                          ; preds = %while.body
  %6 = load i64* @test_result, align 8, !tbaa !0
  %lnot36 = icmp eq i64 %6, 0
  %conv38 = zext i1 %lnot36 to i64
  store i64 %conv38, i64* @test_result, align 8, !tbaa !0
  br label %while.cond.backedge

sw.bb39:                                          ; preds = %while.body
  %7 = load i64* @doprint, align 8, !tbaa !0
  %lnot41 = icmp eq i64 %7, 0
  %conv43 = zext i1 %lnot41 to i64
  store i64 %conv43, i64* @doprint, align 8, !tbaa !0
  br label %while.cond.backedge

sw.bb44:                                          ; preds = %while.body
  %puts242 = tail call i32 @puts(i8* getelementptr inbounds ([22 x i8]* @str62, i64 0, i64 0))
  %puts243 = tail call i32 @puts(i8* getelementptr inbounds ([9 x i8]* @str63, i64 0, i64 0))
  %puts244 = tail call i32 @puts(i8* getelementptr inbounds ([70 x i8]* @str64, i64 0, i64 0))
  %puts245 = tail call i32 @puts(i8* getelementptr inbounds ([56 x i8]* @str65, i64 0, i64 0))
  %puts246 = tail call i32 @puts(i8* getelementptr inbounds ([35 x i8]* @str66, i64 0, i64 0))
  %puts247 = tail call i32 @puts(i8* getelementptr inbounds ([54 x i8]* @str67, i64 0, i64 0))
  %puts248 = tail call i32 @puts(i8* getelementptr inbounds ([54 x i8]* @str68, i64 0, i64 0))
  %puts249 = tail call i32 @puts(i8* getelementptr inbounds ([67 x i8]* @str69, i64 0, i64 0))
  %puts250 = tail call i32 @puts(i8* getelementptr inbounds ([71 x i8]* @str70, i64 0, i64 0))
  %puts251 = tail call i32 @puts(i8* getelementptr inbounds ([57 x i8]* @str71, i64 0, i64 0))
  %puts252 = tail call i32 @puts(i8* getelementptr inbounds ([39 x i8]* @str72, i64 0, i64 0))
  %puts253 = tail call i32 @puts(i8* getelementptr inbounds ([41 x i8]* @str73, i64 0, i64 0))
  %call57 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str18, i64 0, i64 0), i32 4, i32 1, i32 256, i32 4) #8
  tail call void @exit(i32 0) #9
  unreachable

while.end:                                        ; preds = %while.cond.backedge, %entry
  %8 = load i64* @M, align 8, !tbaa !0
  %sh_prom = trunc i64 %8 to i32
  %shl = shl i32 1, %sh_prom
  %conv58 = sext i32 %shl to i64
  store i64 %conv58, i64* @N, align 8, !tbaa !0
  %div59 = sdiv i64 %8, 2
  %sh_prom60 = trunc i64 %div59 to i32
  %shl61 = shl i32 1, %sh_prom60
  %conv62 = sext i32 %shl61 to i64
  store i64 %conv62, i64* @rootN, align 8, !tbaa !0
  %9 = load i64* @P, align 8, !tbaa !0
  %div63 = sdiv i64 %conv62, %9
  store i64 %div63, i64* @rowsperproc, align 8, !tbaa !0
  %cmp64 = icmp eq i64 %div63, 0
  br i1 %cmp64, label %if.then66, label %if.end67

if.then66:                                        ; preds = %while.end
  %10 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !3
  %call.i258 = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %10, i8* getelementptr inbounds ([11 x i8]* @.str49, i64 0, i64 0), i8* getelementptr inbounds ([48 x i8]* @.str19, i64 0, i64 0)) #8
  tail call void @exit(i32 -1) #9
  unreachable

if.end67:                                         ; preds = %while.end
  %11 = load i64* @log2_line_size, align 8, !tbaa !0
  %sh_prom68 = trunc i64 %11 to i32
  %shl69 = shl i32 1, %sh_prom68
  %conv70 = sext i32 %shl69 to i64
  store i64 %conv70, i64* @line_size, align 8, !tbaa !0
  %cmp71 = icmp ult i32 %sh_prom68, 4
  br i1 %cmp71, label %if.then73, label %if.end79

if.then73:                                        ; preds = %if.end67
  %call74 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([55 x i8]* @.str20, i64 0, i64 0), i64 16) #8
  %puts240 = tail call i32 @puts(i8* getelementptr inbounds ([42 x i8]* @str60, i64 0, i64 0))
  %puts241 = tail call i32 @puts(i8* getelementptr inbounds ([41 x i8]* @str61, i64 0, i64 0))
  %12 = load i64* @line_size, align 8, !tbaa !0
  %div77 = udiv i64 16, %12
  %13 = load i64* @orig_num_lines, align 8, !tbaa !0
  %div78 = sdiv i64 %13, %div77
  store i64 %div78, i64* @num_cache_lines, align 8, !tbaa !0
  %.pre = load i64* @rowsperproc, align 8, !tbaa !0
  %.pre327 = load i64* @rootN, align 8, !tbaa !0
  br label %if.end79

if.end79:                                         ; preds = %if.then73, %if.end67
  %14 = phi i64 [ %.pre327, %if.then73 ], [ %conv62, %if.end67 ]
  %15 = phi i64 [ %.pre, %if.then73 ], [ %div63, %if.end67 ]
  %16 = phi i64 [ %12, %if.then73 ], [ %conv70, %if.end67 ]
  %cmp80 = icmp ult i64 %16, 17
  %div83 = lshr i64 %16, 4
  %storemerge = select i1 %cmp80, i64 1, i64 %div83
  store i64 %storemerge, i64* @pad_length, align 8, !tbaa !0
  %mul85 = shl i64 %15, 4
  %mul87 = mul i64 %mul85, %14
  %cmp88 = icmp ugt i64 %mul87, 4095
  br i1 %cmp88, label %if.then90, label %if.else106

if.then90:                                        ; preds = %if.end79
  %mul92 = shl nuw i64 %storemerge, 4
  %mul93 = mul i64 %mul92, %15
  %div94 = lshr i64 %mul93, 12
  %mul95 = shl nuw nsw i64 %div94, 12
  %not.cmp99 = icmp ne i64 %mul95, %mul93
  %inc = zext i1 %not.cmp99 to i64
  %div94.inc = add nsw i64 %inc, %div94
  %mul103 = shl nsw i64 %div94.inc, 12
  %div105 = udiv i64 %mul103, %mul85
  store i64 %div105, i64* @pad_length, align 8, !tbaa !0
  br label %if.end122

if.else106:                                       ; preds = %if.end79
  %sub = sub i64 4096, %mul87
  %div111 = udiv i64 %sub, %mul85
  store i64 %div111, i64* @pad_length, align 8, !tbaa !0
  %mul112 = shl i64 %div111, 4
  %mul113 = mul i64 %mul112, %15
  %cmp118 = icmp eq i64 %mul113, %sub
  br i1 %cmp118, label %if.end122, label %if.then120

if.then120:                                       ; preds = %if.else106
  %17 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !3
  %call.i259 = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %17, i8* getelementptr inbounds ([11 x i8]* @.str49, i64 0, i64 0), i8* getelementptr inbounds ([32 x i8]* @.str23, i64 0, i64 0)) #8
  tail call void @exit(i32 -1) #9
  unreachable

if.end122:                                        ; preds = %if.else106, %if.then90
  %18 = phi i64 [ %div111, %if.else106 ], [ %div105, %if.then90 ]
  %19 = load i64* @N, align 8, !tbaa !0
  %mul123 = mul nsw i64 %18, %14
  %add = add nsw i64 %mul123, %19
  %mul125 = shl i64 %add, 4
  %add126 = add i64 %mul125, 4096
  %call127 = tail call i8* @valloc(i64 %add126) #8
  %20 = bitcast i8* %call127 to double*
  store double* %20, double** @x, align 8, !tbaa !3
  %call133 = tail call i8* @valloc(i64 %add126) #8
  %21 = bitcast i8* %call133 to double*
  store double* %21, double** @trans, align 8, !tbaa !3
  %mul135 = shl i64 %14, 4
  %call136 = tail call i8* @valloc(i64 %mul135) #8
  %22 = bitcast i8* %call136 to double*
  store double* %22, double** @umain, align 8, !tbaa !3
  %call142 = tail call i8* @valloc(i64 %add126) #8
  %23 = bitcast i8* %call142 to double*
  store double* %23, double** @umain2, align 8, !tbaa !3
  %cmp143 = icmp eq i8* %call127, null
  br i1 %cmp143, label %if.then145, label %if.else146

if.then145:                                       ; preds = %if.end122
  %24 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !3
  %call.i260 = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %24, i8* getelementptr inbounds ([11 x i8]* @.str49, i64 0, i64 0), i8* getelementptr inbounds ([31 x i8]* @.str24, i64 0, i64 0)) #8
  tail call void @exit(i32 -1) #9
  unreachable

if.else146:                                       ; preds = %if.end122
  %cmp147 = icmp eq i8* %call133, null
  br i1 %cmp147, label %if.then149, label %if.else150

if.then149:                                       ; preds = %if.else146
  %25 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !3
  %call.i261 = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %25, i8* getelementptr inbounds ([11 x i8]* @.str49, i64 0, i64 0), i8* getelementptr inbounds ([35 x i8]* @.str25, i64 0, i64 0)) #8
  tail call void @exit(i32 -1) #9
  unreachable

if.else150:                                       ; preds = %if.else146
  %cmp151 = icmp eq i8* %call136, null
  br i1 %cmp151, label %if.then153, label %if.else154

if.then153:                                       ; preds = %if.else150
  %26 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !3
  %call.i262 = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %26, i8* getelementptr inbounds ([11 x i8]* @.str49, i64 0, i64 0), i8* getelementptr inbounds ([35 x i8]* @.str26, i64 0, i64 0)) #8
  tail call void @exit(i32 -1) #9
  unreachable

if.else154:                                       ; preds = %if.else150
  %cmp155 = icmp eq i8* %call142, null
  br i1 %cmp155, label %if.then157, label %if.end161

if.then157:                                       ; preds = %if.else154
  %27 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !3
  %call.i263 = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %27, i8* getelementptr inbounds ([11 x i8]* @.str49, i64 0, i64 0), i8* getelementptr inbounds ([36 x i8]* @.str27, i64 0, i64 0)) #8
  tail call void @exit(i32 -1) #9
  unreachable

if.end161:                                        ; preds = %if.else154
  %28 = ptrtoint i8* %call127 to i64
  %add162 = add i64 %28, 4096
  %rem = and i64 %28, 4095
  %sub163 = sub i64 %add162, %rem
  %29 = inttoptr i64 %sub163 to double*
  store double* %29, double** @x, align 8, !tbaa !3
  %30 = ptrtoint i8* %call133 to i64
  %add164 = add i64 %30, 4096
  %rem165 = and i64 %30, 4095
  %sub166 = sub i64 %add164, %rem165
  %31 = inttoptr i64 %sub166 to double*
  store double* %31, double** @trans, align 8, !tbaa !3
  %32 = ptrtoint i8* %call142 to i64
  %add167 = add i64 %32, 4096
  %rem168 = and i64 %32, 4095
  %sub169 = sub i64 %add167, %rem168
  %33 = inttoptr i64 %sub169 to double*
  store double* %33, double** @umain2, align 8, !tbaa !3
  %putchar = tail call i32 @putchar(i32 10) #8
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([28 x i8]* @str, i64 0, i64 0))
  %34 = load i64* @N, align 8, !tbaa !0
  %call172 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([24 x i8]* @.str30, i64 0, i64 0), i64 %34) #8
  %35 = load i64* @P, align 8, !tbaa !0
  %call173 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str31, i64 0, i64 0), i64 %35) #8
  %36 = load i64* @num_cache_lines, align 8, !tbaa !0
  %37 = load i64* @orig_num_lines, align 8, !tbaa !0
  %cmp174 = icmp eq i64 %36, %37
  br i1 %cmp174, label %if.else179, label %if.then176

if.then176:                                       ; preds = %if.end161
  %call177 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str32, i64 0, i64 0), i64 %37) #8
  %38 = load i64* @num_cache_lines, align 8, !tbaa !0
  %call178 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([43 x i8]* @.str33, i64 0, i64 0), i64 %38) #8
  br label %if.end181

if.else179:                                       ; preds = %if.end161
  %call180 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str32, i64 0, i64 0), i64 %36) #8
  br label %if.end181

if.end181:                                        ; preds = %if.else179, %if.then176
  %39 = load i64* @log2_line_size, align 8, !tbaa !0
  %sh_prom182 = trunc i64 %39 to i32
  %shl183 = shl i32 1, %sh_prom182
  %call184 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str34, i64 0, i64 0), i32 %shl183) #8
  %call185 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str35, i64 0, i64 0), i32 4096) #8
  %putchar229 = tail call i32 @putchar(i32 10) #8
  %40 = load double** @x, align 8, !tbaa !3
  tail call void @srand48(i64 0) #8
  %41 = load i64* @rootN, align 8, !tbaa !0
  %cmp24.i = icmp sgt i64 %41, 0
  br i1 %cmp24.i, label %for.body.i, label %InitX.exit

for.body.i:                                       ; preds = %for.inc11.i, %if.end181
  %42 = phi i64 [ %46, %for.inc11.i ], [ %41, %if.end181 ]
  %43 = phi i64 [ %47, %for.inc11.i ], [ %41, %if.end181 ]
  %j.025.i = phi i64 [ %inc12.i, %for.inc11.i ], [ 0, %if.end181 ]
  %44 = load i64* @pad_length, align 8, !tbaa !0
  %add.i = add nsw i64 %44, %43
  %mul.i264 = mul nsw i64 %add.i, %j.025.i
  %cmp222.i = icmp sgt i64 %43, 0
  br i1 %cmp222.i, label %for.body3.i, label %for.inc11.i

for.body3.i:                                      ; preds = %for.body3.i, %for.body.i
  %i.023.i = phi i64 [ %inc.i266, %for.body3.i ], [ 0, %for.body.i ]
  %call.i265 = tail call double @drand48() #8
  %add4.i = add nsw i64 %i.023.i, %mul.i264
  %mul5.i = shl nsw i64 %add4.i, 1
  %arrayidx.i = getelementptr inbounds double* %40, i64 %mul5.i
  store double %call.i265, double* %arrayidx.i, align 8, !tbaa !4
  %call6.i = tail call double @drand48() #8
  %add921.i = or i64 %mul5.i, 1
  %arrayidx10.i = getelementptr inbounds double* %40, i64 %add921.i
  store double %call6.i, double* %arrayidx10.i, align 8, !tbaa !4
  %inc.i266 = add nsw i64 %i.023.i, 1
  %45 = load i64* @rootN, align 8, !tbaa !0
  %cmp2.i267 = icmp slt i64 %inc.i266, %45
  br i1 %cmp2.i267, label %for.body3.i, label %for.inc11.i

for.inc11.i:                                      ; preds = %for.body3.i, %for.body.i
  %46 = phi i64 [ %42, %for.body.i ], [ %45, %for.body3.i ]
  %47 = phi i64 [ %43, %for.body.i ], [ %45, %for.body3.i ]
  %inc12.i = add nsw i64 %j.025.i, 1
  %cmp.i268 = icmp slt i64 %inc12.i, %47
  br i1 %cmp.i268, label %for.body.i, label %InitX.exit

InitX.exit:                                       ; preds = %for.inc11.i, %if.end181
  %48 = phi i64 [ %41, %if.end181 ], [ %46, %for.inc11.i ]
  %49 = load i64* @test_result, align 8, !tbaa !0
  %tobool187 = icmp eq i64 %49, 0
  br i1 %tobool187, label %if.end190, label %if.then188

if.then188:                                       ; preds = %InitX.exit
  %50 = load double** @x, align 8, !tbaa !3
  %cmp27.i269 = icmp sgt i64 %48, 0
  br i1 %cmp27.i269, label %for.body.lr.ph.split.us.i270, label %CheckSum.exit292

for.body.lr.ph.split.us.i270:                     ; preds = %if.then188
  %51 = load i64* @pad_length, align 8, !tbaa !0
  %add.us.i288 = add nsw i64 %51, %48
  br label %for.body3.lr.ph.us.i290

for.inc12.us.i273:                                ; preds = %for.body3.us.i285
  %inc13.us.i271 = add nsw i64 %j.028.us.i287, 1
  %exitcond31.i272 = icmp eq i64 %inc13.us.i271, %48
  br i1 %exitcond31.i272, label %CheckSum.exit292, label %for.body3.lr.ph.us.i290

for.body3.us.i285:                                ; preds = %for.body3.lr.ph.us.i290, %for.body3.us.i285
  %cks.126.us.i274 = phi double [ %cks.029.us.i286, %for.body3.lr.ph.us.i290 ], [ %add11.us.i282, %for.body3.us.i285 ]
  %i.025.us.i275 = phi i64 [ 0, %for.body3.lr.ph.us.i290 ], [ %inc.us.i283, %for.body3.us.i285 ]
  %add4.us.i276 = add nsw i64 %i.025.us.i275, %mul.us.i289
  %mul5.us.i277 = shl nsw i64 %add4.us.i276, 1
  %arrayidx.us.i278 = getelementptr inbounds double* %50, i64 %mul5.us.i277
  %52 = load double* %arrayidx.us.i278, align 8, !tbaa !4
  %add823.us.i279 = or i64 %mul5.us.i277, 1
  %arrayidx9.us.i280 = getelementptr inbounds double* %50, i64 %add823.us.i279
  %53 = load double* %arrayidx9.us.i280, align 8, !tbaa !4
  %add10.us.i281 = fadd double %52, %53
  %add11.us.i282 = fadd double %cks.126.us.i274, %add10.us.i281
  %inc.us.i283 = add nsw i64 %i.025.us.i275, 1
  %exitcond.i284 = icmp eq i64 %inc.us.i283, %48
  br i1 %exitcond.i284, label %for.inc12.us.i273, label %for.body3.us.i285

for.body3.lr.ph.us.i290:                          ; preds = %for.inc12.us.i273, %for.body.lr.ph.split.us.i270
  %cks.029.us.i286 = phi double [ 0.000000e+00, %for.body.lr.ph.split.us.i270 ], [ %add11.us.i282, %for.inc12.us.i273 ]
  %j.028.us.i287 = phi i64 [ 0, %for.body.lr.ph.split.us.i270 ], [ %inc13.us.i271, %for.inc12.us.i273 ]
  %mul.us.i289 = mul nsw i64 %j.028.us.i287, %add.us.i288
  br label %for.body3.us.i285

CheckSum.exit292:                                 ; preds = %for.inc12.us.i273, %if.then188
  %cks.0.lcssa.i291 = phi double [ 0.000000e+00, %if.then188 ], [ %add11.us.i282, %for.inc12.us.i273 ]
  store double %cks.0.lcssa.i291, double* @ck1, align 8, !tbaa !4
  br label %if.end190

if.end190:                                        ; preds = %CheckSum.exit292, %InitX.exit
  %54 = load i64* @doprint, align 8, !tbaa !0
  %tobool191 = icmp eq i64 %54, 0
  br i1 %tobool191, label %if.end194, label %if.then192

if.then192:                                       ; preds = %if.end190
  %puts239 = tail call i32 @puts(i8* getelementptr inbounds ([22 x i8]* @str59, i64 0, i64 0))
  %55 = load i64* @N, align 8, !tbaa !0
  %56 = load double** @x, align 8, !tbaa !3
  tail call void @PrintArray(i64 %55, double* %56)
  br label %if.end194

if.end194:                                        ; preds = %if.then192, %if.end190
  %57 = load i64* @N, align 8, !tbaa !0
  %58 = load double** @umain, align 8, !tbaa !3
  %cmp49.i = icmp sgt i64 %57, 1
  %59 = load i64* @rootN, align 8, !tbaa !0
  br i1 %cmp49.i, label %for.body.lr.ph.i, label %InitU.exit

for.body.lr.ph.i:                                 ; preds = %if.end194
  %sub9.i = add nsw i64 %59, -1
  br label %for.body.i293

for.body.i293:                                    ; preds = %for.inc28.i, %for.body.lr.ph.i
  %conv51.i = phi i64 [ 1, %for.body.lr.ph.i ], [ %conv.i, %for.inc28.i ]
  %q.050.i = phi i64 [ 0, %for.body.lr.ph.i ], [ %inc29.i, %for.inc28.i ]
  %sub.i = add nsw i64 %conv51.i, -1
  %cmp646.i = icmp sgt i64 %conv51.i, 0
  br i1 %cmp646.i, label %for.body8.lr.ph.i, label %for.inc28.i

for.body8.lr.ph.i:                                ; preds = %for.body.i293
  %mul13.i = shl nsw i64 %conv51.i, 1
  %conv14.i = sitofp i64 %mul13.i to double
  br label %for.body8.i

for.body8.i:                                      ; preds = %if.end.i, %for.body8.lr.ph.i
  %j.047.i = phi i64 [ 0, %for.body8.lr.ph.i ], [ %inc.i298, %if.end.i ]
  %add.i294 = add nsw i64 %sub.i, %j.047.i
  %cmp10.i = icmp sgt i64 %add.i294, %sub9.i
  br i1 %cmp10.i, label %InitU.exit, label %if.end.i

if.end.i:                                         ; preds = %for.body8.i
  %conv12.i = sitofp i64 %j.047.i to double
  %mul.i295 = fmul double %conv12.i, 6.283200e+00
  %div.i = fdiv double %mul.i295, %conv14.i
  %call.i296 = tail call double @cos(double %div.i) #10
  %mul16.i = shl nsw i64 %add.i294, 1
  %arrayidx.i297 = getelementptr inbounds double* %58, i64 %mul16.i
  store double %call.i296, double* %arrayidx.i297, align 8, !tbaa !4
  %call22.i = tail call double @sin(double %div.i) #10
  %sub23.i = fsub double -0.000000e+00, %call22.i
  %add2645.i = or i64 %mul16.i, 1
  %arrayidx27.i = getelementptr inbounds double* %58, i64 %add2645.i
  store double %sub23.i, double* %arrayidx27.i, align 8, !tbaa !4
  %inc.i298 = add nsw i64 %j.047.i, 1
  %cmp6.i = icmp slt i64 %inc.i298, %conv51.i
  br i1 %cmp6.i, label %for.body8.i, label %for.inc28.i

for.inc28.i:                                      ; preds = %if.end.i, %for.body.i293
  %inc29.i = add nsw i64 %q.050.i, 1
  %sh_prom.i = trunc i64 %inc29.i to i32
  %shl.i = shl i32 1, %sh_prom.i
  %conv.i = sext i32 %shl.i to i64
  %cmp.i299 = icmp slt i64 %conv.i, %57
  br i1 %cmp.i299, label %for.body.i293, label %InitU.exit

InitU.exit:                                       ; preds = %for.inc28.i, %for.body8.i, %if.end194
  %60 = load double** @umain2, align 8, !tbaa !3
  %cmp40.i = icmp sgt i64 %59, 0
  br i1 %cmp40.i, label %for.body.lr.ph.split.us.i301, label %InitU2.exit

for.body.lr.ph.split.us.i301:                     ; preds = %InitU.exit
  %61 = load i64* @pad_length, align 8, !tbaa !0
  %add.i300 = add nsw i64 %61, %59
  %conv7.i = sitofp i64 %57 to double
  br label %for.body3.lr.ph.us.i307

for.inc21.us.i:                                   ; preds = %for.body3.us.i305
  %inc22.us.i = add nsw i64 %j.041.us.i, 1
  %exitcond42.i = icmp eq i64 %inc22.us.i, %59
  br i1 %exitcond42.i, label %InitU2.exit, label %for.body3.lr.ph.us.i307

for.body3.us.i305:                                ; preds = %for.body3.lr.ph.us.i307, %for.body3.us.i305
  %i.039.us.i = phi i64 [ 0, %for.body3.lr.ph.us.i307 ], [ %inc.us.i303, %for.body3.us.i305 ]
  %conv.us.i = sitofp i64 %i.039.us.i to double
  %mul4.us.i = fmul double %conv.us.i, 6.283200e+00
  %mul6.us.i = fmul double %conv5.us.i, %mul4.us.i
  %div.us.i = fdiv double %mul6.us.i, %conv7.i
  %call.us.i = tail call double @cos(double %div.us.i) #10
  %add8.us.i = add nsw i64 %i.039.us.i, %mul.us.i306
  %mul9.us.i = shl nsw i64 %add8.us.i, 1
  %arrayidx.us.i302 = getelementptr inbounds double* %60, i64 %mul9.us.i
  store double %call.us.i, double* %arrayidx.us.i302, align 8, !tbaa !4
  %call16.us.i = tail call double @sin(double %div.us.i) #10
  %sub.us.i = fsub double -0.000000e+00, %call16.us.i
  %add1937.us.i = or i64 %mul9.us.i, 1
  %arrayidx20.us.i = getelementptr inbounds double* %60, i64 %add1937.us.i
  store double %sub.us.i, double* %arrayidx20.us.i, align 8, !tbaa !4
  %inc.us.i303 = add nsw i64 %i.039.us.i, 1
  %exitcond.i304 = icmp eq i64 %inc.us.i303, %59
  br i1 %exitcond.i304, label %for.inc21.us.i, label %for.body3.us.i305

for.body3.lr.ph.us.i307:                          ; preds = %for.inc21.us.i, %for.body.lr.ph.split.us.i301
  %j.041.us.i = phi i64 [ 0, %for.body.lr.ph.split.us.i301 ], [ %inc22.us.i, %for.inc21.us.i ]
  %mul.us.i306 = mul nsw i64 %j.041.us.i, %add.i300
  %conv5.us.i = sitofp i64 %j.041.us.i to double
  br label %for.body3.us.i305

InitU2.exit:                                      ; preds = %for.inc21.us.i, %InitU.exit
  tail call void @SlaveStart()
  %62 = load i64* @doprint, align 8, !tbaa !0
  %tobool195 = icmp eq i64 %62, 0
  br i1 %tobool195, label %if.end203, label %if.then196

if.then196:                                       ; preds = %InitU2.exit
  %63 = load i64* @test_result, align 8, !tbaa !0
  %tobool197 = icmp eq i64 %63, 0
  br i1 %tobool197, label %if.else200, label %if.then198

if.then198:                                       ; preds = %if.then196
  %puts238 = tail call i32 @puts(i8* getelementptr inbounds ([31 x i8]* @str58, i64 0, i64 0))
  br label %if.end202

if.else200:                                       ; preds = %if.then196
  %puts237 = tail call i32 @puts(i8* getelementptr inbounds ([23 x i8]* @str57, i64 0, i64 0))
  br label %if.end202

if.end202:                                        ; preds = %if.else200, %if.then198
  %64 = load i64* @N, align 8, !tbaa !0
  %65 = load double** @x, align 8, !tbaa !3
  tail call void @PrintArray(i64 %64, double* %65)
  br label %if.end203

if.end203:                                        ; preds = %if.end202, %InitU2.exit
  %putchar230 = tail call i32 @putchar(i32 10) #8
  %puts231 = tail call i32 @puts(i8* getelementptr inbounds ([36 x i8]* @str51, i64 0, i64 0))
  %puts232 = tail call i32 @puts(i8* getelementptr inbounds ([53 x i8]* @str52, i64 0, i64 0))
  %puts233 = tail call i32 @puts(i8* getelementptr inbounds ([52 x i8]* @str53, i64 0, i64 0))
  %66 = load i64* @test_result, align 8, !tbaa !0
  %tobool208 = icmp eq i64 %66, 0
  br i1 %tobool208, label %if.end223, label %if.then209

if.then209:                                       ; preds = %if.end203
  %67 = load double** @x, align 8, !tbaa !3
  %68 = load i64* @rootN, align 8, !tbaa !0
  %cmp27.i = icmp sgt i64 %68, 0
  br i1 %cmp27.i, label %for.body.lr.ph.split.us.i, label %CheckSum.exit

for.body.lr.ph.split.us.i:                        ; preds = %if.then209
  %69 = load i64* @pad_length, align 8, !tbaa !0
  %add.us.i = add nsw i64 %69, %68
  br label %for.body3.lr.ph.us.i

for.inc12.us.i:                                   ; preds = %for.body3.us.i
  %inc13.us.i = add nsw i64 %j.028.us.i, 1
  %exitcond31.i = icmp eq i64 %inc13.us.i, %68
  br i1 %exitcond31.i, label %CheckSum.exit, label %for.body3.lr.ph.us.i

for.body3.us.i:                                   ; preds = %for.body3.lr.ph.us.i, %for.body3.us.i
  %cks.126.us.i = phi double [ %cks.029.us.i, %for.body3.lr.ph.us.i ], [ %add11.us.i, %for.body3.us.i ]
  %i.025.us.i = phi i64 [ 0, %for.body3.lr.ph.us.i ], [ %inc.us.i, %for.body3.us.i ]
  %add4.us.i = add nsw i64 %i.025.us.i, %mul.us.i
  %mul5.us.i = shl nsw i64 %add4.us.i, 1
  %arrayidx.us.i = getelementptr inbounds double* %67, i64 %mul5.us.i
  %70 = load double* %arrayidx.us.i, align 8, !tbaa !4
  %add823.us.i = or i64 %mul5.us.i, 1
  %arrayidx9.us.i = getelementptr inbounds double* %67, i64 %add823.us.i
  %71 = load double* %arrayidx9.us.i, align 8, !tbaa !4
  %add10.us.i = fadd double %70, %71
  %add11.us.i = fadd double %cks.126.us.i, %add10.us.i
  %inc.us.i = add nsw i64 %i.025.us.i, 1
  %exitcond.i = icmp eq i64 %inc.us.i, %68
  br i1 %exitcond.i, label %for.inc12.us.i, label %for.body3.us.i

for.body3.lr.ph.us.i:                             ; preds = %for.inc12.us.i, %for.body.lr.ph.split.us.i
  %cks.029.us.i = phi double [ 0.000000e+00, %for.body.lr.ph.split.us.i ], [ %add11.us.i, %for.inc12.us.i ]
  %j.028.us.i = phi i64 [ 0, %for.body.lr.ph.split.us.i ], [ %inc13.us.i, %for.inc12.us.i ]
  %mul.us.i = mul nsw i64 %j.028.us.i, %add.us.i
  br label %for.body3.us.i

CheckSum.exit:                                    ; preds = %for.inc12.us.i, %if.then209
  %cks.0.lcssa.i = phi double [ 0.000000e+00, %if.then209 ], [ %add11.us.i, %for.inc12.us.i ]
  store double %cks.0.lcssa.i, double* @ck3, align 8, !tbaa !4
  %puts234 = tail call i32 @puts(i8* getelementptr inbounds ([39 x i8]* @str54, i64 0, i64 0))
  %72 = load double* @ck1, align 8, !tbaa !4
  %73 = load double* @ck3, align 8, !tbaa !4
  %sub212 = fsub double %72, %73
  %call213 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([42 x i8]* @.str43, i64 0, i64 0), double %sub212, double %72, double %73) #8
  %74 = load double* @ck1, align 8, !tbaa !4
  %75 = load double* @ck3, align 8, !tbaa !4
  %sub214 = fsub double %74, %75
  %call215 = tail call double @fabs(double %sub214) #10
  %cmp216 = fcmp olt double %call215, 1.000000e-03
  br i1 %cmp216, label %if.then218, label %if.else220

if.then218:                                       ; preds = %CheckSum.exit
  %puts236 = tail call i32 @puts(i8* getelementptr inbounds ([12 x i8]* @str56, i64 0, i64 0))
  br label %if.end223

if.else220:                                       ; preds = %CheckSum.exit
  %puts235 = tail call i32 @puts(i8* getelementptr inbounds ([12 x i8]* @str55, i64 0, i64 0))
  br label %if.end223

if.end223:                                        ; preds = %if.else220, %if.then218, %if.end203
  ret i32 0
}

declare i32 @"\01_getopt"(i32, i8**, i8*) #1

; Function Attrs: nounwind readonly
declare i32 @atoi(i8* nocapture) #2

; Function Attrs: nounwind ssp uwtable
define void @printerr(i8* %s) #0 {
entry:
  %0 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !3
  %call = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %0, i8* getelementptr inbounds ([11 x i8]* @.str49, i64 0, i64 0), i8* %s) #8
  ret void
}

; Function Attrs: noreturn
declare void @exit(i32) #3

; Function Attrs: nounwind readnone ssp uwtable
define i64 @log_2(i64 %number) #4 {
entry:
  br label %while.cond.outer

while.cond.outer:                                 ; preds = %if.else, %entry
  %cumulative.0.ph = phi i64 [ 1, %entry ], [ %mul, %if.else ]
  %out.0.ph = phi i64 [ 0, %entry ], [ %inc, %if.else ]
  %cmp = icmp slt i64 %cumulative.0.ph, %number
  %cmp2 = icmp eq i64 %cumulative.0.ph, %number
  br i1 %cmp, label %while.cond.outer.split.us, label %while.cond.outer.while.cond.outer.split_crit_edge

while.cond.outer.while.cond.outer.split_crit_edge: ; preds = %while.cond.outer
  br label %while.end

while.cond.outer.split.us:                        ; preds = %while.cond.outer
  %cmp1 = icmp slt i64 %out.0.ph, 50
  br i1 %cmp1, label %while.cond.outer.split.us.split.us, label %while.cond.outer.split.us.while.cond.outer.split.us.split_crit_edge

while.cond.outer.split.us.while.cond.outer.split.us.split_crit_edge: ; preds = %while.cond.outer.split.us
  br label %while.end

while.cond.outer.split.us.split.us:               ; preds = %while.cond.outer.split.us
  br i1 %cmp2, label %while.end, label %if.else

if.else:                                          ; preds = %while.cond.outer.split.us.split.us
  %mul = shl nsw i64 %cumulative.0.ph, 1
  %inc = add nsw i64 %out.0.ph, 1
  br label %while.cond.outer

while.end:                                        ; preds = %while.cond.outer.split.us.split.us, %while.cond.outer.split.us.while.cond.outer.split.us.split_crit_edge, %while.cond.outer.while.cond.outer.split_crit_edge
  %cmp245 = phi i1 [ %cmp2, %while.cond.outer.split.us.while.cond.outer.split.us.split_crit_edge ], [ %cmp2, %while.cond.outer.while.cond.outer.split_crit_edge ], [ true, %while.cond.outer.split.us.split.us ]
  %out.0. = select i1 %cmp245, i64 %out.0.ph, i64 -1
  ret i64 %out.0.
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture, ...) #5

; Function Attrs: nounwind
declare noalias i8* @valloc(i64) #5

; Function Attrs: nounwind ssp uwtable
define void @InitX(double* nocapture %x) #0 {
entry:
  tail call void @srand48(i64 0) #8
  %0 = load i64* @rootN, align 8, !tbaa !0
  %cmp24 = icmp sgt i64 %0, 0
  br i1 %cmp24, label %for.body, label %for.end13

for.body:                                         ; preds = %for.inc11, %entry
  %1 = phi i64 [ %4, %for.inc11 ], [ %0, %entry ]
  %j.025 = phi i64 [ %inc12, %for.inc11 ], [ 0, %entry ]
  %2 = load i64* @pad_length, align 8, !tbaa !0
  %add = add nsw i64 %2, %1
  %mul = mul nsw i64 %add, %j.025
  %cmp222 = icmp sgt i64 %1, 0
  br i1 %cmp222, label %for.body3, label %for.inc11

for.body3:                                        ; preds = %for.body3, %for.body
  %i.023 = phi i64 [ %inc, %for.body3 ], [ 0, %for.body ]
  %call = tail call double @drand48() #8
  %add4 = add nsw i64 %i.023, %mul
  %mul5 = shl nsw i64 %add4, 1
  %arrayidx = getelementptr inbounds double* %x, i64 %mul5
  store double %call, double* %arrayidx, align 8, !tbaa !4
  %call6 = tail call double @drand48() #8
  %add921 = or i64 %mul5, 1
  %arrayidx10 = getelementptr inbounds double* %x, i64 %add921
  store double %call6, double* %arrayidx10, align 8, !tbaa !4
  %inc = add nsw i64 %i.023, 1
  %3 = load i64* @rootN, align 8, !tbaa !0
  %cmp2 = icmp slt i64 %inc, %3
  br i1 %cmp2, label %for.body3, label %for.inc11

for.inc11:                                        ; preds = %for.body3, %for.body
  %4 = phi i64 [ %1, %for.body ], [ %3, %for.body3 ]
  %inc12 = add nsw i64 %j.025, 1
  %cmp = icmp slt i64 %inc12, %4
  br i1 %cmp, label %for.body, label %for.end13

for.end13:                                        ; preds = %for.inc11, %entry
  ret void
}

; Function Attrs: nounwind readonly ssp uwtable
define double @CheckSum(double* nocapture %x) #6 {
entry:
  %0 = load i64* @rootN, align 8, !tbaa !0
  %cmp27 = icmp sgt i64 %0, 0
  br i1 %cmp27, label %for.body.lr.ph.split.us, label %for.end14

for.body.lr.ph.split.us:                          ; preds = %entry
  %1 = load i64* @pad_length, align 8, !tbaa !0
  br label %for.body3.lr.ph.us

for.inc12.us:                                     ; preds = %for.body3.us
  %inc13.us = add nsw i64 %j.028.us, 1
  %exitcond31 = icmp eq i64 %inc13.us, %0
  br i1 %exitcond31, label %for.end14, label %for.body3.lr.ph.us

for.body3.us:                                     ; preds = %for.body3.lr.ph.us, %for.body3.us
  %cks.126.us = phi double [ %cks.029.us, %for.body3.lr.ph.us ], [ %add11.us, %for.body3.us ]
  %i.025.us = phi i64 [ 0, %for.body3.lr.ph.us ], [ %inc.us, %for.body3.us ]
  %add4.us = add nsw i64 %i.025.us, %mul.us
  %mul5.us = shl nsw i64 %add4.us, 1
  %arrayidx.us = getelementptr inbounds double* %x, i64 %mul5.us
  %2 = load double* %arrayidx.us, align 8, !tbaa !4
  %add823.us = or i64 %mul5.us, 1
  %arrayidx9.us = getelementptr inbounds double* %x, i64 %add823.us
  %3 = load double* %arrayidx9.us, align 8, !tbaa !4
  %add10.us = fadd double %2, %3
  %add11.us = fadd double %cks.126.us, %add10.us
  %inc.us = add nsw i64 %i.025.us, 1
  %exitcond = icmp eq i64 %inc.us, %0
  br i1 %exitcond, label %for.inc12.us, label %for.body3.us

for.body3.lr.ph.us:                               ; preds = %for.inc12.us, %for.body.lr.ph.split.us
  %cks.029.us = phi double [ 0.000000e+00, %for.body.lr.ph.split.us ], [ %add11.us, %for.inc12.us ]
  %j.028.us = phi i64 [ 0, %for.body.lr.ph.split.us ], [ %inc13.us, %for.inc12.us ]
  %add.us = add nsw i64 %1, %0
  %mul.us = mul nsw i64 %add.us, %j.028.us
  br label %for.body3.us

for.end14:                                        ; preds = %for.inc12.us, %entry
  %cks.0.lcssa = phi double [ 0.000000e+00, %entry ], [ %add11.us, %for.inc12.us ]
  ret double %cks.0.lcssa
}

; Function Attrs: nounwind ssp uwtable
define void @PrintArray(i64 %N, double* nocapture %x) #0 {
entry:
  %0 = load i64* @rootN, align 8, !tbaa !0
  %cmp44 = icmp sgt i64 %0, 0
  br i1 %cmp44, label %for.body.lr.ph, label %for.end23

for.body.lr.ph:                                   ; preds = %entry
  %sub = add nsw i64 %N, -1
  br label %for.body

for.body:                                         ; preds = %for.inc21, %for.body.lr.ph
  %1 = phi i64 [ %0, %for.body.lr.ph ], [ %8, %for.inc21 ]
  %i.045 = phi i64 [ 0, %for.body.lr.ph ], [ %inc22, %for.inc21 ]
  %2 = load i64* @pad_length, align 8, !tbaa !0
  %add = add nsw i64 %2, %1
  %mul = mul nsw i64 %add, %i.045
  %cmp242 = icmp sgt i64 %1, 0
  br i1 %cmp242, label %for.body3, label %for.inc21

for.body3:                                        ; preds = %for.inc, %for.body
  %j.043 = phi i64 [ %add15, %for.inc ], [ 0, %for.body ]
  %add4 = add nsw i64 %j.043, %mul
  %mul5 = shl nsw i64 %add4, 1
  %arrayidx = getelementptr inbounds double* %x, i64 %mul5
  %3 = load double* %arrayidx, align 8, !tbaa !4
  %add838 = or i64 %mul5, 1
  %arrayidx9 = getelementptr inbounds double* %x, i64 %add838
  %4 = load double* %arrayidx9, align 8, !tbaa !4
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str47, i64 0, i64 0), double %3, double %4) #8
  %5 = load i64* @rootN, align 8, !tbaa !0
  %mul10 = mul nsw i64 %5, %i.045
  %add11 = add nsw i64 %mul10, %j.043
  %cmp12 = icmp eq i64 %add11, %sub
  br i1 %cmp12, label %if.end, label %if.then

if.then:                                          ; preds = %for.body3
  %putchar41 = tail call i32 @putchar(i32 44) #8
  %.pre = load i64* @rootN, align 8, !tbaa !0
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body3
  %6 = phi i64 [ %5, %for.body3 ], [ %.pre, %if.then ]
  %mul14 = mul nsw i64 %6, %i.045
  %add15 = add i64 %j.043, 1
  %add16 = add i64 %add15, %mul14
  %rem39 = and i64 %add16, 7
  %cmp17 = icmp eq i64 %rem39, 0
  br i1 %cmp17, label %if.then18, label %for.inc

if.then18:                                        ; preds = %if.end
  %putchar40 = tail call i32 @putchar(i32 10) #8
  %.pre47 = load i64* @rootN, align 8, !tbaa !0
  br label %for.inc

for.inc:                                          ; preds = %if.then18, %if.end
  %7 = phi i64 [ %6, %if.end ], [ %.pre47, %if.then18 ]
  %cmp2 = icmp slt i64 %add15, %7
  br i1 %cmp2, label %for.body3, label %for.inc21

for.inc21:                                        ; preds = %for.inc, %for.body
  %8 = phi i64 [ %1, %for.body ], [ %7, %for.inc ]
  %inc22 = add nsw i64 %i.045, 1
  %cmp = icmp slt i64 %inc22, %8
  br i1 %cmp, label %for.body, label %for.end23

for.end23:                                        ; preds = %for.inc21, %entry
  %putchar = tail call i32 @putchar(i32 10) #8
  %putchar37 = tail call i32 @putchar(i32 10) #8
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @InitU(i64 %N, double* nocapture %u) #0 {
entry:
  %cmp49 = icmp sgt i64 %N, 1
  br i1 %cmp49, label %for.body.lr.ph, label %for.end30

for.body.lr.ph:                                   ; preds = %entry
  %0 = load i64* @rootN, align 8, !tbaa !0
  %sub9 = add nsw i64 %0, -1
  br label %for.body

for.body:                                         ; preds = %for.inc28, %for.body.lr.ph
  %conv51 = phi i64 [ 1, %for.body.lr.ph ], [ %conv, %for.inc28 ]
  %q.050 = phi i64 [ 0, %for.body.lr.ph ], [ %inc29, %for.inc28 ]
  %sub = add nsw i64 %conv51, -1
  %cmp646 = icmp sgt i64 %conv51, 0
  br i1 %cmp646, label %for.body8.lr.ph, label %for.inc28

for.body8.lr.ph:                                  ; preds = %for.body
  %mul13 = shl nsw i64 %conv51, 1
  %conv14 = sitofp i64 %mul13 to double
  br label %for.body8

for.body8:                                        ; preds = %if.end, %for.body8.lr.ph
  %j.047 = phi i64 [ 0, %for.body8.lr.ph ], [ %inc, %if.end ]
  %add = add nsw i64 %sub, %j.047
  %cmp10 = icmp sgt i64 %add, %sub9
  br i1 %cmp10, label %for.end30, label %if.end

if.end:                                           ; preds = %for.body8
  %conv12 = sitofp i64 %j.047 to double
  %mul = fmul double %conv12, 6.283200e+00
  %div = fdiv double %mul, %conv14
  %call = tail call double @cos(double %div) #10
  %mul16 = shl nsw i64 %add, 1
  %arrayidx = getelementptr inbounds double* %u, i64 %mul16
  store double %call, double* %arrayidx, align 8, !tbaa !4
  %call22 = tail call double @sin(double %div) #10
  %sub23 = fsub double -0.000000e+00, %call22
  %add2645 = or i64 %mul16, 1
  %arrayidx27 = getelementptr inbounds double* %u, i64 %add2645
  store double %sub23, double* %arrayidx27, align 8, !tbaa !4
  %inc = add nsw i64 %j.047, 1
  %cmp6 = icmp slt i64 %inc, %conv51
  br i1 %cmp6, label %for.body8, label %for.inc28

for.inc28:                                        ; preds = %if.end, %for.body
  %inc29 = add nsw i64 %q.050, 1
  %sh_prom = trunc i64 %inc29 to i32
  %shl = shl i32 1, %sh_prom
  %conv = sext i32 %shl to i64
  %cmp = icmp slt i64 %conv, %N
  br i1 %cmp, label %for.body, label %for.end30

for.end30:                                        ; preds = %for.inc28, %for.body8, %entry
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @InitU2(i64 %N, double* nocapture %u, i64 %n1) #0 {
entry:
  %cmp40 = icmp sgt i64 %n1, 0
  br i1 %cmp40, label %for.body.lr.ph.split.us, label %for.end23

for.body.lr.ph.split.us:                          ; preds = %entry
  %0 = load i64* @rootN, align 8, !tbaa !0
  %1 = load i64* @pad_length, align 8, !tbaa !0
  %add = add nsw i64 %1, %0
  %conv7 = sitofp i64 %N to double
  br label %for.body3.lr.ph.us

for.inc21.us:                                     ; preds = %for.body3.us
  %inc22.us = add nsw i64 %j.041.us, 1
  %exitcond42 = icmp eq i64 %inc22.us, %n1
  br i1 %exitcond42, label %for.end23, label %for.body3.lr.ph.us

for.body3.us:                                     ; preds = %for.body3.lr.ph.us, %for.body3.us
  %i.039.us = phi i64 [ 0, %for.body3.lr.ph.us ], [ %inc.us, %for.body3.us ]
  %conv.us = sitofp i64 %i.039.us to double
  %mul4.us = fmul double %conv.us, 6.283200e+00
  %mul6.us = fmul double %conv5.us, %mul4.us
  %div.us = fdiv double %mul6.us, %conv7
  %call.us = tail call double @cos(double %div.us) #10
  %add8.us = add nsw i64 %i.039.us, %mul.us
  %mul9.us = shl nsw i64 %add8.us, 1
  %arrayidx.us = getelementptr inbounds double* %u, i64 %mul9.us
  store double %call.us, double* %arrayidx.us, align 8, !tbaa !4
  %call16.us = tail call double @sin(double %div.us) #10
  %sub.us = fsub double -0.000000e+00, %call16.us
  %add1937.us = or i64 %mul9.us, 1
  %arrayidx20.us = getelementptr inbounds double* %u, i64 %add1937.us
  store double %sub.us, double* %arrayidx20.us, align 8, !tbaa !4
  %inc.us = add nsw i64 %i.039.us, 1
  %exitcond = icmp eq i64 %inc.us, %n1
  br i1 %exitcond, label %for.inc21.us, label %for.body3.us

for.body3.lr.ph.us:                               ; preds = %for.inc21.us, %for.body.lr.ph.split.us
  %j.041.us = phi i64 [ 0, %for.body.lr.ph.split.us ], [ %inc22.us, %for.inc21.us ]
  %mul.us = mul nsw i64 %add, %j.041.us
  %conv5.us = sitofp i64 %j.041.us to double
  br label %for.body3.us

for.end23:                                        ; preds = %for.inc21.us, %entry
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @SlaveStart() #0 {
entry:
  %0 = load i64* @rootN, align 8, !tbaa !0
  %sub = shl i64 %0, 4
  %mul1 = add i64 %sub, -16
  %call = tail call i8* @malloc(i64 %mul1) #8
  %1 = bitcast i8* %call to double*
  %cmp = icmp eq i8* %call, null
  br i1 %cmp, label %if.then, label %for.cond.preheader

for.cond.preheader:                               ; preds = %entry
  %sub328 = shl i64 %0, 1
  %mul429 = add i64 %sub328, -2
  %cmp530 = icmp sgt i64 %mul429, 0
  br i1 %cmp530, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %for.cond.preheader
  %2 = load double** @umain, align 8, !tbaa !3
  %3 = bitcast double* %2 to i8*
  %4 = shl i64 %0, 1
  %5 = add i64 %4, -2
  %6 = icmp sgt i64 %5, 1
  %.op = shl i64 %5, 3
  %7 = select i1 %6, i64 %.op, i64 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %call, i8* %3, i64 %7, i32 8, i1 false)
  br label %for.end

if.then:                                          ; preds = %entry
  %8 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !3
  %call2 = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %8, i8* getelementptr inbounds ([44 x i8]* @.str46, i64 0, i64 0), i64 0) #8
  tail call void @exit(i32 -1) #9
  unreachable

for.end:                                          ; preds = %for.body.lr.ph, %for.cond.preheader
  %9 = load i64* @P, align 8, !tbaa !0
  %div9 = sdiv i64 %0, %9
  %10 = load i64* @M, align 8, !tbaa !0
  %11 = load i64* @N, align 8, !tbaa !0
  %12 = load double** @x, align 8, !tbaa !3
  %13 = load double** @trans, align 8, !tbaa !3
  %14 = load double** @umain2, align 8, !tbaa !3
  %15 = load i64* @pad_length, align 8, !tbaa !0
  %16 = load i64* @test_result, align 8, !tbaa !0
  tail call void @FFT1D(i64 1, i64 %10, i64 %11, double* %12, double* %13, double* %1, double* %14, i64 0, i64* undef, i64 0, i64 %div9, i64 %15, i64 %16, i64 undef)
  %17 = load i64* @test_result, align 8, !tbaa !0
  %tobool = icmp eq i64 %17, 0
  br i1 %tobool, label %if.end12, label %if.then11

if.then11:                                        ; preds = %for.end
  %18 = load i64* @M, align 8, !tbaa !0
  %19 = load i64* @N, align 8, !tbaa !0
  %20 = load double** @x, align 8, !tbaa !3
  %21 = load double** @trans, align 8, !tbaa !3
  %22 = load double** @umain2, align 8, !tbaa !3
  %23 = load i64* @pad_length, align 8, !tbaa !0
  tail call void @FFT1D(i64 -1, i64 %18, i64 %19, double* %20, double* %21, double* %1, double* %22, i64 0, i64* undef, i64 0, i64 %div9, i64 %23, i64 %17, i64 undef)
  br label %if.end12

if.end12:                                         ; preds = %if.then11, %for.end
  ret void
}

; Function Attrs: nounwind readnone
declare double @fabs(double) #7

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #5

; Function Attrs: nounwind
declare i32 @fprintf(%struct.__sFILE* nocapture, i8* nocapture, ...) #5

; Function Attrs: nounwind readonly ssp uwtable
define double @TouchArray(double* nocapture %x, double* nocapture %scratch, double* nocapture %u, double* nocapture %upriv, i64 %MyFirst, i64 %MyLast) #6 {
entry:
  %0 = load i64* @rootN, align 8, !tbaa !0
  %sub72 = shl i64 %0, 1
  %mul73 = add i64 %sub72, -2
  %cmp74 = icmp sgt i64 %mul73, 0
  br i1 %cmp74, label %for.body, label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.body, %entry
  %tot.0.lcssa = phi double [ 0.000000e+00, %entry ], [ %add, %for.body ]
  %cmp268 = icmp slt i64 %MyFirst, %MyLast
  br i1 %cmp268, label %for.body3.lr.ph, label %for.end41

for.body3.lr.ph:                                  ; preds = %for.cond1.preheader
  %1 = load i64* @pad_length, align 8, !tbaa !0
  %add4 = add nsw i64 %1, %0
  %cmp765 = icmp sgt i64 %0, 0
  br i1 %cmp765, label %for.body8.lr.ph.us, label %for.inc39

for.inc39.us:                                     ; preds = %for.body8.us
  %inc40.us = add nsw i64 %j.169.us, 1
  %exitcond79 = icmp eq i64 %inc40.us, %MyLast
  br i1 %exitcond79, label %for.end41, label %for.body8.lr.ph.us

for.body8.us:                                     ; preds = %for.body8.lr.ph.us, %for.body8.us
  %tot.267.us = phi double [ %tot.170.us, %for.body8.lr.ph.us ], [ %add35.us, %for.body8.us ]
  %i.066.us = phi i64 [ 0, %for.body8.lr.ph.us ], [ %inc37.us, %for.body8.us ]
  %add9.us = add nsw i64 %i.066.us, %mul5.us
  %mul10.us = shl nsw i64 %add9.us, 1
  %arrayidx11.us = getelementptr inbounds double* %x, i64 %mul10.us
  %2 = load double* %arrayidx11.us, align 8, !tbaa !4
  %add1464.us = or i64 %mul10.us, 1
  %arrayidx15.us = getelementptr inbounds double* %x, i64 %add1464.us
  %3 = load double* %arrayidx15.us, align 8, !tbaa !4
  %add16.us = fadd double %2, %3
  %arrayidx19.us = getelementptr inbounds double* %scratch, i64 %mul10.us
  %4 = load double* %arrayidx19.us, align 8, !tbaa !4
  %add20.us = fadd double %add16.us, %4
  %arrayidx24.us = getelementptr inbounds double* %scratch, i64 %add1464.us
  %5 = load double* %arrayidx24.us, align 8, !tbaa !4
  %add25.us = fadd double %add20.us, %5
  %arrayidx28.us = getelementptr inbounds double* %u, i64 %mul10.us
  %6 = load double* %arrayidx28.us, align 8, !tbaa !4
  %add29.us = fadd double %add25.us, %6
  %arrayidx33.us = getelementptr inbounds double* %u, i64 %add1464.us
  %7 = load double* %arrayidx33.us, align 8, !tbaa !4
  %add34.us = fadd double %add29.us, %7
  %add35.us = fadd double %tot.267.us, %add34.us
  %inc37.us = add nsw i64 %i.066.us, 1
  %exitcond78 = icmp eq i64 %inc37.us, %0
  br i1 %exitcond78, label %for.inc39.us, label %for.body8.us

for.body8.lr.ph.us:                               ; preds = %for.inc39.us, %for.body3.lr.ph
  %tot.170.us = phi double [ %add35.us, %for.inc39.us ], [ %tot.0.lcssa, %for.body3.lr.ph ]
  %j.169.us = phi i64 [ %inc40.us, %for.inc39.us ], [ %MyFirst, %for.body3.lr.ph ]
  %mul5.us = mul nsw i64 %add4, %j.169.us
  br label %for.body8.us

for.body:                                         ; preds = %for.body, %entry
  %tot.076 = phi double [ %add, %for.body ], [ 0.000000e+00, %entry ]
  %j.075 = phi i64 [ %inc, %for.body ], [ 0, %entry ]
  %arrayidx = getelementptr inbounds double* %upriv, i64 %j.075
  %8 = load double* %arrayidx, align 8, !tbaa !4
  %add = fadd double %tot.076, %8
  %inc = add nsw i64 %j.075, 1
  %cmp = icmp slt i64 %inc, %mul73
  br i1 %cmp, label %for.body, label %for.cond1.preheader

for.inc39:                                        ; preds = %for.inc39, %for.body3.lr.ph
  %j.169 = phi i64 [ %inc40, %for.inc39 ], [ %MyFirst, %for.body3.lr.ph ]
  %inc40 = add nsw i64 %j.169, 1
  %exitcond = icmp eq i64 %inc40, %MyLast
  br i1 %exitcond, label %for.end41, label %for.inc39

for.end41:                                        ; preds = %for.inc39, %for.inc39.us, %for.cond1.preheader
  %tot.1.lcssa = phi double [ %tot.0.lcssa, %for.cond1.preheader ], [ %add35.us, %for.inc39.us ], [ %tot.0.lcssa, %for.inc39 ]
  ret double %tot.1.lcssa
}

; Function Attrs: nounwind ssp uwtable
define void @FFT1D(i64 %direction, i64 %M, i64 %N, double* nocapture %x, double* nocapture %scratch, double* nocapture %upriv, double* nocapture %umain2, i64 %MyNum, i64* nocapture %l_transtime, i64 %MyFirst, i64 %MyLast, i64 %pad_length, i64 %test_result, i64 %dostats) #0 {
entry:
  %div = sdiv i64 %M, 2
  %sh_prom = trunc i64 %div to i32
  %shl = shl i32 1, %sh_prom
  %conv = sext i32 %shl to i64
  tail call void @Transpose(i64 %conv, double* %x, double* %scratch, i64 %MyNum, i64 %MyFirst, i64 %MyLast, i64 %pad_length)
  %cmp124 = icmp slt i64 %MyFirst, %MyLast
  br i1 %cmp124, label %for.body.lr.ph, label %for.end.thread

for.end.thread:                                   ; preds = %entry
  tail call void @Transpose(i64 %conv, double* %scratch, double* %x, i64 %MyNum, i64 %MyFirst, i64 %MyLast, i64 %pad_length)
  br label %for.end23

for.body.lr.ph:                                   ; preds = %entry
  %add = add nsw i64 %conv, %pad_length
  %cmp46.i = icmp eq i32 %sh_prom, 31
  %conv.i = sitofp i64 %direction to double
  br label %for.body

for.body:                                         ; preds = %TwiddleOneCol.exit, %for.body.lr.ph
  %j.0125 = phi i64 [ %MyFirst, %for.body.lr.ph ], [ %inc, %TwiddleOneCol.exit ]
  %mul = shl nsw i64 %j.0125, 1
  %mul2 = mul nsw i64 %mul, %add
  %arrayidx = getelementptr inbounds double* %scratch, i64 %mul2
  tail call void @FFT1DOnce(i64 %direction, i64 %div, i64 %conv, double* %upriv, double* %arrayidx)
  br i1 %cmp46.i, label %TwiddleOneCol.exit, label %for.body.lr.ph.i

for.body.lr.ph.i:                                 ; preds = %for.body
  %mul.i = mul nsw i64 %j.0125, %add
  br label %for.body.i

for.body.i:                                       ; preds = %for.body.i, %for.body.lr.ph.i
  %i.047.i = phi i64 [ 0, %for.body.lr.ph.i ], [ %inc.i, %for.body.i ]
  %add1.i = add nsw i64 %i.047.i, %mul.i
  %mul2.i = shl nsw i64 %add1.i, 1
  %arrayidx.i = getelementptr inbounds double* %umain2, i64 %mul2.i
  %0 = load double* %arrayidx.i, align 8, !tbaa !4
  %add744.i = or i64 %mul2.i, 1
  %arrayidx8.i = getelementptr inbounds double* %umain2, i64 %add744.i
  %1 = load double* %arrayidx8.i, align 8, !tbaa !4
  %mul9.i = fmul double %conv.i, %1
  %mul10.i = shl nsw i64 %i.047.i, 1
  %arrayidx.sum = add i64 %mul10.i, %mul2
  %arrayidx11.i = getelementptr inbounds double* %scratch, i64 %arrayidx.sum
  %2 = load double* %arrayidx11.i, align 8, !tbaa !4
  %add1345.i = or i64 %mul10.i, 1
  %arrayidx.sum119 = add i64 %add1345.i, %mul2
  %arrayidx14.i = getelementptr inbounds double* %scratch, i64 %arrayidx.sum119
  %3 = load double* %arrayidx14.i, align 8, !tbaa !4
  %mul15.i = fmul double %0, %2
  %mul16.i = fmul double %mul9.i, %3
  %sub.i = fsub double %mul15.i, %mul16.i
  store double %sub.i, double* %arrayidx11.i, align 8, !tbaa !4
  %mul19.i = fmul double %0, %3
  %mul20.i = fmul double %mul9.i, %2
  %add21.i = fadd double %mul20.i, %mul19.i
  store double %add21.i, double* %arrayidx14.i, align 8, !tbaa !4
  %inc.i = add nsw i64 %i.047.i, 1
  %exitcond.i = icmp eq i64 %inc.i, %conv
  br i1 %exitcond.i, label %TwiddleOneCol.exit, label %for.body.i

TwiddleOneCol.exit:                               ; preds = %for.body.i, %for.body
  %inc = add nsw i64 %j.0125, 1
  %exitcond127 = icmp eq i64 %inc, %MyLast
  br i1 %exitcond127, label %for.end, label %for.body

for.end:                                          ; preds = %TwiddleOneCol.exit
  tail call void @Transpose(i64 %conv, double* %scratch, double* %x, i64 %MyNum, i64 %MyFirst, i64 %MyLast, i64 %pad_length)
  br i1 %cmp124, label %for.body10.lr.ph, label %for.end23

for.body10.lr.ph:                                 ; preds = %for.end
  %add12 = add nsw i64 %conv, %pad_length
  %cmp15 = icmp eq i64 %direction, -1
  %cmp11.i = icmp ne i32 %sh_prom, 31
  %or.cond = and i1 %cmp15, %cmp11.i
  %conv.i109 = sitofp i64 %N to double
  br label %for.body10

for.body10:                                       ; preds = %for.inc21, %for.body10.lr.ph
  %j.1123 = phi i64 [ %MyFirst, %for.body10.lr.ph ], [ %inc22, %for.inc21 ]
  %mul11 = shl nsw i64 %j.1123, 1
  %mul13 = mul nsw i64 %mul11, %add12
  %arrayidx14 = getelementptr inbounds double* %x, i64 %mul13
  tail call void @FFT1DOnce(i64 %direction, i64 %div, i64 %conv, double* %upriv, double* %arrayidx14)
  br i1 %or.cond, label %for.body.i115, label %for.inc21

for.body.i115:                                    ; preds = %for.body.i115, %for.body10
  %i.012.i = phi i64 [ %inc.i113, %for.body.i115 ], [ 0, %for.body10 ]
  %mul.i111 = shl nsw i64 %i.012.i, 1
  %arrayidx14.sum = add i64 %mul.i111, %mul13
  %arrayidx.i112 = getelementptr inbounds double* %x, i64 %arrayidx14.sum
  %4 = load double* %arrayidx.i112, align 8, !tbaa !4
  %div.i = fdiv double %4, %conv.i109
  store double %div.i, double* %arrayidx.i112, align 8, !tbaa !4
  %add10.i = or i64 %mul.i111, 1
  %arrayidx14.sum118 = add i64 %add10.i, %mul13
  %arrayidx3.i = getelementptr inbounds double* %x, i64 %arrayidx14.sum118
  %5 = load double* %arrayidx3.i, align 8, !tbaa !4
  %div4.i = fdiv double %5, %conv.i109
  store double %div4.i, double* %arrayidx3.i, align 8, !tbaa !4
  %inc.i113 = add nsw i64 %i.012.i, 1
  %exitcond.i114 = icmp eq i64 %inc.i113, %conv
  br i1 %exitcond.i114, label %for.inc21, label %for.body.i115

for.inc21:                                        ; preds = %for.body.i115, %for.body10
  %inc22 = add nsw i64 %j.1123, 1
  %exitcond126 = icmp eq i64 %inc22, %MyLast
  br i1 %exitcond126, label %for.end23, label %for.body10

for.end23:                                        ; preds = %for.inc21, %for.end, %for.end.thread
  tail call void @Transpose(i64 %conv, double* %x, double* %scratch, i64 %MyNum, i64 %MyFirst, i64 %MyLast, i64 %pad_length)
  %6 = load i64* @doprint, align 8, !tbaa !0
  %7 = or i64 %6, %test_result
  %8 = icmp eq i64 %7, 0
  %cmp124.not = xor i1 %cmp124, true
  %brmerge = or i1 %8, %cmp124.not
  br i1 %brmerge, label %if.end41, label %for.body29.lr.ph

for.body29.lr.ph:                                 ; preds = %for.end23
  %add31 = add nsw i64 %conv, %pad_length
  %cmp16.i = icmp eq i32 %sh_prom, 31
  br label %for.body29

for.body29:                                       ; preds = %CopyColumn.exit, %for.body29.lr.ph
  %j.2121 = phi i64 [ %MyFirst, %for.body29.lr.ph ], [ %inc39, %CopyColumn.exit ]
  %mul30 = shl nsw i64 %j.2121, 1
  %mul32 = mul nsw i64 %mul30, %add31
  br i1 %cmp16.i, label %CopyColumn.exit, label %for.body.i108

for.body.i108:                                    ; preds = %for.body.i108, %for.body29
  %i.017.i = phi i64 [ %inc.i106, %for.body.i108 ], [ 0, %for.body29 ]
  %mul.i104 = shl nsw i64 %i.017.i, 1
  %arrayidx33.sum = add i64 %mul.i104, %mul32
  %arrayidx.i105 = getelementptr inbounds double* %scratch, i64 %arrayidx33.sum
  %9 = load double* %arrayidx.i105, align 8, !tbaa !4
  %arrayidx2.i = getelementptr inbounds double* %x, i64 %arrayidx33.sum
  store double %9, double* %arrayidx2.i, align 8, !tbaa !4
  %add15.i = or i64 %mul.i104, 1
  %arrayidx33.sum116 = add i64 %add15.i, %mul32
  %arrayidx4.i = getelementptr inbounds double* %scratch, i64 %arrayidx33.sum116
  %10 = load double* %arrayidx4.i, align 8, !tbaa !4
  %arrayidx7.i = getelementptr inbounds double* %x, i64 %arrayidx33.sum116
  store double %10, double* %arrayidx7.i, align 8, !tbaa !4
  %inc.i106 = add nsw i64 %i.017.i, 1
  %exitcond.i107 = icmp eq i64 %inc.i106, %conv
  br i1 %exitcond.i107, label %CopyColumn.exit, label %for.body.i108

CopyColumn.exit:                                  ; preds = %for.body.i108, %for.body29
  %inc39 = add nsw i64 %j.2121, 1
  %exitcond = icmp eq i64 %inc39, %MyLast
  br i1 %exitcond, label %if.end41, label %for.body29

if.end41:                                         ; preds = %CopyColumn.exit, %for.end23
  ret void
}

declare void @srand48(i64) #1

declare double @drand48() #1

; Function Attrs: nounwind readnone
declare double @cos(double) #7

; Function Attrs: nounwind readnone
declare double @sin(double) #7

; Function Attrs: nounwind readnone ssp uwtable
define i64 @BitReverse(i64 %M, i64 %k) #4 {
entry:
  %cmp3 = icmp sgt i64 %M, 0
  br i1 %cmp3, label %for.body, label %for.end

for.body:                                         ; preds = %for.body, %entry
  %tmp.06 = phi i64 [ %shr, %for.body ], [ %k, %entry ]
  %j.05 = phi i64 [ %add, %for.body ], [ 0, %entry ]
  %i.04 = phi i64 [ %inc, %for.body ], [ 0, %entry ]
  %mul = shl nsw i64 %j.05, 1
  %and = and i64 %tmp.06, 1
  %add = or i64 %and, %mul
  %shr = ashr i64 %tmp.06, 1
  %inc = add nsw i64 %i.04, 1
  %exitcond = icmp eq i64 %inc, %M
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body, %entry
  %j.0.lcssa = phi i64 [ 0, %entry ], [ %add, %for.body ]
  ret i64 %j.0.lcssa
}

; Function Attrs: nounwind ssp uwtable
define void @Transpose(i64 %n1, double* nocapture %src, double* nocapture %dest, i64 %MyNum, i64 %MyFirst, i64 %MyLast, i64 %pad_length) #0 {
entry:
  %sub = sub nsw i64 %MyLast, %MyFirst
  %mul = shl nsw i64 %sub, 1
  %0 = load i64* @num_cache_lines, align 8, !tbaa !0
  %div = sdiv i64 %mul, %0
  %mul1 = mul nsw i64 %div, %0
  %not.cmp = icmp ne i64 %mul1, %mul
  %inc = zext i1 %not.cmp to i64
  %div.inc = add i64 %inc, %div
  %div3 = sdiv i64 %sub, %div.inc
  %1 = load i64* @P, align 8, !tbaa !0
  %div4 = sdiv i64 %n1, %1
  %add = add nsw i64 %pad_length, %n1
  %l.0312 = add nsw i64 %MyNum, 1
  %cmp6313 = icmp slt i64 %l.0312, %1
  br i1 %cmp6313, label %for.body.lr.ph, label %for.cond54.preheader

for.body.lr.ph:                                   ; preds = %entry
  %cmp9308 = icmp sgt i64 %div.inc, 0
  %cmp15302 = icmp sgt i64 %div3, 0
  br label %for.body

for.cond.loopexit:                                ; preds = %for.end46, %for.body
  %l.0 = add nsw i64 %l.0314, 1
  %cmp6 = icmp slt i64 %l.0, %1
  br i1 %cmp6, label %for.body, label %for.cond54.preheader

for.cond54.preheader:                             ; preds = %for.cond.loopexit, %entry
  %cmp55298 = icmp sgt i64 %MyNum, 0
  br i1 %cmp55298, label %for.body56.lr.ph, label %for.end106

for.body56.lr.ph:                                 ; preds = %for.cond54.preheader
  %cmp59294 = icmp sgt i64 %div.inc, 0
  %cmp65288 = icmp sgt i64 %div3, 0
  br label %for.body56

for.body:                                         ; preds = %for.cond.loopexit, %for.body.lr.ph
  %l.0314 = phi i64 [ %l.0312, %for.body.lr.ph ], [ %l.0, %for.cond.loopexit ]
  br i1 %cmp9308, label %for.cond11.preheader.lr.ph, label %for.cond.loopexit

for.cond11.preheader.lr.ph:                       ; preds = %for.body
  %mul7 = mul nsw i64 %l.0314, %div4
  br label %for.cond14.preheader.lr.ph

for.cond14.preheader.lr.ph:                       ; preds = %for.end46, %for.cond11.preheader.lr.ph
  %v_off.0310 = phi i64 [ %mul7, %for.cond11.preheader.lr.ph ], [ %add47, %for.end46 ]
  %k.0309 = phi i64 [ 0, %for.cond11.preheader.lr.ph ], [ %inc49, %for.end46 ]
  br label %for.cond14.preheader

for.cond14.preheader:                             ; preds = %for.end42, %for.cond14.preheader.lr.ph
  %h_off.0306 = phi i64 [ %MyFirst, %for.cond14.preheader.lr.ph ], [ %add43, %for.end42 ]
  %m.0305 = phi i64 [ 0, %for.cond14.preheader.lr.ph ], [ %inc45, %for.end42 ]
  br i1 %cmp15302, label %for.body20.lr.ph, label %for.end42

for.body20.lr.ph:                                 ; preds = %for.inc40, %for.cond14.preheader
  %i.0303 = phi i64 [ %inc41, %for.inc40 ], [ 0, %for.cond14.preheader ]
  %add17 = add nsw i64 %i.0303, %v_off.0310
  %mul22 = mul nsw i64 %add17, %add
  br label %for.body20

for.body20:                                       ; preds = %for.body20, %for.body20.lr.ph
  %j.0301 = phi i64 [ 0, %for.body20.lr.ph ], [ %inc39, %for.body20 ]
  %add21 = add nsw i64 %j.0301, %h_off.0306
  %add23 = add nsw i64 %add21, %mul22
  %mul24 = shl nsw i64 %add23, 1
  %arrayidx = getelementptr inbounds double* %src, i64 %mul24
  %2 = load double* %arrayidx, align 8, !tbaa !4
  %mul25 = mul nsw i64 %add21, %add
  %add26 = add nsw i64 %mul25, %add17
  %mul27 = shl nsw i64 %add26, 1
  %arrayidx28 = getelementptr inbounds double* %dest, i64 %mul27
  store double %2, double* %arrayidx28, align 8, !tbaa !4
  %add32272 = or i64 %mul24, 1
  %arrayidx33 = getelementptr inbounds double* %src, i64 %add32272
  %3 = load double* %arrayidx33, align 8, !tbaa !4
  %add37273 = or i64 %mul27, 1
  %arrayidx38 = getelementptr inbounds double* %dest, i64 %add37273
  store double %3, double* %arrayidx38, align 8, !tbaa !4
  %inc39 = add nsw i64 %j.0301, 1
  %exitcond323 = icmp eq i64 %inc39, %div3
  br i1 %exitcond323, label %for.inc40, label %for.body20

for.inc40:                                        ; preds = %for.body20
  %inc41 = add nsw i64 %i.0303, 1
  %exitcond324 = icmp eq i64 %inc41, %div3
  br i1 %exitcond324, label %for.end42, label %for.body20.lr.ph

for.end42:                                        ; preds = %for.inc40, %for.cond14.preheader
  %add43 = add nsw i64 %h_off.0306, %div3
  %inc45 = add nsw i64 %m.0305, 1
  %exitcond325 = icmp eq i64 %inc45, %div.inc
  br i1 %exitcond325, label %for.end46, label %for.cond14.preheader

for.end46:                                        ; preds = %for.end42
  %add47 = add nsw i64 %v_off.0310, %div3
  %inc49 = add nsw i64 %k.0309, 1
  %exitcond326 = icmp eq i64 %inc49, %div.inc
  br i1 %exitcond326, label %for.cond.loopexit, label %for.cond14.preheader.lr.ph

for.body56:                                       ; preds = %for.inc104, %for.body56.lr.ph
  %l.1299 = phi i64 [ 0, %for.body56.lr.ph ], [ %inc105, %for.inc104 ]
  br i1 %cmp59294, label %for.cond61.preheader.lr.ph, label %for.inc104

for.cond61.preheader.lr.ph:                       ; preds = %for.body56
  %mul57 = mul nsw i64 %l.1299, %div4
  br label %for.cond64.preheader.lr.ph

for.cond64.preheader.lr.ph:                       ; preds = %for.end99, %for.cond61.preheader.lr.ph
  %v_off.1296 = phi i64 [ %mul57, %for.cond61.preheader.lr.ph ], [ %add100, %for.end99 ]
  %k.1295 = phi i64 [ 0, %for.cond61.preheader.lr.ph ], [ %inc102, %for.end99 ]
  br label %for.cond64.preheader

for.cond64.preheader:                             ; preds = %for.end95, %for.cond64.preheader.lr.ph
  %h_off.1292 = phi i64 [ %MyFirst, %for.cond64.preheader.lr.ph ], [ %add96, %for.end95 ]
  %m.1291 = phi i64 [ 0, %for.cond64.preheader.lr.ph ], [ %inc98, %for.end95 ]
  br i1 %cmp65288, label %for.body70.lr.ph, label %for.end95

for.body70.lr.ph:                                 ; preds = %for.inc93, %for.cond64.preheader
  %i.1289 = phi i64 [ %inc94, %for.inc93 ], [ 0, %for.cond64.preheader ]
  %add67 = add nsw i64 %i.1289, %v_off.1296
  %mul72 = mul nsw i64 %add67, %add
  br label %for.body70

for.body70:                                       ; preds = %for.body70, %for.body70.lr.ph
  %j.1287 = phi i64 [ 0, %for.body70.lr.ph ], [ %inc91, %for.body70 ]
  %add71 = add nsw i64 %j.1287, %h_off.1292
  %add73 = add nsw i64 %add71, %mul72
  %mul74 = shl nsw i64 %add73, 1
  %arrayidx75 = getelementptr inbounds double* %src, i64 %mul74
  %4 = load double* %arrayidx75, align 8, !tbaa !4
  %mul76 = mul nsw i64 %add71, %add
  %add77 = add nsw i64 %mul76, %add67
  %mul78 = shl nsw i64 %add77, 1
  %arrayidx79 = getelementptr inbounds double* %dest, i64 %mul78
  store double %4, double* %arrayidx79, align 8, !tbaa !4
  %add83270 = or i64 %mul74, 1
  %arrayidx84 = getelementptr inbounds double* %src, i64 %add83270
  %5 = load double* %arrayidx84, align 8, !tbaa !4
  %add88271 = or i64 %mul78, 1
  %arrayidx89 = getelementptr inbounds double* %dest, i64 %add88271
  store double %5, double* %arrayidx89, align 8, !tbaa !4
  %inc91 = add nsw i64 %j.1287, 1
  %exitcond318 = icmp eq i64 %inc91, %div3
  br i1 %exitcond318, label %for.inc93, label %for.body70

for.inc93:                                        ; preds = %for.body70
  %inc94 = add nsw i64 %i.1289, 1
  %exitcond319 = icmp eq i64 %inc94, %div3
  br i1 %exitcond319, label %for.end95, label %for.body70.lr.ph

for.end95:                                        ; preds = %for.inc93, %for.cond64.preheader
  %add96 = add nsw i64 %h_off.1292, %div3
  %inc98 = add nsw i64 %m.1291, 1
  %exitcond320 = icmp eq i64 %inc98, %div.inc
  br i1 %exitcond320, label %for.end99, label %for.cond64.preheader

for.end99:                                        ; preds = %for.end95
  %add100 = add nsw i64 %v_off.1296, %div3
  %inc102 = add nsw i64 %k.1295, 1
  %exitcond321 = icmp eq i64 %inc102, %div.inc
  br i1 %exitcond321, label %for.inc104, label %for.cond64.preheader.lr.ph

for.inc104:                                       ; preds = %for.end99, %for.body56
  %inc105 = add nsw i64 %l.1299, 1
  %exitcond322 = icmp eq i64 %inc105, %MyNum
  br i1 %exitcond322, label %for.end106, label %for.body56

for.end106:                                       ; preds = %for.inc104, %for.cond54.preheader
  %cmp109282 = icmp sgt i64 %div.inc, 0
  br i1 %cmp109282, label %for.cond111.preheader.lr.ph, label %for.end153

for.cond111.preheader.lr.ph:                      ; preds = %for.end106
  %mul107 = mul nsw i64 %div4, %MyNum
  %cmp115276 = icmp sgt i64 %div3, 0
  br label %for.cond114.preheader.lr.ph

for.cond114.preheader.lr.ph:                      ; preds = %for.end149, %for.cond111.preheader.lr.ph
  %v_off.2284 = phi i64 [ %mul107, %for.cond111.preheader.lr.ph ], [ %add150, %for.end149 ]
  %k.2283 = phi i64 [ 0, %for.cond111.preheader.lr.ph ], [ %inc152, %for.end149 ]
  br label %for.cond114.preheader

for.cond114.preheader:                            ; preds = %for.end145, %for.cond114.preheader.lr.ph
  %h_off.2280 = phi i64 [ %MyFirst, %for.cond114.preheader.lr.ph ], [ %add146, %for.end145 ]
  %m.2279 = phi i64 [ 0, %for.cond114.preheader.lr.ph ], [ %inc148, %for.end145 ]
  br i1 %cmp115276, label %for.body120.lr.ph, label %for.end145

for.body120.lr.ph:                                ; preds = %for.inc143, %for.cond114.preheader
  %i.2277 = phi i64 [ %inc144, %for.inc143 ], [ 0, %for.cond114.preheader ]
  %add117 = add nsw i64 %i.2277, %v_off.2284
  %mul122 = mul nsw i64 %add117, %add
  br label %for.body120

for.body120:                                      ; preds = %for.body120, %for.body120.lr.ph
  %j.2275 = phi i64 [ 0, %for.body120.lr.ph ], [ %inc141, %for.body120 ]
  %add121 = add nsw i64 %j.2275, %h_off.2280
  %add123 = add nsw i64 %add121, %mul122
  %mul124 = shl nsw i64 %add123, 1
  %arrayidx125 = getelementptr inbounds double* %src, i64 %mul124
  %6 = load double* %arrayidx125, align 8, !tbaa !4
  %mul126 = mul nsw i64 %add121, %add
  %add127 = add nsw i64 %mul126, %add117
  %mul128 = shl nsw i64 %add127, 1
  %arrayidx129 = getelementptr inbounds double* %dest, i64 %mul128
  store double %6, double* %arrayidx129, align 8, !tbaa !4
  %add133268 = or i64 %mul124, 1
  %arrayidx134 = getelementptr inbounds double* %src, i64 %add133268
  %7 = load double* %arrayidx134, align 8, !tbaa !4
  %add138269 = or i64 %mul128, 1
  %arrayidx139 = getelementptr inbounds double* %dest, i64 %add138269
  store double %7, double* %arrayidx139, align 8, !tbaa !4
  %inc141 = add nsw i64 %j.2275, 1
  %exitcond = icmp eq i64 %inc141, %div3
  br i1 %exitcond, label %for.inc143, label %for.body120

for.inc143:                                       ; preds = %for.body120
  %inc144 = add nsw i64 %i.2277, 1
  %exitcond315 = icmp eq i64 %inc144, %div3
  br i1 %exitcond315, label %for.end145, label %for.body120.lr.ph

for.end145:                                       ; preds = %for.inc143, %for.cond114.preheader
  %add146 = add nsw i64 %h_off.2280, %div3
  %inc148 = add nsw i64 %m.2279, 1
  %exitcond316 = icmp eq i64 %inc148, %div.inc
  br i1 %exitcond316, label %for.end149, label %for.cond114.preheader

for.end149:                                       ; preds = %for.end145
  %add150 = add nsw i64 %v_off.2284, %div3
  %inc152 = add nsw i64 %k.2283, 1
  %exitcond317 = icmp eq i64 %inc152, %div.inc
  br i1 %exitcond317, label %for.end153, label %for.cond114.preheader.lr.ph

for.end153:                                       ; preds = %for.end149, %for.end106
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @FFT1DOnce(i64 %direction, i64 %M, i64 %N, double* nocapture %u, double* nocapture %x) #0 {
entry:
  %cmp41.i = icmp sgt i64 %N, 0
  br i1 %cmp41.i, label %for.body.lr.ph.i, label %for.cond.preheader

for.body.lr.ph.i:                                 ; preds = %entry
  %cmp3.i.i = icmp sgt i64 %M, 0
  br label %for.body.i

for.body.i:                                       ; preds = %for.inc.i, %for.body.lr.ph.i
  %k.042.i = phi i64 [ 0, %for.body.lr.ph.i ], [ %inc.i, %for.inc.i ]
  br i1 %cmp3.i.i, label %for.body.i.i, label %BitReverse.exit.i

for.body.i.i:                                     ; preds = %for.body.i.i, %for.body.i
  %tmp.06.i.i = phi i64 [ %shr.i.i, %for.body.i.i ], [ %k.042.i, %for.body.i ]
  %j.05.i.i = phi i64 [ %add.i.i, %for.body.i.i ], [ 0, %for.body.i ]
  %i.04.i.i = phi i64 [ %inc.i.i, %for.body.i.i ], [ 0, %for.body.i ]
  %mul.i.i = shl nsw i64 %j.05.i.i, 1
  %and.i.i = and i64 %tmp.06.i.i, 1
  %add.i.i = or i64 %mul.i.i, %and.i.i
  %shr.i.i = ashr i64 %tmp.06.i.i, 1
  %inc.i.i = add nsw i64 %i.04.i.i, 1
  %exitcond.i.i = icmp eq i64 %inc.i.i, %M
  br i1 %exitcond.i.i, label %BitReverse.exit.i, label %for.body.i.i

BitReverse.exit.i:                                ; preds = %for.body.i.i, %for.body.i
  %j.0.lcssa.i.i = phi i64 [ 0, %for.body.i ], [ %add.i.i, %for.body.i.i ]
  %cmp1.i = icmp sgt i64 %j.0.lcssa.i.i, %k.042.i
  br i1 %cmp1.i, label %if.then.i, label %for.inc.i

if.then.i:                                        ; preds = %BitReverse.exit.i
  %mul.i = shl nsw i64 %j.0.lcssa.i.i, 1
  %arrayidx.i = getelementptr inbounds double* %x, i64 %mul.i
  %0 = load double* %arrayidx.i, align 8, !tbaa !4
  %mul2.i = shl nsw i64 %k.042.i, 1
  %arrayidx3.i = getelementptr inbounds double* %x, i64 %mul2.i
  %1 = load double* %arrayidx3.i, align 8, !tbaa !4
  store double %1, double* %arrayidx.i, align 8, !tbaa !4
  store double %0, double* %arrayidx3.i, align 8, !tbaa !4
  %add39.i = or i64 %mul.i, 1
  %arrayidx11.i = getelementptr inbounds double* %x, i64 %add39.i
  %2 = load double* %arrayidx11.i, align 8, !tbaa !4
  %add1340.i = or i64 %mul2.i, 1
  %arrayidx14.i = getelementptr inbounds double* %x, i64 %add1340.i
  %3 = load double* %arrayidx14.i, align 8, !tbaa !4
  store double %3, double* %arrayidx11.i, align 8, !tbaa !4
  store double %2, double* %arrayidx14.i, align 8, !tbaa !4
  br label %for.inc.i

for.inc.i:                                        ; preds = %if.then.i, %BitReverse.exit.i
  %inc.i = add nsw i64 %k.042.i, 1
  %exitcond.i = icmp eq i64 %inc.i, %N
  br i1 %exitcond.i, label %for.cond.preheader, label %for.body.i

for.cond.preheader:                               ; preds = %for.inc.i, %entry
  %cmp109 = icmp slt i64 %M, 1
  br i1 %cmp109, label %for.end58, label %for.body.lr.ph

for.body.lr.ph:                                   ; preds = %for.cond.preheader
  %conv18 = sitofp i64 %direction to double
  br label %for.body

for.body:                                         ; preds = %for.inc56, %for.body.lr.ph
  %q.0110 = phi i64 [ 1, %for.body.lr.ph ], [ %inc57, %for.inc56 ]
  %sh_prom = trunc i64 %q.0110 to i32
  %shl = shl i32 1, %sh_prom
  %conv = sext i32 %shl to i64
  %div = sdiv i64 %N, %conv
  %div1 = sdiv i64 %conv, 2
  %sub = shl i64 %div1, 1
  %mul = add i64 %sub, -2
  %cmp3107 = icmp sgt i64 %div, 0
  br i1 %cmp3107, label %for.body5.lr.ph, label %for.inc56

for.body5.lr.ph:                                  ; preds = %for.body
  %cmp13105 = icmp sgt i32 %shl, 1
  br label %for.body5

for.body5:                                        ; preds = %for.inc53, %for.body5.lr.ph
  %k.0108 = phi i64 [ 0, %for.body5.lr.ph ], [ %inc54, %for.inc53 ]
  %mul6 = mul nsw i64 %k.0108, %conv
  %mul7 = shl nsw i64 %mul6, 1
  %add = add nsw i64 %mul6, %div1
  %mul10 = shl nsw i64 %add, 1
  br i1 %cmp13105, label %for.body15, label %for.inc53

for.body15:                                       ; preds = %for.body15, %for.body5
  %j.0106 = phi i64 [ %inc, %for.body15 ], [ 0, %for.body5 ]
  %mul16 = shl nsw i64 %j.0106, 1
  %arrayidx.sum = add i64 %mul16, %mul
  %arrayidx17 = getelementptr inbounds double* %u, i64 %arrayidx.sum
  %4 = load double* %arrayidx17, align 8, !tbaa !4
  %add20101 = or i64 %mul16, 1
  %arrayidx.sum102 = add i64 %add20101, %mul
  %arrayidx21 = getelementptr inbounds double* %u, i64 %arrayidx.sum102
  %5 = load double* %arrayidx21, align 8, !tbaa !4
  %mul22 = fmul double %conv18, %5
  %arrayidx11.sum = add i64 %mul16, %mul10
  %arrayidx24 = getelementptr inbounds double* %x, i64 %arrayidx11.sum
  %6 = load double* %arrayidx24, align 8, !tbaa !4
  %arrayidx11.sum103 = add i64 %add20101, %mul10
  %arrayidx27 = getelementptr inbounds double* %x, i64 %arrayidx11.sum103
  %7 = load double* %arrayidx27, align 8, !tbaa !4
  %mul28 = fmul double %4, %6
  %mul29 = fmul double %mul22, %7
  %sub30 = fsub double %mul28, %mul29
  %mul31 = fmul double %4, %7
  %mul32 = fmul double %mul22, %6
  %add33 = fadd double %mul32, %mul31
  %arrayidx8.sum = add i64 %mul16, %mul7
  %arrayidx35 = getelementptr inbounds double* %x, i64 %arrayidx8.sum
  %8 = load double* %arrayidx35, align 8, !tbaa !4
  %arrayidx8.sum104 = add i64 %add20101, %mul7
  %arrayidx38 = getelementptr inbounds double* %x, i64 %arrayidx8.sum104
  %9 = load double* %arrayidx38, align 8, !tbaa !4
  %sub39 = fsub double %8, %sub30
  store double %sub39, double* %arrayidx24, align 8, !tbaa !4
  %sub42 = fsub double %9, %add33
  store double %sub42, double* %arrayidx27, align 8, !tbaa !4
  %add46 = fadd double %8, %sub30
  store double %add46, double* %arrayidx35, align 8, !tbaa !4
  %add49 = fadd double %9, %add33
  store double %add49, double* %arrayidx38, align 8, !tbaa !4
  %inc = add nsw i64 %j.0106, 1
  %cmp13 = icmp slt i64 %inc, %div1
  br i1 %cmp13, label %for.body15, label %for.inc53

for.inc53:                                        ; preds = %for.body15, %for.body5
  %inc54 = add nsw i64 %k.0108, 1
  %exitcond = icmp eq i64 %inc54, %div
  br i1 %exitcond, label %for.inc56, label %for.body5

for.inc56:                                        ; preds = %for.inc53, %for.body
  %inc57 = add nsw i64 %q.0110, 1
  %exitcond111 = icmp eq i64 %q.0110, %M
  br i1 %exitcond111, label %for.end58, label %for.body

for.end58:                                        ; preds = %for.inc56, %for.cond.preheader
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @TwiddleOneCol(i64 %direction, i64 %n1, i64 %j, double* nocapture %u, double* nocapture %x, i64 %pad_length) #0 {
entry:
  %cmp46 = icmp sgt i64 %n1, 0
  br i1 %cmp46, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %add = add nsw i64 %pad_length, %n1
  %mul = mul nsw i64 %add, %j
  %conv = sitofp i64 %direction to double
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %i.047 = phi i64 [ 0, %for.body.lr.ph ], [ %inc, %for.body ]
  %add1 = add nsw i64 %i.047, %mul
  %mul2 = shl nsw i64 %add1, 1
  %arrayidx = getelementptr inbounds double* %u, i64 %mul2
  %0 = load double* %arrayidx, align 8, !tbaa !4
  %add744 = or i64 %mul2, 1
  %arrayidx8 = getelementptr inbounds double* %u, i64 %add744
  %1 = load double* %arrayidx8, align 8, !tbaa !4
  %mul9 = fmul double %conv, %1
  %mul10 = shl nsw i64 %i.047, 1
  %arrayidx11 = getelementptr inbounds double* %x, i64 %mul10
  %2 = load double* %arrayidx11, align 8, !tbaa !4
  %add1345 = or i64 %mul10, 1
  %arrayidx14 = getelementptr inbounds double* %x, i64 %add1345
  %3 = load double* %arrayidx14, align 8, !tbaa !4
  %mul15 = fmul double %0, %2
  %mul16 = fmul double %mul9, %3
  %sub = fsub double %mul15, %mul16
  store double %sub, double* %arrayidx11, align 8, !tbaa !4
  %mul19 = fmul double %0, %3
  %mul20 = fmul double %mul9, %2
  %add21 = fadd double %mul20, %mul19
  store double %add21, double* %arrayidx14, align 8, !tbaa !4
  %inc = add nsw i64 %i.047, 1
  %exitcond = icmp eq i64 %inc, %n1
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body, %entry
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @Scale(i64 %n1, i64 %N, double* nocapture %x) #0 {
entry:
  %cmp11 = icmp sgt i64 %n1, 0
  br i1 %cmp11, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %conv = sitofp i64 %N to double
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %i.012 = phi i64 [ 0, %for.body.lr.ph ], [ %inc, %for.body ]
  %mul = shl nsw i64 %i.012, 1
  %arrayidx = getelementptr inbounds double* %x, i64 %mul
  %0 = load double* %arrayidx, align 8, !tbaa !4
  %div = fdiv double %0, %conv
  store double %div, double* %arrayidx, align 8, !tbaa !4
  %add10 = or i64 %mul, 1
  %arrayidx3 = getelementptr inbounds double* %x, i64 %add10
  %1 = load double* %arrayidx3, align 8, !tbaa !4
  %div4 = fdiv double %1, %conv
  store double %div4, double* %arrayidx3, align 8, !tbaa !4
  %inc = add nsw i64 %i.012, 1
  %exitcond = icmp eq i64 %inc, %n1
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body, %entry
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @CopyColumn(i64 %n1, double* nocapture %src, double* nocapture %dest) #0 {
entry:
  %cmp16 = icmp sgt i64 %n1, 0
  br i1 %cmp16, label %for.body, label %for.end

for.body:                                         ; preds = %for.body, %entry
  %i.017 = phi i64 [ %inc, %for.body ], [ 0, %entry ]
  %mul = shl nsw i64 %i.017, 1
  %arrayidx = getelementptr inbounds double* %src, i64 %mul
  %0 = load double* %arrayidx, align 8, !tbaa !4
  %arrayidx2 = getelementptr inbounds double* %dest, i64 %mul
  store double %0, double* %arrayidx2, align 8, !tbaa !4
  %add15 = or i64 %mul, 1
  %arrayidx4 = getelementptr inbounds double* %src, i64 %add15
  %1 = load double* %arrayidx4, align 8, !tbaa !4
  %arrayidx7 = getelementptr inbounds double* %dest, i64 %add15
  store double %1, double* %arrayidx7, align 8, !tbaa !4
  %inc = add nsw i64 %i.017, 1
  %exitcond = icmp eq i64 %inc, %n1
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body, %entry
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @Reverse(i64 %N, i64 %M, double* nocapture %x) #0 {
entry:
  %cmp41 = icmp sgt i64 %N, 0
  br i1 %cmp41, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %cmp3.i = icmp sgt i64 %M, 0
  br label %for.body

for.body:                                         ; preds = %for.inc, %for.body.lr.ph
  %k.042 = phi i64 [ 0, %for.body.lr.ph ], [ %inc, %for.inc ]
  br i1 %cmp3.i, label %for.body.i, label %BitReverse.exit

for.body.i:                                       ; preds = %for.body.i, %for.body
  %tmp.06.i = phi i64 [ %shr.i, %for.body.i ], [ %k.042, %for.body ]
  %j.05.i = phi i64 [ %add.i, %for.body.i ], [ 0, %for.body ]
  %i.04.i = phi i64 [ %inc.i, %for.body.i ], [ 0, %for.body ]
  %mul.i = shl nsw i64 %j.05.i, 1
  %and.i = and i64 %tmp.06.i, 1
  %add.i = or i64 %mul.i, %and.i
  %shr.i = ashr i64 %tmp.06.i, 1
  %inc.i = add nsw i64 %i.04.i, 1
  %exitcond.i = icmp eq i64 %inc.i, %M
  br i1 %exitcond.i, label %BitReverse.exit, label %for.body.i

BitReverse.exit:                                  ; preds = %for.body.i, %for.body
  %j.0.lcssa.i = phi i64 [ 0, %for.body ], [ %add.i, %for.body.i ]
  %cmp1 = icmp sgt i64 %j.0.lcssa.i, %k.042
  br i1 %cmp1, label %if.then, label %for.inc

if.then:                                          ; preds = %BitReverse.exit
  %mul = shl nsw i64 %j.0.lcssa.i, 1
  %arrayidx = getelementptr inbounds double* %x, i64 %mul
  %0 = load double* %arrayidx, align 8, !tbaa !4
  %mul2 = shl nsw i64 %k.042, 1
  %arrayidx3 = getelementptr inbounds double* %x, i64 %mul2
  %1 = load double* %arrayidx3, align 8, !tbaa !4
  store double %1, double* %arrayidx, align 8, !tbaa !4
  store double %0, double* %arrayidx3, align 8, !tbaa !4
  %add39 = or i64 %mul, 1
  %arrayidx11 = getelementptr inbounds double* %x, i64 %add39
  %2 = load double* %arrayidx11, align 8, !tbaa !4
  %add1340 = or i64 %mul2, 1
  %arrayidx14 = getelementptr inbounds double* %x, i64 %add1340
  %3 = load double* %arrayidx14, align 8, !tbaa !4
  store double %3, double* %arrayidx11, align 8, !tbaa !4
  store double %2, double* %arrayidx14, align 8, !tbaa !4
  br label %for.inc

for.inc:                                          ; preds = %if.then, %BitReverse.exit
  %inc = add nsw i64 %k.042, 1
  %exitcond = icmp eq i64 %inc, %N
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.inc, %entry
  ret void
}

; Function Attrs: nounwind ssp uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([7 x i8]* @str74, i64 0, i64 0))
  %call1 = tail call i32 @fft_compute(i32 %argc, i8** %argv)
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @putchar(i32) #8

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture) #8

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) #8

attributes #0 = { nounwind ssp uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone ssp uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readonly ssp uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }
attributes #10 = { nounwind readnone }

!0 = metadata !{metadata !"long", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA"}
!3 = metadata !{metadata !"any pointer", metadata !1}
!4 = metadata !{metadata !"double", metadata !1}
