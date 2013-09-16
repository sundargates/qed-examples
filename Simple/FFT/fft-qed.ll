; ModuleID = 'fft-qed.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.8.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sbuf = type { i8*, i32 }
%struct.__sFILEX = type opaque

@P_dup = global i64 1, align 8
@P = global i64 1, align 8
@M_dup = global i64 4, align 8
@M = global i64 4, align 8
@test_result_dup = global i64 1, align 8
@test_result = global i64 1, align 8
@doprint_dup = global i64 0, align 8
@doprint = global i64 0, align 8
@dostats_dup = global i64 0, align 8
@dostats = global i64 0, align 8
@maxtotal_dup = global i64 0, align 8
@maxtotal = global i64 0, align 8
@mintotal_dup = global i64 0, align 8
@mintotal = global i64 0, align 8
@maxfrac_dup = global double 0.000000e+00, align 8
@maxfrac = global double 0.000000e+00, align 8
@minfrac_dup = global double 0.000000e+00, align 8
@minfrac = global double 0.000000e+00, align 8
@orig_num_lines_dup = global i64 256, align 8
@orig_num_lines = global i64 256, align 8
@num_cache_lines_dup = global i64 256, align 8
@num_cache_lines = global i64 256, align 8
@log2_line_size_dup = global i64 4, align 8
@log2_line_size = global i64 4, align 8
@.str_dup = private unnamed_addr constant [13 x i8] c"p:m:n:l:stoh\00", align 1
@.str = private unnamed_addr constant [13 x i8] c"p:m:n:l:stoh\00", align 1
@.str1_dup = private unnamed_addr constant [16 x i8] c"P must be >= 1\0A\00", align 1
@.str1 = private unnamed_addr constant [16 x i8] c"P must be >= 1\0A\00", align 1
@.str2_dup = private unnamed_addr constant [24 x i8] c"P must be a power of 2\0A\00", align 1
@.str2 = private unnamed_addr constant [24 x i8] c"P must be a power of 2\0A\00", align 1
@.str3_dup = private unnamed_addr constant [16 x i8] c"M must be even\0A\00", align 1
@.str3 = private unnamed_addr constant [16 x i8] c"M must be even\0A\00", align 1
@.str4_dup = private unnamed_addr constant [36 x i8] c"Number of cache lines must be >= 1\0A\00", align 1
@.str4 = private unnamed_addr constant [36 x i8] c"Number of cache lines must be >= 1\0A\00", align 1
@.str5_dup = private unnamed_addr constant [55 x i8] c"Log base 2 of cache line length in bytes must be >= 0\0A\00", align 1
@.str5 = private unnamed_addr constant [55 x i8] c"Log base 2 of cache line length in bytes must be >= 0\0A\00", align 1
@.str18_dup = private unnamed_addr constant [38 x i8] c"Default: FFT -m%1d -p%1d -n%1d -l%1d\0A\00", align 1
@.str18 = private unnamed_addr constant [38 x i8] c"Default: FFT -m%1d -p%1d -n%1d -l%1d\0A\00", align 1
@N_dup = common global i64 0, align 8
@N = common global i64 0, align 8
@rootN_dup = common global i64 0, align 8
@rootN = common global i64 0, align 8
@rowsperproc_dup = common global i64 0, align 8
@rowsperproc = common global i64 0, align 8
@.str19_dup = private unnamed_addr constant [48 x i8] c"Matrix not large enough. 2**(M/2) must be >= P\0A\00", align 1
@.str19 = private unnamed_addr constant [48 x i8] c"Matrix not large enough. 2**(M/2) must be >= P\0A\00", align 1
@line_size_dup = common global i64 0, align 8
@line_size = common global i64 0, align 8
@.str20_dup = private unnamed_addr constant [55 x i8] c"WARNING: Each element is a complex double (%ld bytes)\0A\00", align 1
@.str20 = private unnamed_addr constant [55 x i8] c"WARNING: Each element is a complex double (%ld bytes)\0A\00", align 1
@pad_length_dup = common global i64 0, align 8
@pad_length = common global i64 0, align 8
@.str23_dup = private unnamed_addr constant [32 x i8] c"Padding algorithm unsuccessful\0A\00", align 1
@.str23 = private unnamed_addr constant [32 x i8] c"Padding algorithm unsuccessful\0A\00", align 1
@x_dup = common global double* null, align 8
@x = common global double* null, align 8
@trans_dup = common global double* null, align 8
@trans = common global double* null, align 8
@umain_dup = common global double* null, align 8
@umain = common global double* null, align 8
@umain2_dup = common global double* null, align 8
@umain2 = common global double* null, align 8
@.str24_dup = private unnamed_addr constant [31 x i8] c"Could not malloc memory for x\0A\00", align 1
@.str24 = private unnamed_addr constant [31 x i8] c"Could not malloc memory for x\0A\00", align 1
@.str25_dup = private unnamed_addr constant [35 x i8] c"Could not malloc memory for trans\0A\00", align 1
@.str25 = private unnamed_addr constant [35 x i8] c"Could not malloc memory for trans\0A\00", align 1
@.str26_dup = private unnamed_addr constant [35 x i8] c"Could not malloc memory for umain\0A\00", align 1
@.str26 = private unnamed_addr constant [35 x i8] c"Could not malloc memory for umain\0A\00", align 1
@.str27_dup = private unnamed_addr constant [36 x i8] c"Could not malloc memory for umain2\0A\00", align 1
@.str27 = private unnamed_addr constant [36 x i8] c"Could not malloc memory for umain2\0A\00", align 1
@.str30_dup = private unnamed_addr constant [24 x i8] c"   %ld Complex Doubles\0A\00", align 1
@.str30 = private unnamed_addr constant [24 x i8] c"   %ld Complex Doubles\0A\00", align 1
@.str31_dup = private unnamed_addr constant [19 x i8] c"   %ld Processors\0A\00", align 1
@.str31 = private unnamed_addr constant [19 x i8] c"   %ld Processors\0A\00", align 1
@.str32_dup = private unnamed_addr constant [20 x i8] c"   %ld Cache lines\0A\00", align 1
@.str32 = private unnamed_addr constant [20 x i8] c"   %ld Cache lines\0A\00", align 1
@.str33_dup = private unnamed_addr constant [43 x i8] c"   %ld Cache lines for blocking transpose\0A\00", align 1
@.str33 = private unnamed_addr constant [43 x i8] c"   %ld Cache lines for blocking transpose\0A\00", align 1
@.str34_dup = private unnamed_addr constant [22 x i8] c"   %d Byte line size\0A\00", align 1
@.str34 = private unnamed_addr constant [22 x i8] c"   %d Byte line size\0A\00", align 1
@.str35_dup = private unnamed_addr constant [22 x i8] c"   %d Bytes per page\0A\00", align 1
@.str35 = private unnamed_addr constant [22 x i8] c"   %d Bytes per page\0A\00", align 1
@ck1_dup = common global double 0.000000e+00, align 8
@ck1 = common global double 0.000000e+00, align 8
@ck3_dup = common global double 0.000000e+00, align 8
@ck3 = common global double 0.000000e+00, align 8
@.str43_dup = private unnamed_addr constant [42 x i8] c"Checksum difference is %.3f (%.3f, %.3f)\0A\00", align 1
@.str43 = private unnamed_addr constant [42 x i8] c"Checksum difference is %.3f (%.3f, %.3f)\0A\00", align 1
@__stderrp = external global %struct.__sFILE*
@.str46_dup = private unnamed_addr constant [44 x i8] c"Proc %ld could not malloc memory for upriv\0A\00", align 1
@.str46 = private unnamed_addr constant [44 x i8] c"Proc %ld could not malloc memory for upriv\0A\00", align 1
@.str47_dup = private unnamed_addr constant [13 x i8] c" %4.2f %4.2f\00", align 1
@.str47 = private unnamed_addr constant [13 x i8] c" %4.2f %4.2f\00", align 1
@.str49_dup = private unnamed_addr constant [11 x i8] c"ERROR: %s\0A\00", align 1
@.str49 = private unnamed_addr constant [11 x i8] c"ERROR: %s\0A\00", align 1
@str_dup = private unnamed_addr constant [28 x i8] c"FFT with Blocking Transpose\00"
@str = private unnamed_addr constant [28 x i8] c"FFT with Blocking Transpose\00"
@str51_dup = private unnamed_addr constant [36 x i8] c"                 PROCESS STATISTICS\00"
@str51 = private unnamed_addr constant [36 x i8] c"                 PROCESS STATISTICS\00"
@str52_dup = private unnamed_addr constant [53 x i8] c"            Computation      Transpose     Transpose\00"
@str52 = private unnamed_addr constant [53 x i8] c"            Computation      Transpose     Transpose\00"
@str53_dup = private unnamed_addr constant [52 x i8] c" Proc          Time            Time        Fraction\00"
@str53 = private unnamed_addr constant [52 x i8] c" Proc          Time            Time        Fraction\00"
@str54_dup = private unnamed_addr constant [39 x i8] c"              INVERSE FFT TEST RESULTS\00"
@str54 = private unnamed_addr constant [39 x i8] c"              INVERSE FFT TEST RESULTS\00"
@str55_dup = private unnamed_addr constant [12 x i8] c"TEST FAILED\00"
@str55 = private unnamed_addr constant [12 x i8] c"TEST FAILED\00"
@str56_dup = private unnamed_addr constant [12 x i8] c"TEST PASSED\00"
@str56 = private unnamed_addr constant [12 x i8] c"TEST PASSED\00"
@str57_dup = private unnamed_addr constant [23 x i8] c"Data values after FFT:\00"
@str57 = private unnamed_addr constant [23 x i8] c"Data values after FFT:\00"
@str58_dup = private unnamed_addr constant [31 x i8] c"Data values after inverse FFT:\00"
@str58 = private unnamed_addr constant [31 x i8] c"Data values after inverse FFT:\00"
@str59_dup = private unnamed_addr constant [22 x i8] c"Original data values:\00"
@str59 = private unnamed_addr constant [22 x i8] c"Original data values:\00"
@str60_dup = private unnamed_addr constant [42 x i8] c"  => Less than one element per cache line\00"
@str60 = private unnamed_addr constant [42 x i8] c"  => Less than one element per cache line\00"
@str61_dup = private unnamed_addr constant [41 x i8] c"     Computing transpose blocking factor\00"
@str61 = private unnamed_addr constant [41 x i8] c"     Computing transpose blocking factor\00"
@str62_dup = private unnamed_addr constant [22 x i8] c"Usage: FFT <options>\0A\00"
@str62 = private unnamed_addr constant [22 x i8] c"Usage: FFT <options>\0A\00"
@str63_dup = private unnamed_addr constant [9 x i8] c"options:\00"
@str63 = private unnamed_addr constant [9 x i8] c"options:\00"
@str64_dup = private unnamed_addr constant [70 x i8] c"  -mM : M = even integer; 2**M total complex data points transformed.\00"
@str64 = private unnamed_addr constant [70 x i8] c"  -mM : M = even integer; 2**M total complex data points transformed.\00"
@str65_dup = private unnamed_addr constant [56 x i8] c"  -pP : P = number of processors; Must be a power of 2.\00"
@str65 = private unnamed_addr constant [56 x i8] c"  -pP : P = number of processors; Must be a power of 2.\00"
@str66_dup = private unnamed_addr constant [35 x i8] c"  -nN : N = number of cache lines.\00"
@str66 = private unnamed_addr constant [35 x i8] c"  -nN : N = number of cache lines.\00"
@str67_dup = private unnamed_addr constant [54 x i8] c"  -lL : L = Log base 2 of cache line length in bytes.\00"
@str67 = private unnamed_addr constant [54 x i8] c"  -lL : L = Log base 2 of cache line length in bytes.\00"
@str68_dup = private unnamed_addr constant [54 x i8] c"  -s  : Print individual processor timing statistics.\00"
@str68 = private unnamed_addr constant [54 x i8] c"  -s  : Print individual processor timing statistics.\00"
@str69_dup = private unnamed_addr constant [67 x i8] c"  -t  : Perform FFT and inverse FFT.  Test output by comparing the\00"
@str69 = private unnamed_addr constant [67 x i8] c"  -t  : Perform FFT and inverse FFT.  Test output by comparing the\00"
@str70_dup = private unnamed_addr constant [71 x i8] c"        integral of the original data to the integral of the data that\00"
@str70 = private unnamed_addr constant [71 x i8] c"        integral of the original data to the integral of the data that\00"
@str71_dup = private unnamed_addr constant [57 x i8] c"        results from performing the FFT and inverse FFT.\00"
@str71 = private unnamed_addr constant [57 x i8] c"        results from performing the FFT and inverse FFT.\00"
@str72_dup = private unnamed_addr constant [39 x i8] c"  -o  : Print out complex data points.\00"
@str72 = private unnamed_addr constant [39 x i8] c"  -o  : Print out complex data points.\00"
@str73_dup = private unnamed_addr constant [41 x i8] c"  -h  : Print out command line options.\0A\00"
@str73 = private unnamed_addr constant [41 x i8] c"  -h  : Print out command line options.\0A\00"
@str74_dup = private unnamed_addr constant [7 x i8] c"start\0D\00"
@str74 = private unnamed_addr constant [7 x i8] c"start\0D\00"
@EDDI_error_msg = private unnamed_addr constant [14 x i8] c"EDDI Failed.\0A\00", align 1

define <{ i32, i32 }> @fft_compute(i32 %argc, i32 %argc_dup, i8** %argv, i8** %argv_dup) {
entry:
  %call321 = tail call i32 @"\01_getopt"(i32 %argc, i8** %argv, i8* getelementptr inbounds ([13 x i8]* @.str, i64 0, i64 0)) #6
  %cmp322 = icmp eq i32 %call321, -1
  %call321_dup = tail call i32 @"\01_getopt"(i32 %argc_dup, i8** %argv_dup, i8* getelementptr inbounds ([13 x i8]* @.str_dup, i64 0, i64 0)) #6
  %cmp322_dup = icmp eq i32 %call321_dup, -1
  %cmp322_QED_CHECK_0 = icmp eq i1 %cmp322, %cmp322_dup
  call void @eddi_check_function(i1 %cmp322_QED_CHECK_0)
  br i1 %cmp322, label %while.end, label %while.body

while.body:                                       ; preds = %while.cond.backedge, %entry
  %call323 = phi i32 [ %call, %while.cond.backedge ], [ %call321, %entry ]
  %call323_dup = phi i32 [ %call, %while.cond.backedge ], [ %call321_dup, %entry ]
  %conv = sext i32 %call323 to i64
  %conv_dup = sext i32 %call323_dup to i64
  %call323_QED_CHECK_155 = icmp eq i32 %call323, %call323_dup
  %conv_QED_CHECK_156 = icmp eq i64 %conv, %conv_dup
  %while.body_error = and i1 %call323_QED_CHECK_155, %conv_QED_CHECK_156
  call void @eddi_check_function(i1 %while.body_error)
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
  %call2 = tail call i32 @atoi(i8* undef) #6
  %conv3 = sext i32 %call2 to i64
  store i64 %conv3, i64* @P, align 8, !tbaa !0
  %cmp4 = icmp slt i32 %call2, 1
  %call2_dup = tail call i32 @atoi(i8* undef) #6
  %conv3_dup = sext i32 %call2_dup to i64
  store i64 %conv3_dup, i64* @P_dup, align 8, !tbaa !0
  %cmp4_dup = icmp slt i32 %call2_dup, 1
  %conv3conv3 = icmp eq i64 %conv3, %conv3_dup
  %cmp4_QED_CHECK_159 = icmp eq i1 %cmp4, %cmp4_dup
  %sw.bb_error = and i1 %conv3conv3, %cmp4_QED_CHECK_159
  call void @eddi_check_function(i1 %sw.bb_error)
  br i1 %cmp4, label %if.then, label %while.cond.outer.i.preheader

while.cond.outer.i.preheader:                     ; preds = %sw.bb
  %cmp2.i312 = icmp eq i32 %call2, 1
  %notlhs313 = icmp slt i32 %call2, 2
  %cmp2.i312_dup = icmp eq i32 %call2_dup, 1
  %notlhs313_dup = icmp slt i32 %call2_dup, 2
  %cmp2.i312_QED_CHECK_160 = icmp eq i1 %cmp2.i312, %cmp2.i312_dup
  %"notlhs313\00\00\00\00\00\00\00\90&\00_161" = icmp eq i1 %notlhs313, %notlhs313_dup
  %while.cond.outer.i.preheader_error = and i1 %cmp2.i312_QED_CHECK_160, %"notlhs313\00\00\00\00\00\00\00\90&\00_161"
  call void @eddi_check_function(i1 %while.cond.outer.i.preheader_error)
  br i1 %notlhs313, label %log_2.exit, label %if.else.i

if.then:                                          ; preds = %sw.bb
  %0 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !3
  %call.i = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %0, i8* getelementptr inbounds ([11 x i8]* @.str49, i64 0, i64 0), i8* getelementptr inbounds ([16 x i8]* @.str1, i64 0, i64 0)) #6
  tail call void @exit(i32 -1) #7
  %1 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !3
  %call.i_dup = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %1, i8* getelementptr inbounds ([11 x i8]* @.str49_dup, i64 0, i64 0), i8* getelementptr inbounds ([16 x i8]* @.str1_dup, i64 0, i64 0)) #6
  tail call void @exit(i32 -1) #7
  unreachable

if.else.i:                                        ; preds = %if.else.i, %while.cond.outer.i.preheader
  %out.0.ph.i317 = phi i64 [ %inc.i, %if.else.i ], [ 0, %while.cond.outer.i.preheader ]
  %cumulative.0.ph.i316 = phi i64 [ %mul.i, %if.else.i ], [ 1, %while.cond.outer.i.preheader ]
  %out.0.ph.i317_dup = phi i64 [ %inc.i_dup, %if.else.i ], [ 0, %while.cond.outer.i.preheader ]
  %cumulative.0.ph.i316_dup = phi i64 [ %mul.i_dup, %if.else.i ], [ 1, %while.cond.outer.i.preheader ]
  %mul.i = shl nsw i64 %cumulative.0.ph.i316, 1
  %inc.i = add nsw i64 %out.0.ph.i317, 1
  %cmp2.i = icmp eq i64 %mul.i, %conv3
  %notlhs = icmp sge i64 %mul.i, %conv3
  %notrhs = icmp sgt i64 %out.0.ph.i317, 48
  %or.cond.not = or i1 %notrhs, %notlhs
  %brmerge = or i1 %or.cond.not, %cmp2.i
  %mul.i_dup = shl nsw i64 %cumulative.0.ph.i316_dup, 1
  %inc.i_dup = add nsw i64 %out.0.ph.i317_dup, 1
  %cmp2.i_dup = icmp eq i64 %mul.i_dup, %conv3_dup
  %notlhs_dup = icmp sge i64 %mul.i_dup, %conv3_dup
  %notrhs_dup = icmp sgt i64 %out.0.ph.i317_dup, 48
  %or.cond.not_dup = or i1 %notrhs_dup, %notlhs_dup
  %brmerge_dup = or i1 %or.cond.not_dup, %cmp2.i_dup
  %out.0.ph.i317_QED_CHECK_170 = icmp eq i64 %out.0.ph.i317, %out.0.ph.i317_dup
  %cumulative.0.ph.i316_QED_CHECK_171 = icmp eq i64 %cumulative.0.ph.i316, %cumulative.0.ph.i316_dup
  %mul.i_QED_CHECK_172 = icmp eq i64 %mul.i, %mul.i_dup
  %inc.i_QED_CHECK_173 = icmp eq i64 %inc.i, %inc.i_dup
  %cmp2.i_QED_CHECK_174 = icmp eq i1 %cmp2.i, %cmp2.i_dup
  %notlhs_QED_CHECK_175 = icmp eq i1 %notlhs, %notlhs_dup
  %notrhs_QED_CHECK_176 = icmp eq i1 %notrhs, %notrhs_dup
  %or.cond.not_QED_CHECK_177 = icmp eq i1 %or.cond.not, %or.cond.not_dup
  %brmerge_QED_CHECK_178 = icmp eq i1 %brmerge, %brmerge_dup
  %2 = and i1 %out.0.ph.i317_QED_CHECK_170, %cumulative.0.ph.i316_QED_CHECK_171
  %3 = and i1 %mul.i_QED_CHECK_172, %inc.i_QED_CHECK_173
  %4 = and i1 %2, %3
  %5 = and i1 %cmp2.i_QED_CHECK_174, %notlhs_QED_CHECK_175
  %6 = and i1 %or.cond.not_QED_CHECK_177, %brmerge_QED_CHECK_178
  %7 = and i1 %notrhs_QED_CHECK_176, %6
  %8 = and i1 %5, %7
  %if.else.i_error = and i1 %4, %8
  call void @eddi_check_function(i1 %if.else.i_error)
  br i1 %brmerge, label %while.cond.outer.i.log_2.exit_crit_edge, label %if.else.i

while.cond.outer.i.log_2.exit_crit_edge:          ; preds = %if.else.i
  %phitmp = icmp eq i64 %inc.i, -1
  %phitmp_dup = icmp eq i64 %inc.i_dup, -1
  %phitmp_QED_CHECK_179 = icmp eq i1 %phitmp, %phitmp_dup
  call void @eddi_check_function(i1 %phitmp_QED_CHECK_179)
  br label %log_2.exit

log_2.exit:                                       ; preds = %while.cond.outer.i.log_2.exit_crit_edge, %while.cond.outer.i.preheader
  %notrhs.lcssa = phi i1 [ %notrhs, %while.cond.outer.i.log_2.exit_crit_edge ], [ false, %while.cond.outer.i.preheader ]
  %notlhs.lcssa = phi i1 [ %notlhs, %while.cond.outer.i.log_2.exit_crit_edge ], [ true, %while.cond.outer.i.preheader ]
  %cmp2.i.lcssa = phi i1 [ %cmp2.i, %while.cond.outer.i.log_2.exit_crit_edge ], [ %cmp2.i312, %while.cond.outer.i.preheader ]
  %out.0.ph.i.lcssa = phi i1 [ %phitmp, %while.cond.outer.i.log_2.exit_crit_edge ], [ false, %while.cond.outer.i.preheader ]
  %notrhs.lcssa_dup = phi i1 [ %notrhs_dup, %while.cond.outer.i.log_2.exit_crit_edge ], [ false, %while.cond.outer.i.preheader ]
  %notlhs.lcssa_dup = phi i1 [ %notlhs_dup, %while.cond.outer.i.log_2.exit_crit_edge ], [ true, %while.cond.outer.i.preheader ]
  %cmp2.i.lcssa_dup = phi i1 [ %cmp2.i_dup, %while.cond.outer.i.log_2.exit_crit_edge ], [ %cmp2.i312_dup, %while.cond.outer.i.preheader ]
  %out.0.ph.i.lcssa_dup = phi i1 [ %phitmp_dup, %while.cond.outer.i.log_2.exit_crit_edge ], [ false, %while.cond.outer.i.preheader ]
  %not.or.cond.not.demorgan = or i1 %notrhs.lcssa, %notlhs.lcssa
  %cmp2.i.not = xor i1 %cmp2.i.lcssa, true
  %not.cmp2.i.mux = and i1 %not.or.cond.not.demorgan, %cmp2.i.not
  %cmp7 = or i1 %out.0.ph.i.lcssa, %not.cmp2.i.mux
  %not.or.cond.not.demorgan_dup = or i1 %notrhs.lcssa_dup, %notlhs.lcssa_dup
  %cmp2.i.not_dup = xor i1 %cmp2.i.lcssa_dup, true
  %not.cmp2.i.mux_dup = and i1 %not.or.cond.not.demorgan_dup, %cmp2.i.not_dup
  %cmp7_dup = or i1 %out.0.ph.i.lcssa_dup, %not.cmp2.i.mux_dup
  %notrhs.lcssa_QED_CHECK_162 = icmp eq i1 %notrhs.lcssa, %notrhs.lcssa_dup
  %notlhs.lcssa_QED_CHECK_163 = icmp eq i1 %notlhs.lcssa, %notlhs.lcssa_dup
  %cmp2.i.lcssa_QED_CHECK_164 = icmp eq i1 %cmp2.i.lcssa, %cmp2.i.lcssa_dup
  %out.0.ph.i.lcssa_QED_CHECK_165 = icmp eq i1 %out.0.ph.i.lcssa, %out.0.ph.i.lcssa_dup
  %not.or.cond.not.demorgannot.or.cond.not.demorgan = icmp eq i1 %not.or.cond.not.demorgan, %not.or.cond.not.demorgan_dup
  %cmp2.i.not_QED_CHECK_167 = icmp eq i1 %cmp2.i.not, %cmp2.i.not_dup
  %not.cmp2.i.mux_QED_CHECK_168 = icmp eq i1 %not.cmp2.i.mux, %not.cmp2.i.mux_dup
  %cmp7_QED_CHECK_169 = icmp eq i1 %cmp7, %cmp7_dup
  %9 = and i1 %notrhs.lcssa_QED_CHECK_162, %notlhs.lcssa_QED_CHECK_163
  %10 = and i1 %cmp2.i.lcssa_QED_CHECK_164, %out.0.ph.i.lcssa_QED_CHECK_165
  %11 = and i1 %9, %10
  %12 = and i1 %not.or.cond.not.demorgannot.or.cond.not.demorgan, %cmp2.i.not_QED_CHECK_167
  %13 = and i1 %not.cmp2.i.mux_QED_CHECK_168, %cmp7_QED_CHECK_169
  %14 = and i1 %12, %13
  %log_2.exit_error = and i1 %11, %14
  call void @eddi_check_function(i1 %log_2.exit_error)
  br i1 %cmp7, label %if.then9, label %while.cond.backedge

if.then9:                                         ; preds = %log_2.exit
  %15 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !3
  %call.i254 = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %15, i8* getelementptr inbounds ([11 x i8]* @.str49, i64 0, i64 0), i8* getelementptr inbounds ([24 x i8]* @.str2, i64 0, i64 0)) #6
  tail call void @exit(i32 -1) #7
  %16 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !3
  %call.i254_dup = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %16, i8* getelementptr inbounds ([11 x i8]* @.str49_dup, i64 0, i64 0), i8* getelementptr inbounds ([24 x i8]* @.str2_dup, i64 0, i64 0)) #6
  tail call void @exit(i32 -1) #7
  unreachable

sw.bb11:                                          ; preds = %while.body
  %call12 = tail call i32 @atoi(i8* undef) #6
  %conv13 = sext i32 %call12 to i64
  store i64 %conv13, i64* @M, align 8, !tbaa !0
  %div = sdiv i64 %conv13, 2
  %mul = shl nsw i64 %div, 1
  %cmp14 = icmp eq i64 %mul, %conv13
  %call12_dup = tail call i32 @atoi(i8* undef) #6
  %conv13_dup = sext i32 %call12_dup to i64
  store i64 %conv13_dup, i64* @M_dup, align 8, !tbaa !0
  %div_dup = sdiv i64 %conv13_dup, 2
  %mul_dup = shl nsw i64 %div_dup, 1
  %cmp14_dup = icmp eq i64 %mul_dup, %conv13_dup
  %conv13conv13 = icmp eq i64 %conv13, %conv13_dup
  %div_QED_CHECK_181 = icmp eq i64 %div, %div_dup
  %mul_QED_CHECK_182 = icmp eq i64 %mul, %mul_dup
  %cmp14_QED_CHECK_183 = icmp eq i1 %cmp14, %cmp14_dup
  %17 = and i1 %conv13conv13, %div_QED_CHECK_181
  %18 = and i1 %mul_QED_CHECK_182, %cmp14_QED_CHECK_183
  %sw.bb11_error = and i1 %17, %18
  call void @eddi_check_function(i1 %sw.bb11_error)
  br i1 %cmp14, label %while.cond.backedge, label %if.then16

if.then16:                                        ; preds = %sw.bb11
  %19 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !3
  %call.i255 = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %19, i8* getelementptr inbounds ([11 x i8]* @.str49, i64 0, i64 0), i8* getelementptr inbounds ([16 x i8]* @.str3, i64 0, i64 0)) #6
  tail call void @exit(i32 -1) #7
  %20 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !3
  %call.i255_dup = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %20, i8* getelementptr inbounds ([11 x i8]* @.str49_dup, i64 0, i64 0), i8* getelementptr inbounds ([16 x i8]* @.str3_dup, i64 0, i64 0)) #6
  tail call void @exit(i32 -1) #7
  unreachable

sw.bb18:                                          ; preds = %while.body
  %call19 = tail call i32 @atoi(i8* undef) #6
  %conv20 = sext i32 %call19 to i64
  store i64 %conv20, i64* @num_cache_lines, align 8, !tbaa !0
  store i64 %conv20, i64* @orig_num_lines, align 8, !tbaa !0
  %cmp21 = icmp slt i32 %call19, 1
  %call19_dup = tail call i32 @atoi(i8* undef) #6
  %conv20_dup = sext i32 %call19_dup to i64
  store i64 %conv20_dup, i64* @num_cache_lines_dup, align 8, !tbaa !0
  store i64 %conv20_dup, i64* @orig_num_lines_dup, align 8, !tbaa !0
  %cmp21_dup = icmp slt i32 %call19_dup, 1
  %conv20conv20 = icmp eq i64 %conv20, %conv20_dup
  %cmp21_QED_CHECK_185 = icmp eq i1 %cmp21, %cmp21_dup
  %sw.bb18_error = and i1 %conv20conv20, %cmp21_QED_CHECK_185
  call void @eddi_check_function(i1 %sw.bb18_error)
  br i1 %cmp21, label %if.then23, label %while.cond.backedge

if.then23:                                        ; preds = %sw.bb18
  %21 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !3
  %call.i256 = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %21, i8* getelementptr inbounds ([11 x i8]* @.str49, i64 0, i64 0), i8* getelementptr inbounds ([36 x i8]* @.str4, i64 0, i64 0)) #6
  tail call void @exit(i32 -1) #7
  %22 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !3
  %call.i256_dup = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %22, i8* getelementptr inbounds ([11 x i8]* @.str49_dup, i64 0, i64 0), i8* getelementptr inbounds ([36 x i8]* @.str4_dup, i64 0, i64 0)) #6
  tail call void @exit(i32 -1) #7
  unreachable

sw.bb25:                                          ; preds = %while.body
  %call26 = tail call i32 @atoi(i8* undef) #6
  %conv27 = sext i32 %call26 to i64
  store i64 %conv27, i64* @log2_line_size, align 8, !tbaa !0
  %cmp28 = icmp slt i32 %call26, 0
  %call26_dup = tail call i32 @atoi(i8* undef) #6
  %conv27_dup = sext i32 %call26_dup to i64
  store i64 %conv27_dup, i64* @log2_line_size_dup, align 8, !tbaa !0
  %cmp28_dup = icmp slt i32 %call26_dup, 0
  %conv27conv27 = icmp eq i64 %conv27, %conv27_dup
  %cmp28_QED_CHECK_187 = icmp eq i1 %cmp28, %cmp28_dup
  %sw.bb25_error = and i1 %conv27conv27, %cmp28_QED_CHECK_187
  call void @eddi_check_function(i1 %sw.bb25_error)
  br i1 %cmp28, label %if.then30, label %while.cond.backedge

while.cond.backedge:                              ; preds = %sw.bb39, %sw.bb34, %sw.bb32, %sw.bb25, %sw.bb18, %sw.bb11, %log_2.exit, %while.body
  %call = tail call i32 @"\01_getopt"(i32 %argc, i8** %argv, i8* getelementptr inbounds ([13 x i8]* @.str, i64 0, i64 0)) #6
  %cmp = icmp eq i32 %call, -1
  %call_dup = tail call i32 @"\01_getopt"(i32 %argc_dup, i8** %argv_dup, i8* getelementptr inbounds ([13 x i8]* @.str_dup, i64 0, i64 0)) #6
  %cmp_dup = icmp eq i32 %call_dup, -1
  %cmp_QED_CHECK_157 = icmp eq i1 %cmp, %cmp_dup
  call void @eddi_check_function(i1 %cmp_QED_CHECK_157)
  br i1 %cmp, label %while.end, label %while.body

if.then30:                                        ; preds = %sw.bb25
  %23 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !3
  %call.i257 = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %23, i8* getelementptr inbounds ([11 x i8]* @.str49, i64 0, i64 0), i8* getelementptr inbounds ([55 x i8]* @.str5, i64 0, i64 0)) #6
  tail call void @exit(i32 -1) #7
  %24 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !3
  %call.i257_dup = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %24, i8* getelementptr inbounds ([11 x i8]* @.str49_dup, i64 0, i64 0), i8* getelementptr inbounds ([55 x i8]* @.str5_dup, i64 0, i64 0)) #6
  tail call void @exit(i32 -1) #7
  unreachable

sw.bb32:                                          ; preds = %while.body
  %25 = load i64* @dostats, align 8, !tbaa !0
  %lnot = icmp eq i64 %25, 0
  %conv33 = zext i1 %lnot to i64
  store i64 %conv33, i64* @dostats, align 8, !tbaa !0
  %26 = load i64* @dostats_dup, align 8, !tbaa !0
  %lnot_dup = icmp eq i64 %26, 0
  %conv33_dup = zext i1 %lnot_dup to i64
  store i64 %conv33_dup, i64* @dostats_dup, align 8, !tbaa !0
  %lnot_QED_CHECK_188 = icmp eq i1 %lnot, %lnot_dup
  %conv33_QED_CHECK_189 = icmp eq i64 %conv33, %conv33_dup
  %sw.bb32_error = and i1 %lnot_QED_CHECK_188, %conv33_QED_CHECK_189
  call void @eddi_check_function(i1 %sw.bb32_error)
  br label %while.cond.backedge

sw.bb34:                                          ; preds = %while.body
  %27 = load i64* @test_result, align 8, !tbaa !0
  %lnot36 = icmp eq i64 %27, 0
  %conv38 = zext i1 %lnot36 to i64
  store i64 %conv38, i64* @test_result, align 8, !tbaa !0
  %28 = load i64* @test_result_dup, align 8, !tbaa !0
  %lnot36_dup = icmp eq i64 %28, 0
  %conv38_dup = zext i1 %lnot36_dup to i64
  store i64 %conv38_dup, i64* @test_result_dup, align 8, !tbaa !0
  %lnot36_QED_CHECK_190 = icmp eq i1 %lnot36, %lnot36_dup
  %conv38_QED_CHECK_191 = icmp eq i64 %conv38, %conv38_dup
  %sw.bb34_error = and i1 %lnot36_QED_CHECK_190, %conv38_QED_CHECK_191
  call void @eddi_check_function(i1 %sw.bb34_error)
  br label %while.cond.backedge

sw.bb39:                                          ; preds = %while.body
  %29 = load i64* @doprint, align 8, !tbaa !0
  %lnot41 = icmp eq i64 %29, 0
  %conv43 = zext i1 %lnot41 to i64
  store i64 %conv43, i64* @doprint, align 8, !tbaa !0
  %30 = load i64* @doprint_dup, align 8, !tbaa !0
  %lnot41_dup = icmp eq i64 %30, 0
  %conv43_dup = zext i1 %lnot41_dup to i64
  store i64 %conv43_dup, i64* @doprint_dup, align 8, !tbaa !0
  %lnot41_QED_CHECK_192 = icmp eq i1 %lnot41, %lnot41_dup
  %conv43_QED_CHECK_193 = icmp eq i64 %conv43, %conv43_dup
  %sw.bb39_error = and i1 %lnot41_QED_CHECK_192, %conv43_QED_CHECK_193
  call void @eddi_check_function(i1 %sw.bb39_error)
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
  %call57 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str18, i64 0, i64 0), i32 4, i32 1, i32 256, i32 4) #6
  tail call void @exit(i32 0) #7
  %puts242_dup = tail call i32 @puts(i8* getelementptr inbounds ([22 x i8]* @str62_dup, i64 0, i64 0))
  %puts243_dup = tail call i32 @puts(i8* getelementptr inbounds ([9 x i8]* @str63_dup, i64 0, i64 0))
  %puts244_dup = tail call i32 @puts(i8* getelementptr inbounds ([70 x i8]* @str64_dup, i64 0, i64 0))
  %puts245_dup = tail call i32 @puts(i8* getelementptr inbounds ([56 x i8]* @str65_dup, i64 0, i64 0))
  %puts246_dup = tail call i32 @puts(i8* getelementptr inbounds ([35 x i8]* @str66_dup, i64 0, i64 0))
  %puts247_dup = tail call i32 @puts(i8* getelementptr inbounds ([54 x i8]* @str67_dup, i64 0, i64 0))
  %puts248_dup = tail call i32 @puts(i8* getelementptr inbounds ([54 x i8]* @str68_dup, i64 0, i64 0))
  %puts249_dup = tail call i32 @puts(i8* getelementptr inbounds ([67 x i8]* @str69_dup, i64 0, i64 0))
  %puts250_dup = tail call i32 @puts(i8* getelementptr inbounds ([71 x i8]* @str70_dup, i64 0, i64 0))
  %puts251_dup = tail call i32 @puts(i8* getelementptr inbounds ([57 x i8]* @str71_dup, i64 0, i64 0))
  %puts252_dup = tail call i32 @puts(i8* getelementptr inbounds ([39 x i8]* @str72_dup, i64 0, i64 0))
  %puts253_dup = tail call i32 @puts(i8* getelementptr inbounds ([41 x i8]* @str73_dup, i64 0, i64 0))
  %call57_dup = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str18_dup, i64 0, i64 0), i32 4, i32 1, i32 256, i32 4) #6
  tail call void @exit(i32 0) #7
  unreachable

while.end:                                        ; preds = %while.cond.backedge, %entry
  %31 = load i64* @M, align 8, !tbaa !0
  %sh_prom = trunc i64 %31 to i32
  %shl = shl i32 1, %sh_prom
  %conv58 = sext i32 %shl to i64
  store i64 %conv58, i64* @N, align 8, !tbaa !0
  %div59 = sdiv i64 %31, 2
  %sh_prom60 = trunc i64 %div59 to i32
  %shl61 = shl i32 1, %sh_prom60
  %conv62 = sext i32 %shl61 to i64
  store i64 %conv62, i64* @rootN, align 8, !tbaa !0
  %32 = load i64* @P, align 8, !tbaa !0
  %div63 = sdiv i64 %conv62, %32
  store i64 %div63, i64* @rowsperproc, align 8, !tbaa !0
  %cmp64 = icmp eq i64 %div63, 0
  %33 = load i64* @M_dup, align 8, !tbaa !0
  %sh_prom_dup = trunc i64 %33 to i32
  %shl_dup = shl i32 1, %sh_prom_dup
  %conv58_dup = sext i32 %shl_dup to i64
  store i64 %conv58_dup, i64* @N_dup, align 8, !tbaa !0
  %div59_dup = sdiv i64 %33, 2
  %sh_prom60_dup = trunc i64 %div59_dup to i32
  %shl61_dup = shl i32 1, %sh_prom60_dup
  %conv62_dup = sext i32 %shl61_dup to i64
  store i64 %conv62_dup, i64* @rootN_dup, align 8, !tbaa !0
  %34 = load i64* @P_dup, align 8, !tbaa !0
  %div63_dup = sdiv i64 %conv62_dup, %34
  store i64 %div63_dup, i64* @rowsperproc_dup, align 8, !tbaa !0
  %cmp64_dup = icmp eq i64 %div63_dup, 0
  %sh_prom_QED_CHECK_1 = icmp eq i32 %sh_prom, %sh_prom_dup
  %shl_QED_CHECK_2 = icmp eq i32 %shl, %shl_dup
  %conv58_QED_CHECK_3 = icmp eq i64 %conv58, %conv58_dup
  %div59_QED_CHECK_4 = icmp eq i64 %div59, %div59_dup
  %"sh_prom60\00\00\00\00\00\00\00\900\00_5" = icmp eq i32 %sh_prom60, %sh_prom60_dup
  %shl61_QED_CHECK_6 = icmp eq i32 %shl61, %shl61_dup
  %conv62_QED_CHECK_7 = icmp eq i64 %conv62, %conv62_dup
  %div63_QED_CHECK_8 = icmp eq i64 %div63, %div63_dup
  %cmp64_QED_CHECK_9 = icmp eq i1 %cmp64, %cmp64_dup
  %35 = and i1 %sh_prom_QED_CHECK_1, %shl_QED_CHECK_2
  %36 = and i1 %conv58_QED_CHECK_3, %div59_QED_CHECK_4
  %37 = and i1 %35, %36
  %38 = and i1 %"sh_prom60\00\00\00\00\00\00\00\900\00_5", %shl61_QED_CHECK_6
  %39 = and i1 %div63_QED_CHECK_8, %cmp64_QED_CHECK_9
  %40 = and i1 %conv62_QED_CHECK_7, %39
  %41 = and i1 %38, %40
  %while.end_error = and i1 %37, %41
  call void @eddi_check_function(i1 %while.end_error)
  br i1 %cmp64, label %if.then66, label %if.end67

if.then66:                                        ; preds = %while.end
  %42 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !3
  %call.i258 = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %42, i8* getelementptr inbounds ([11 x i8]* @.str49, i64 0, i64 0), i8* getelementptr inbounds ([48 x i8]* @.str19, i64 0, i64 0)) #6
  tail call void @exit(i32 -1) #7
  %43 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !3
  %call.i258_dup = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %43, i8* getelementptr inbounds ([11 x i8]* @.str49_dup, i64 0, i64 0), i8* getelementptr inbounds ([48 x i8]* @.str19_dup, i64 0, i64 0)) #6
  tail call void @exit(i32 -1) #7
  unreachable

if.end67:                                         ; preds = %while.end
  %44 = load i64* @log2_line_size, align 8, !tbaa !0
  %sh_prom68 = trunc i64 %44 to i32
  %shl69 = shl i32 1, %sh_prom68
  %conv70 = sext i32 %shl69 to i64
  store i64 %conv70, i64* @line_size, align 8, !tbaa !0
  %cmp71 = icmp ult i32 %sh_prom68, 4
  %45 = load i64* @log2_line_size_dup, align 8, !tbaa !0
  %sh_prom68_dup = trunc i64 %45 to i32
  %shl69_dup = shl i32 1, %sh_prom68_dup
  %conv70_dup = sext i32 %shl69_dup to i64
  store i64 %conv70_dup, i64* @line_size_dup, align 8, !tbaa !0
  %cmp71_dup = icmp ult i32 %sh_prom68_dup, 4
  %sh_prom68_QED_CHECK_10 = icmp eq i32 %sh_prom68, %sh_prom68_dup
  %shl69_QED_CHECK_11 = icmp eq i32 %shl69, %shl69_dup
  %conv70_QED_CHECK_12 = icmp eq i64 %conv70, %conv70_dup
  %cmp71_QED_CHECK_13 = icmp eq i1 %cmp71, %cmp71_dup
  %46 = and i1 %sh_prom68_QED_CHECK_10, %shl69_QED_CHECK_11
  %47 = and i1 %conv70_QED_CHECK_12, %cmp71_QED_CHECK_13
  %if.end67_error = and i1 %46, %47
  call void @eddi_check_function(i1 %if.end67_error)
  br i1 %cmp71, label %if.then73, label %if.end79

if.then73:                                        ; preds = %if.end67
  %call74 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([55 x i8]* @.str20, i64 0, i64 0), i64 16) #6
  %puts240 = tail call i32 @puts(i8* getelementptr inbounds ([42 x i8]* @str60, i64 0, i64 0))
  %puts241 = tail call i32 @puts(i8* getelementptr inbounds ([41 x i8]* @str61, i64 0, i64 0))
  %48 = load i64* @line_size, align 8, !tbaa !0
  %div77 = udiv i64 16, %48
  %49 = load i64* @orig_num_lines, align 8, !tbaa !0
  %div78 = sdiv i64 %49, %div77
  store i64 %div78, i64* @num_cache_lines, align 8, !tbaa !0
  %.pre = load i64* @rowsperproc, align 8, !tbaa !0
  %.pre327 = load i64* @rootN, align 8, !tbaa !0
  %call74_dup = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([55 x i8]* @.str20_dup, i64 0, i64 0), i64 16) #6
  %puts240_dup = tail call i32 @puts(i8* getelementptr inbounds ([42 x i8]* @str60_dup, i64 0, i64 0))
  %puts241_dup = tail call i32 @puts(i8* getelementptr inbounds ([41 x i8]* @str61_dup, i64 0, i64 0))
  %50 = load i64* @line_size_dup, align 8, !tbaa !0
  %div77_dup = udiv i64 16, %50
  %51 = load i64* @orig_num_lines_dup, align 8, !tbaa !0
  %div78_dup = sdiv i64 %51, %div77_dup
  store i64 %div78_dup, i64* @num_cache_lines_dup, align 8, !tbaa !0
  %.pre_dup = load i64* @rowsperproc_dup, align 8, !tbaa !0
  %.pre327_dup = load i64* @rootN_dup, align 8, !tbaa !0
  %div77_QED_CHECK_14 = icmp eq i64 %div77, %div77_dup
  %div78_QED_CHECK_15 = icmp eq i64 %div78, %div78_dup
  %if.then73_error = and i1 %div77_QED_CHECK_14, %div78_QED_CHECK_15
  call void @eddi_check_function(i1 %if.then73_error)
  br label %if.end79

if.end79:                                         ; preds = %if.then73, %if.end67
  %52 = phi i64 [ %.pre327, %if.then73 ], [ %conv62, %if.end67 ]
  %53 = phi i64 [ %.pre, %if.then73 ], [ %div63, %if.end67 ]
  %54 = phi i64 [ %48, %if.then73 ], [ %conv70, %if.end67 ]
  %55 = phi i64 [ %.pre327_dup, %if.then73 ], [ %conv62_dup, %if.end67 ]
  %56 = phi i64 [ %.pre_dup, %if.then73 ], [ %div63_dup, %if.end67 ]
  %57 = phi i64 [ %50, %if.then73 ], [ %conv70_dup, %if.end67 ]
  %cmp80 = icmp ult i64 %54, 17
  %div83 = lshr i64 %54, 4
  %storemerge = select i1 %cmp80, i64 1, i64 %div83
  store i64 %storemerge, i64* @pad_length, align 8, !tbaa !0
  %mul85 = shl i64 %53, 4
  %mul87 = mul i64 %mul85, %52
  %cmp88 = icmp ugt i64 %mul87, 4095
  %cmp80_dup = icmp ult i64 %57, 17
  %div83_dup = lshr i64 %57, 4
  %storemerge_dup = select i1 %cmp80_dup, i64 1, i64 %div83_dup
  store i64 %storemerge_dup, i64* @pad_length_dup, align 8, !tbaa !0
  %mul85_dup = shl i64 %56, 4
  %mul87_dup = mul i64 %mul85_dup, %55
  %cmp88_dup = icmp ugt i64 %mul87_dup, 4095
  %_QED_CHECK_16 = icmp eq i64 %52, %55
  %_QED_CHECK_17 = icmp eq i64 %53, %56
  %_QED_CHECK_18 = icmp eq i64 %54, %57
  %cmp80_QED_CHECK_19 = icmp eq i1 %cmp80, %cmp80_dup
  %div83_QED_CHECK_20 = icmp eq i64 %div83, %div83_dup
  %storemerge_QED_CHECK_21 = icmp eq i64 %storemerge, %storemerge_dup
  %mul85_QED_CHECK_22 = icmp eq i64 %mul85, %mul85_dup
  %mul87mul87 = icmp eq i64 %mul87, %mul87_dup
  %cmp88_QED_CHECK_24 = icmp eq i1 %cmp88, %cmp88_dup
  %58 = and i1 %_QED_CHECK_16, %_QED_CHECK_17
  %59 = and i1 %_QED_CHECK_18, %cmp80_QED_CHECK_19
  %60 = and i1 %58, %59
  %61 = and i1 %div83_QED_CHECK_20, %storemerge_QED_CHECK_21
  %62 = and i1 %mul87mul87, %cmp88_QED_CHECK_24
  %63 = and i1 %mul85_QED_CHECK_22, %62
  %64 = and i1 %61, %63
  %if.end79_error = and i1 %60, %64
  call void @eddi_check_function(i1 %if.end79_error)
  br i1 %cmp88, label %if.then90, label %if.else106

if.then90:                                        ; preds = %if.end79
  %mul92 = shl nuw i64 %storemerge, 4
  %mul93 = mul i64 %mul92, %53
  %div94 = lshr i64 %mul93, 12
  %mul95 = shl nuw nsw i64 %div94, 12
  %not.cmp99 = icmp ne i64 %mul95, %mul93
  %inc = zext i1 %not.cmp99 to i64
  %div94.inc = add nsw i64 %inc, %div94
  %mul103 = shl nsw i64 %div94.inc, 12
  %div105 = udiv i64 %mul103, %mul85
  store i64 %div105, i64* @pad_length, align 8, !tbaa !0
  %mul92_dup = shl nuw i64 %storemerge_dup, 4
  %mul93_dup = mul i64 %mul92_dup, %56
  %div94_dup = lshr i64 %mul93_dup, 12
  %mul95_dup = shl nuw nsw i64 %div94_dup, 12
  %not.cmp99_dup = icmp ne i64 %mul95_dup, %mul93_dup
  %inc_dup = zext i1 %not.cmp99_dup to i64
  %div94.inc_dup = add nsw i64 %inc_dup, %div94_dup
  %mul103_dup = shl nsw i64 %div94.inc_dup, 12
  %div105_dup = udiv i64 %mul103_dup, %mul85_dup
  store i64 %div105_dup, i64* @pad_length_dup, align 8, !tbaa !0
  %mul92_QED_CHECK_25 = icmp eq i64 %mul92, %mul92_dup
  %mul93_QED_CHECK_26 = icmp eq i64 %mul93, %mul93_dup
  %div94_QED_CHECK_27 = icmp eq i64 %div94, %div94_dup
  %mul95_QED_CHECK_28 = icmp eq i64 %mul95, %mul95_dup
  %"not.cmp99\00\00\00\00\00\00\00\90'\00_29" = icmp eq i1 %not.cmp99, %not.cmp99_dup
  %inc_QED_CHECK_30 = icmp eq i64 %inc, %inc_dup
  %"div94.inc\00\00\00\00\00\00\00\906\00_31" = icmp eq i64 %div94.inc, %div94.inc_dup
  %mul103_QED_CHECK_32 = icmp eq i64 %mul103, %mul103_dup
  %div105div105 = icmp eq i64 %div105, %div105_dup
  %65 = and i1 %mul92_QED_CHECK_25, %mul93_QED_CHECK_26
  %66 = and i1 %div94_QED_CHECK_27, %mul95_QED_CHECK_28
  %67 = and i1 %65, %66
  %68 = and i1 %"not.cmp99\00\00\00\00\00\00\00\90'\00_29", %inc_QED_CHECK_30
  %69 = and i1 %mul103_QED_CHECK_32, %div105div105
  %70 = and i1 %"div94.inc\00\00\00\00\00\00\00\906\00_31", %69
  %71 = and i1 %68, %70
  %if.then90_error = and i1 %67, %71
  call void @eddi_check_function(i1 %if.then90_error)
  br label %if.end122

if.else106:                                       ; preds = %if.end79
  %sub = sub i64 4096, %mul87
  %div111 = udiv i64 %sub, %mul85
  store i64 %div111, i64* @pad_length, align 8, !tbaa !0
  %mul112 = shl i64 %div111, 4
  %mul113 = mul i64 %mul112, %53
  %cmp118 = icmp eq i64 %mul113, %sub
  %sub_dup = sub i64 4096, %mul87_dup
  %div111_dup = udiv i64 %sub_dup, %mul85_dup
  store i64 %div111_dup, i64* @pad_length_dup, align 8, !tbaa !0
  %mul112_dup = shl i64 %div111_dup, 4
  %mul113_dup = mul i64 %mul112_dup, %56
  %cmp118_dup = icmp eq i64 %mul113_dup, %sub_dup
  %sub_QED_CHECK_150 = icmp eq i64 %sub, %sub_dup
  %div111_QED_CHECK_151 = icmp eq i64 %div111, %div111_dup
  %mul112_QED_CHECK_152 = icmp eq i64 %mul112, %mul112_dup
  %mul113_QED_CHECK_153 = icmp eq i64 %mul113, %mul113_dup
  %cmp118_QED_CHECK_154 = icmp eq i1 %cmp118, %cmp118_dup
  %72 = and i1 %sub_QED_CHECK_150, %div111_QED_CHECK_151
  %73 = and i1 %mul113_QED_CHECK_153, %cmp118_QED_CHECK_154
  %74 = and i1 %mul112_QED_CHECK_152, %73
  %if.else106_error = and i1 %72, %74
  call void @eddi_check_function(i1 %if.else106_error)
  br i1 %cmp118, label %if.end122, label %if.then120

if.then120:                                       ; preds = %if.else106
  %75 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !3
  %call.i259 = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %75, i8* getelementptr inbounds ([11 x i8]* @.str49, i64 0, i64 0), i8* getelementptr inbounds ([32 x i8]* @.str23, i64 0, i64 0)) #6
  tail call void @exit(i32 -1) #7
  %76 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !3
  %call.i259_dup = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %76, i8* getelementptr inbounds ([11 x i8]* @.str49_dup, i64 0, i64 0), i8* getelementptr inbounds ([32 x i8]* @.str23_dup, i64 0, i64 0)) #6
  tail call void @exit(i32 -1) #7
  unreachable

if.end122:                                        ; preds = %if.else106, %if.then90
  %77 = phi i64 [ %div111, %if.else106 ], [ %div105, %if.then90 ]
  %78 = phi i64 [ %div111_dup, %if.else106 ], [ %div105_dup, %if.then90 ]
  %79 = load i64* @N, align 8, !tbaa !0
  %mul123 = mul nsw i64 %77, %52
  %add = add nsw i64 %mul123, %79
  %mul125 = shl i64 %add, 4
  %add126 = add i64 %mul125, 4096
  %call127 = tail call i8* @valloc(i64 %add126) #6
  %80 = bitcast i8* %call127 to double*
  store double* %80, double** @x, align 8, !tbaa !3
  %call133 = tail call i8* @valloc(i64 %add126) #6
  %81 = bitcast i8* %call133 to double*
  store double* %81, double** @trans, align 8, !tbaa !3
  %mul135 = shl i64 %52, 4
  %call136 = tail call i8* @valloc(i64 %mul135) #6
  %82 = bitcast i8* %call136 to double*
  store double* %82, double** @umain, align 8, !tbaa !3
  %call142 = tail call i8* @valloc(i64 %add126) #6
  %83 = bitcast i8* %call142 to double*
  store double* %83, double** @umain2, align 8, !tbaa !3
  %cmp143 = icmp eq i8* %call127, null
  %84 = load i64* @N_dup, align 8, !tbaa !0
  %mul123_dup = mul nsw i64 %78, %55
  %add_dup = add nsw i64 %mul123_dup, %84
  %mul125_dup = shl i64 %add_dup, 4
  %add126_dup = add i64 %mul125_dup, 4096
  %call127_dup = tail call i8* @valloc(i64 %add126_dup) #6
  %85 = bitcast i8* %call127_dup to double*
  store double* %85, double** @x_dup, align 8, !tbaa !3
  %call133_dup = tail call i8* @valloc(i64 %add126_dup) #6
  %86 = bitcast i8* %call133_dup to double*
  store double* %86, double** @trans_dup, align 8, !tbaa !3
  %mul135_dup = shl i64 %55, 4
  %call136_dup = tail call i8* @valloc(i64 %mul135_dup) #6
  %87 = bitcast i8* %call136_dup to double*
  store double* %87, double** @umain_dup, align 8, !tbaa !3
  %call142_dup = tail call i8* @valloc(i64 %add126_dup) #6
  %88 = bitcast i8* %call142_dup to double*
  store double* %88, double** @umain2_dup, align 8, !tbaa !3
  %cmp143_dup = icmp eq i8* %call127_dup, null
  %_QED_CHECK_34 = icmp eq i64 %77, %78
  %mul123_QED_CHECK_35 = icmp eq i64 %mul123, %mul123_dup
  %add_QED_CHECK_36 = icmp eq i64 %add, %add_dup
  %mul125_QED_CHECK_37 = icmp eq i64 %mul125, %mul125_dup
  %add126_QED_CHECK_38 = icmp eq i64 %add126, %add126_dup
  %mul135_QED_CHECK_39 = icmp eq i64 %mul135, %mul135_dup
  %cmp143_QED_CHECK_40 = icmp eq i1 %cmp143, %cmp143_dup
  %89 = and i1 %mul123_QED_CHECK_35, %add_QED_CHECK_36
  %90 = and i1 %_QED_CHECK_34, %89
  %91 = and i1 %mul125_QED_CHECK_37, %add126_QED_CHECK_38
  %92 = and i1 %mul135_QED_CHECK_39, %cmp143_QED_CHECK_40
  %93 = and i1 %91, %92
  %if.end122_error = and i1 %90, %93
  call void @eddi_check_function(i1 %if.end122_error)
  br i1 %cmp143, label %if.then145, label %if.else146

if.then145:                                       ; preds = %if.end122
  %94 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !3
  %call.i260 = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %94, i8* getelementptr inbounds ([11 x i8]* @.str49, i64 0, i64 0), i8* getelementptr inbounds ([31 x i8]* @.str24, i64 0, i64 0)) #6
  tail call void @exit(i32 -1) #7
  %95 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !3
  %call.i260_dup = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %95, i8* getelementptr inbounds ([11 x i8]* @.str49_dup, i64 0, i64 0), i8* getelementptr inbounds ([31 x i8]* @.str24_dup, i64 0, i64 0)) #6
  tail call void @exit(i32 -1) #7
  unreachable

if.else146:                                       ; preds = %if.end122
  %cmp147 = icmp eq i8* %call133, null
  %cmp147_dup = icmp eq i8* %call133_dup, null
  %cmp147_QED_CHECK_41 = icmp eq i1 %cmp147, %cmp147_dup
  call void @eddi_check_function(i1 %cmp147_QED_CHECK_41)
  br i1 %cmp147, label %if.then149, label %if.else150

if.then149:                                       ; preds = %if.else146
  %96 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !3
  %call.i261 = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %96, i8* getelementptr inbounds ([11 x i8]* @.str49, i64 0, i64 0), i8* getelementptr inbounds ([35 x i8]* @.str25, i64 0, i64 0)) #6
  tail call void @exit(i32 -1) #7
  %97 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !3
  %call.i261_dup = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %97, i8* getelementptr inbounds ([11 x i8]* @.str49_dup, i64 0, i64 0), i8* getelementptr inbounds ([35 x i8]* @.str25_dup, i64 0, i64 0)) #6
  tail call void @exit(i32 -1) #7
  unreachable

if.else150:                                       ; preds = %if.else146
  %cmp151 = icmp eq i8* %call136, null
  %cmp151_dup = icmp eq i8* %call136_dup, null
  %cmp151cmp151 = icmp eq i1 %cmp151, %cmp151_dup
  call void @eddi_check_function(i1 %cmp151cmp151)
  br i1 %cmp151, label %if.then153, label %if.else154

if.then153:                                       ; preds = %if.else150
  %98 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !3
  %call.i262 = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %98, i8* getelementptr inbounds ([11 x i8]* @.str49, i64 0, i64 0), i8* getelementptr inbounds ([35 x i8]* @.str26, i64 0, i64 0)) #6
  tail call void @exit(i32 -1) #7
  %99 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !3
  %call.i262_dup = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %99, i8* getelementptr inbounds ([11 x i8]* @.str49_dup, i64 0, i64 0), i8* getelementptr inbounds ([35 x i8]* @.str26_dup, i64 0, i64 0)) #6
  tail call void @exit(i32 -1) #7
  unreachable

if.else154:                                       ; preds = %if.else150
  %cmp155 = icmp eq i8* %call142, null
  %cmp155_dup = icmp eq i8* %call142_dup, null
  %cmp155_QED_CHECK_43 = icmp eq i1 %cmp155, %cmp155_dup
  call void @eddi_check_function(i1 %cmp155_QED_CHECK_43)
  br i1 %cmp155, label %if.then157, label %if.end161

if.then157:                                       ; preds = %if.else154
  %100 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !3
  %call.i263 = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %100, i8* getelementptr inbounds ([11 x i8]* @.str49, i64 0, i64 0), i8* getelementptr inbounds ([36 x i8]* @.str27, i64 0, i64 0)) #6
  tail call void @exit(i32 -1) #7
  %101 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !3
  %call.i263_dup = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %101, i8* getelementptr inbounds ([11 x i8]* @.str49_dup, i64 0, i64 0), i8* getelementptr inbounds ([36 x i8]* @.str27_dup, i64 0, i64 0)) #6
  tail call void @exit(i32 -1) #7
  unreachable

if.end161:                                        ; preds = %if.else154
  %102 = ptrtoint i8* %call127 to i64
  %add162 = add i64 %102, 4096
  %rem = and i64 %102, 4095
  %sub163 = sub i64 %add162, %rem
  %103 = inttoptr i64 %sub163 to double*
  store double* %103, double** @x, align 8, !tbaa !3
  %104 = ptrtoint i8* %call133 to i64
  %add164 = add i64 %104, 4096
  %rem165 = and i64 %104, 4095
  %sub166 = sub i64 %add164, %rem165
  %105 = inttoptr i64 %sub166 to double*
  store double* %105, double** @trans, align 8, !tbaa !3
  %106 = ptrtoint i8* %call142 to i64
  %add167 = add i64 %106, 4096
  %rem168 = and i64 %106, 4095
  %sub169 = sub i64 %add167, %rem168
  %107 = inttoptr i64 %sub169 to double*
  store double* %107, double** @umain2, align 8, !tbaa !3
  %putchar = tail call i32 @putchar(i32 10) #6
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([28 x i8]* @str, i64 0, i64 0))
  %108 = load i64* @N, align 8, !tbaa !0
  %call172 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([24 x i8]* @.str30, i64 0, i64 0), i64 %108) #6
  %109 = load i64* @P, align 8, !tbaa !0
  %call173 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str31, i64 0, i64 0), i64 %109) #6
  %110 = load i64* @num_cache_lines, align 8, !tbaa !0
  %111 = load i64* @orig_num_lines, align 8, !tbaa !0
  %cmp174 = icmp eq i64 %110, %111
  %112 = ptrtoint i8* %call127_dup to i64
  %add162_dup = add i64 %112, 4096
  %rem_dup = and i64 %112, 4095
  %sub163_dup = sub i64 %add162_dup, %rem_dup
  %113 = inttoptr i64 %sub163_dup to double*
  store double* %113, double** @x_dup, align 8, !tbaa !3
  %114 = ptrtoint i8* %call133_dup to i64
  %add164_dup = add i64 %114, 4096
  %rem165_dup = and i64 %114, 4095
  %sub166_dup = sub i64 %add164_dup, %rem165_dup
  %115 = inttoptr i64 %sub166_dup to double*
  store double* %115, double** @trans_dup, align 8, !tbaa !3
  %116 = ptrtoint i8* %call142_dup to i64
  %add167_dup = add i64 %116, 4096
  %rem168_dup = and i64 %116, 4095
  %sub169_dup = sub i64 %add167_dup, %rem168_dup
  %117 = inttoptr i64 %sub169_dup to double*
  store double* %117, double** @umain2_dup, align 8, !tbaa !3
  %putchar_dup = tail call i32 @putchar(i32 10) #6
  %puts_dup = tail call i32 @puts(i8* getelementptr inbounds ([28 x i8]* @str_dup, i64 0, i64 0))
  %118 = load i64* @N_dup, align 8, !tbaa !0
  %call172_dup = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([24 x i8]* @.str30_dup, i64 0, i64 0), i64 %118) #6
  %119 = load i64* @P_dup, align 8, !tbaa !0
  %call173_dup = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str31_dup, i64 0, i64 0), i64 %119) #6
  %120 = load i64* @num_cache_lines_dup, align 8, !tbaa !0
  %121 = load i64* @orig_num_lines_dup, align 8, !tbaa !0
  %cmp174_dup = icmp eq i64 %120, %121
  %cmp174_QED_CHECK_44 = icmp eq i1 %cmp174, %cmp174_dup
  call void @eddi_check_function(i1 %cmp174_QED_CHECK_44)
  br i1 %cmp174, label %if.else179, label %if.then176

if.then176:                                       ; preds = %if.end161
  %call177 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str32, i64 0, i64 0), i64 %111) #6
  %122 = load i64* @num_cache_lines, align 8, !tbaa !0
  %call178 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([43 x i8]* @.str33, i64 0, i64 0), i64 %122) #6
  %call177_dup = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str32_dup, i64 0, i64 0), i64 %121) #6
  %123 = load i64* @num_cache_lines_dup, align 8, !tbaa !0
  %call178_dup = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([43 x i8]* @.str33_dup, i64 0, i64 0), i64 %123) #6
  br label %if.end181

if.else179:                                       ; preds = %if.end161
  %call180 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str32, i64 0, i64 0), i64 %110) #6
  %call180_dup = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str32_dup, i64 0, i64 0), i64 %120) #6
  br label %if.end181

if.end181:                                        ; preds = %if.else179, %if.then176
  %124 = load i64* @log2_line_size, align 8, !tbaa !0
  %sh_prom182 = trunc i64 %124 to i32
  %shl183 = shl i32 1, %sh_prom182
  %call184 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str34, i64 0, i64 0), i32 %shl183) #6
  %call185 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str35, i64 0, i64 0), i32 4096) #6
  %putchar229 = tail call i32 @putchar(i32 10) #6
  %125 = load double** @x, align 8, !tbaa !3
  tail call void @srand48(i64 0) #6
  %126 = load i64* @rootN, align 8, !tbaa !0
  %cmp24.i = icmp sgt i64 %126, 0
  %127 = load i64* @log2_line_size_dup, align 8, !tbaa !0
  %sh_prom182_dup = trunc i64 %127 to i32
  %shl183_dup = shl i32 1, %sh_prom182_dup
  %call184_dup = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str34_dup, i64 0, i64 0), i32 %shl183_dup) #6
  %call185_dup = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str35_dup, i64 0, i64 0), i32 4096) #6
  %putchar229_dup = tail call i32 @putchar(i32 10) #6
  %128 = load double** @x_dup, align 8, !tbaa !3
  %129 = load i64* @rootN_dup, align 8, !tbaa !0
  %cmp24.i_dup = icmp sgt i64 %129, 0
  %"sh_prom182\A1k<\0A\FB\07\00\90\02\00_45" = icmp eq i32 %sh_prom182, %sh_prom182_dup
  %shl183_QED_CHECK_46 = icmp eq i32 %shl183, %shl183_dup
  %cmp24.icmp24.i = icmp eq i1 %cmp24.i, %cmp24.i_dup
  %130 = and i1 %shl183_QED_CHECK_46, %cmp24.icmp24.i
  %if.end181_error = and i1 %"sh_prom182\A1k<\0A\FB\07\00\90\02\00_45", %130
  call void @eddi_check_function(i1 %if.end181_error)
  br i1 %cmp24.i, label %for.body.i, label %InitX.exit

for.body.i:                                       ; preds = %for.inc11.i, %if.end181
  %131 = phi i64 [ %147, %for.inc11.i ], [ %126, %if.end181 ]
  %132 = phi i64 [ %148, %for.inc11.i ], [ %126, %if.end181 ]
  %j.025.i = phi i64 [ %inc12.i, %for.inc11.i ], [ 0, %if.end181 ]
  %133 = phi i64 [ %149, %for.inc11.i ], [ %129, %if.end181 ]
  %134 = phi i64 [ %150, %for.inc11.i ], [ %129, %if.end181 ]
  %j.025.i_dup = phi i64 [ %inc12.i_dup, %for.inc11.i ], [ 0, %if.end181 ]
  %135 = load i64* @pad_length, align 8, !tbaa !0
  %add.i = add nsw i64 %135, %132
  %mul.i264 = mul nsw i64 %add.i, %j.025.i
  %cmp222.i = icmp sgt i64 %132, 0
  %136 = load i64* @pad_length_dup, align 8, !tbaa !0
  %add.i_dup = add nsw i64 %136, %134
  %mul.i264_dup = mul nsw i64 %add.i_dup, %j.025.i_dup
  %cmp222.i_dup = icmp sgt i64 %134, 0
  %_QED_CHECK_48 = icmp eq i64 %131, %133
  %_QED_CHECK_49 = icmp eq i64 %132, %134
  %j.025.i_QED_CHECK_50 = icmp eq i64 %j.025.i, %j.025.i_dup
  %add.i_QED_CHECK_51 = icmp eq i64 %add.i, %add.i_dup
  %"mul.i264\00\00\00\00\00\00\00\90)\00_52" = icmp eq i64 %mul.i264, %mul.i264_dup
  %"cmp222.i\00\00\00\00\00\00\00\90/\00_53" = icmp eq i1 %cmp222.i, %cmp222.i_dup
  %137 = and i1 %_QED_CHECK_49, %j.025.i_QED_CHECK_50
  %138 = and i1 %_QED_CHECK_48, %137
  %139 = and i1 %"mul.i264\00\00\00\00\00\00\00\90)\00_52", %"cmp222.i\00\00\00\00\00\00\00\90/\00_53"
  %140 = and i1 %add.i_QED_CHECK_51, %139
  %for.body.i_error = and i1 %138, %140
  call void @eddi_check_function(i1 %for.body.i_error)
  br i1 %cmp222.i, label %for.body3.i, label %for.inc11.i

for.body3.i:                                      ; preds = %for.body3.i, %for.body.i
  %i.023.i = phi i64 [ %inc.i266, %for.body3.i ], [ 0, %for.body.i ]
  %i.023.i_dup = phi i64 [ %inc.i266_dup, %for.body3.i ], [ 0, %for.body.i ]
  %call.i265 = tail call double @drand48() #6
  %add4.i = add nsw i64 %i.023.i, %mul.i264
  %mul5.i = shl nsw i64 %add4.i, 1
  %arrayidx.i = getelementptr inbounds double* %125, i64 %mul5.i
  store double %call.i265, double* %arrayidx.i, align 8, !tbaa !4
  %call6.i = tail call double @drand48() #6
  %add921.i = or i64 %mul5.i, 1
  %arrayidx10.i = getelementptr inbounds double* %125, i64 %add921.i
  store double %call6.i, double* %arrayidx10.i, align 8, !tbaa !4
  %inc.i266 = add nsw i64 %i.023.i, 1
  %141 = load i64* @rootN, align 8, !tbaa !0
  %cmp2.i267 = icmp slt i64 %inc.i266, %141
  %add4.i_dup = add nsw i64 %i.023.i_dup, %mul.i264_dup
  %mul5.i_dup = shl nsw i64 %add4.i_dup, 1
  %arrayidx.i_dup = getelementptr inbounds double* %128, i64 %mul5.i_dup
  store double %call.i265, double* %arrayidx.i_dup, align 8, !tbaa !4
  %add921.i_dup = or i64 %mul5.i_dup, 1
  %arrayidx10.i_dup = getelementptr inbounds double* %128, i64 %add921.i_dup
  store double %call6.i, double* %arrayidx10.i_dup, align 8, !tbaa !4
  %inc.i266_dup = add nsw i64 %i.023.i_dup, 1
  %142 = load i64* @rootN_dup, align 8, !tbaa !0
  %cmp2.i267_dup = icmp slt i64 %inc.i266_dup, %142
  %i.023.i_QED_CHECK_54 = icmp eq i64 %i.023.i, %i.023.i_dup
  %add4.i_QED_CHECK_55 = icmp eq i64 %add4.i, %add4.i_dup
  %mul5.i_QED_CHECK_56 = icmp eq i64 %mul5.i, %mul5.i_dup
  %add921.i_QED_CHECK_57 = icmp eq i64 %add921.i, %add921.i_dup
  %inc.i266_QED_CHECK_58 = icmp eq i64 %inc.i266, %inc.i266_dup
  %"cmp2.i267\00\00\00\00\00\00\00\90(\00_59" = icmp eq i1 %cmp2.i267, %cmp2.i267_dup
  %143 = and i1 %add4.i_QED_CHECK_55, %mul5.i_QED_CHECK_56
  %144 = and i1 %i.023.i_QED_CHECK_54, %143
  %145 = and i1 %inc.i266_QED_CHECK_58, %"cmp2.i267\00\00\00\00\00\00\00\90(\00_59"
  %146 = and i1 %add921.i_QED_CHECK_57, %145
  %for.body3.i_error = and i1 %144, %146
  call void @eddi_check_function(i1 %for.body3.i_error)
  br i1 %cmp2.i267, label %for.body3.i, label %for.inc11.i

for.inc11.i:                                      ; preds = %for.body3.i, %for.body.i
  %147 = phi i64 [ %131, %for.body.i ], [ %141, %for.body3.i ]
  %148 = phi i64 [ %132, %for.body.i ], [ %141, %for.body3.i ]
  %149 = phi i64 [ %133, %for.body.i ], [ %142, %for.body3.i ]
  %150 = phi i64 [ %134, %for.body.i ], [ %142, %for.body3.i ]
  %inc12.i = add nsw i64 %j.025.i, 1
  %cmp.i268 = icmp slt i64 %inc12.i, %148
  %inc12.i_dup = add nsw i64 %j.025.i_dup, 1
  %cmp.i268_dup = icmp slt i64 %inc12.i_dup, %150
  %_QED_CHECK_60 = icmp eq i64 %147, %149
  %_QED_CHECK_61 = icmp eq i64 %148, %150
  %inc12.i_QED_CHECK_62 = icmp eq i64 %inc12.i, %inc12.i_dup
  %cmp.i268_QED_CHECK_63 = icmp eq i1 %cmp.i268, %cmp.i268_dup
  %151 = and i1 %_QED_CHECK_60, %_QED_CHECK_61
  %152 = and i1 %inc12.i_QED_CHECK_62, %cmp.i268_QED_CHECK_63
  %for.inc11.i_error = and i1 %151, %152
  call void @eddi_check_function(i1 %for.inc11.i_error)
  br i1 %cmp.i268, label %for.body.i, label %InitX.exit

InitX.exit:                                       ; preds = %for.inc11.i, %if.end181
  %153 = phi i64 [ %126, %if.end181 ], [ %147, %for.inc11.i ]
  %154 = phi i64 [ %129, %if.end181 ], [ %149, %for.inc11.i ]
  %155 = load i64* @test_result, align 8, !tbaa !0
  %tobool187 = icmp eq i64 %155, 0
  %156 = load i64* @test_result_dup, align 8, !tbaa !0
  %tobool187_dup = icmp eq i64 %156, 0
  %_QED_CHECK_64 = icmp eq i64 %153, %154
  %tobool187_QED_CHECK_65 = icmp eq i1 %tobool187, %tobool187_dup
  %InitX.exit_error = and i1 %_QED_CHECK_64, %tobool187_QED_CHECK_65
  call void @eddi_check_function(i1 %InitX.exit_error)
  br i1 %tobool187, label %if.end190, label %if.then188

if.then188:                                       ; preds = %InitX.exit
  %157 = load double** @x, align 8, !tbaa !3
  %cmp27.i269 = icmp sgt i64 %153, 0
  %158 = load double** @x_dup, align 8, !tbaa !3
  %cmp27.i269_dup = icmp sgt i64 %154, 0
  %cmp27.i269_QED_CHECK_133 = icmp eq i1 %cmp27.i269, %cmp27.i269_dup
  call void @eddi_check_function(i1 %cmp27.i269_QED_CHECK_133)
  br i1 %cmp27.i269, label %for.body.lr.ph.split.us.i270, label %CheckSum.exit292

for.body.lr.ph.split.us.i270:                     ; preds = %if.then188
  %159 = load i64* @pad_length, align 8, !tbaa !0
  %add.us.i288 = add nsw i64 %159, %153
  %160 = load i64* @pad_length_dup, align 8, !tbaa !0
  %add.us.i288_dup = add nsw i64 %160, %154
  %add.us.i288_QED_CHECK_134 = icmp eq i64 %add.us.i288, %add.us.i288_dup
  call void @eddi_check_function(i1 %add.us.i288_QED_CHECK_134)
  br label %for.body3.lr.ph.us.i290

for.inc12.us.i273:                                ; preds = %for.body3.us.i285
  %inc13.us.i271 = add nsw i64 %j.028.us.i287, 1
  %exitcond31.i272 = icmp eq i64 %inc13.us.i271, %153
  %inc13.us.i271_dup = add nsw i64 %j.028.us.i287_dup, 1
  %exitcond31.i272_dup = icmp eq i64 %inc13.us.i271_dup, %154
  %inc13.us.i271_QED_CHECK_147 = icmp eq i64 %inc13.us.i271, %inc13.us.i271_dup
  %exitcond31.i272_QED_CHECK_148 = icmp eq i1 %exitcond31.i272, %exitcond31.i272_dup
  %for.inc12.us.i273_error = and i1 %inc13.us.i271_QED_CHECK_147, %exitcond31.i272_QED_CHECK_148
  call void @eddi_check_function(i1 %for.inc12.us.i273_error)
  br i1 %exitcond31.i272, label %CheckSum.exit292, label %for.body3.lr.ph.us.i290

for.body3.us.i285:                                ; preds = %for.body3.lr.ph.us.i290, %for.body3.us.i285
  %cks.126.us.i274 = phi double [ %cks.029.us.i286, %for.body3.lr.ph.us.i290 ], [ %add11.us.i282, %for.body3.us.i285 ]
  %i.025.us.i275 = phi i64 [ 0, %for.body3.lr.ph.us.i290 ], [ %inc.us.i283, %for.body3.us.i285 ]
  %cks.126.us.i274_dup = phi double [ %cks.029.us.i286_dup, %for.body3.lr.ph.us.i290 ], [ %add11.us.i282_dup, %for.body3.us.i285 ]
  %i.025.us.i275_dup = phi i64 [ 0, %for.body3.lr.ph.us.i290 ], [ %inc.us.i283_dup, %for.body3.us.i285 ]
  %add4.us.i276 = add nsw i64 %i.025.us.i275, %mul.us.i289
  %mul5.us.i277 = shl nsw i64 %add4.us.i276, 1
  %arrayidx.us.i278 = getelementptr inbounds double* %157, i64 %mul5.us.i277
  %161 = load double* %arrayidx.us.i278, align 8, !tbaa !4
  %add823.us.i279 = or i64 %mul5.us.i277, 1
  %arrayidx9.us.i280 = getelementptr inbounds double* %157, i64 %add823.us.i279
  %162 = load double* %arrayidx9.us.i280, align 8, !tbaa !4
  %add10.us.i281 = fadd double %161, %162
  %add11.us.i282 = fadd double %cks.126.us.i274, %add10.us.i281
  %inc.us.i283 = add nsw i64 %i.025.us.i275, 1
  %exitcond.i284 = icmp eq i64 %inc.us.i283, %153
  %add4.us.i276_dup = add nsw i64 %i.025.us.i275_dup, %mul.us.i289_dup
  %mul5.us.i277_dup = shl nsw i64 %add4.us.i276_dup, 1
  %arrayidx.us.i278_dup = getelementptr inbounds double* %158, i64 %mul5.us.i277_dup
  %163 = load double* %arrayidx.us.i278_dup, align 8, !tbaa !4
  %add823.us.i279_dup = or i64 %mul5.us.i277_dup, 1
  %arrayidx9.us.i280_dup = getelementptr inbounds double* %158, i64 %add823.us.i279_dup
  %164 = load double* %arrayidx9.us.i280_dup, align 8, !tbaa !4
  %add10.us.i281_dup = fadd double %163, %164
  %add11.us.i282_dup = fadd double %cks.126.us.i274_dup, %add10.us.i281_dup
  %inc.us.i283_dup = add nsw i64 %i.025.us.i275_dup, 1
  %exitcond.i284_dup = icmp eq i64 %inc.us.i283_dup, %154
  %cks.126.us.i274_QED_CHECK_138 = fcmp oeq double %cks.126.us.i274, %cks.126.us.i274_dup
  %i.025.us.i275_QED_CHECK_139 = icmp eq i64 %i.025.us.i275, %i.025.us.i275_dup
  %add4.us.i276_QED_CHECK_140 = icmp eq i64 %add4.us.i276, %add4.us.i276_dup
  %mul5.us.i277_QED_CHECK_141 = icmp eq i64 %mul5.us.i277, %mul5.us.i277_dup
  %add823.us.i279_QED_CHECK_142 = icmp eq i64 %add823.us.i279, %add823.us.i279_dup
  %add10.us.i281_QED_CHECK_143 = fcmp oeq double %add10.us.i281, %add10.us.i281_dup
  %add11.us.i282_QED_CHECK_144 = fcmp oeq double %add11.us.i282, %add11.us.i282_dup
  %inc.us.i283_QED_CHECK_145 = icmp eq i64 %inc.us.i283, %inc.us.i283_dup
  %exitcond.i284_QED_CHECK_146 = icmp eq i1 %exitcond.i284, %exitcond.i284_dup
  %165 = and i1 %cks.126.us.i274_QED_CHECK_138, %i.025.us.i275_QED_CHECK_139
  %166 = and i1 %add4.us.i276_QED_CHECK_140, %mul5.us.i277_QED_CHECK_141
  %167 = and i1 %165, %166
  %168 = and i1 %add823.us.i279_QED_CHECK_142, %add10.us.i281_QED_CHECK_143
  %169 = and i1 %inc.us.i283_QED_CHECK_145, %exitcond.i284_QED_CHECK_146
  %170 = and i1 %add11.us.i282_QED_CHECK_144, %169
  %171 = and i1 %168, %170
  %for.body3.us.i285_error = and i1 %167, %171
  call void @eddi_check_function(i1 %for.body3.us.i285_error)
  br i1 %exitcond.i284, label %for.inc12.us.i273, label %for.body3.us.i285

for.body3.lr.ph.us.i290:                          ; preds = %for.inc12.us.i273, %for.body.lr.ph.split.us.i270
  %cks.029.us.i286 = phi double [ 0.000000e+00, %for.body.lr.ph.split.us.i270 ], [ %add11.us.i282, %for.inc12.us.i273 ]
  %j.028.us.i287 = phi i64 [ 0, %for.body.lr.ph.split.us.i270 ], [ %inc13.us.i271, %for.inc12.us.i273 ]
  %cks.029.us.i286_dup = phi double [ 0.000000e+00, %for.body.lr.ph.split.us.i270 ], [ %add11.us.i282_dup, %for.inc12.us.i273 ]
  %j.028.us.i287_dup = phi i64 [ 0, %for.body.lr.ph.split.us.i270 ], [ %inc13.us.i271_dup, %for.inc12.us.i273 ]
  %mul.us.i289 = mul nsw i64 %j.028.us.i287, %add.us.i288
  %mul.us.i289_dup = mul nsw i64 %j.028.us.i287_dup, %add.us.i288_dup
  %cks.029.us.i286_QED_CHECK_135 = fcmp oeq double %cks.029.us.i286, %cks.029.us.i286_dup
  %j.028.us.i287_QED_CHECK_136 = icmp eq i64 %j.028.us.i287, %j.028.us.i287_dup
  %mul.us.i289_QED_CHECK_137 = icmp eq i64 %mul.us.i289, %mul.us.i289_dup
  %172 = and i1 %j.028.us.i287_QED_CHECK_136, %mul.us.i289_QED_CHECK_137
  %for.body3.lr.ph.us.i290_error = and i1 %cks.029.us.i286_QED_CHECK_135, %172
  call void @eddi_check_function(i1 %for.body3.lr.ph.us.i290_error)
  br label %for.body3.us.i285

CheckSum.exit292:                                 ; preds = %for.inc12.us.i273, %if.then188
  %cks.0.lcssa.i291 = phi double [ 0.000000e+00, %if.then188 ], [ %add11.us.i282, %for.inc12.us.i273 ]
  %cks.0.lcssa.i291_dup = phi double [ 0.000000e+00, %if.then188 ], [ %add11.us.i282_dup, %for.inc12.us.i273 ]
  store double %cks.0.lcssa.i291, double* @ck1, align 8, !tbaa !4
  store double %cks.0.lcssa.i291_dup, double* @ck1_dup, align 8, !tbaa !4
  %cks.0.lcssa.i291_QED_CHECK_149 = fcmp oeq double %cks.0.lcssa.i291, %cks.0.lcssa.i291_dup
  call void @eddi_check_function(i1 %cks.0.lcssa.i291_QED_CHECK_149)
  br label %if.end190

if.end190:                                        ; preds = %CheckSum.exit292, %InitX.exit
  %173 = load i64* @doprint, align 8, !tbaa !0
  %tobool191 = icmp eq i64 %173, 0
  %174 = load i64* @doprint_dup, align 8, !tbaa !0
  %tobool191_dup = icmp eq i64 %174, 0
  %tobool191_QED_CHECK_66 = icmp eq i1 %tobool191, %tobool191_dup
  call void @eddi_check_function(i1 %tobool191_QED_CHECK_66)
  br i1 %tobool191, label %if.end194, label %if.then192

if.then192:                                       ; preds = %if.end190
  %puts239 = tail call i32 @puts(i8* getelementptr inbounds ([22 x i8]* @str59, i64 0, i64 0))
  %175 = load i64* @N, align 8, !tbaa !0
  %176 = load double** @x, align 8, !tbaa !3
  %puts239_dup = tail call i32 @puts(i8* getelementptr inbounds ([22 x i8]* @str59_dup, i64 0, i64 0))
  %177 = load i64* @N_dup, align 8, !tbaa !0
  %178 = load double** @x_dup, align 8, !tbaa !3
  call void @PrintArray(i64 %175, i64 %177, double* %176, double* %178)
  br label %if.end194

if.end194:                                        ; preds = %if.then192, %if.end190
  %179 = load i64* @N, align 8, !tbaa !0
  %180 = load double** @umain, align 8, !tbaa !3
  %cmp49.i = icmp sgt i64 %179, 1
  %181 = load i64* @rootN, align 8, !tbaa !0
  %182 = load i64* @N_dup, align 8, !tbaa !0
  %183 = load double** @umain_dup, align 8, !tbaa !3
  %cmp49.i_dup = icmp sgt i64 %182, 1
  %184 = load i64* @rootN_dup, align 8, !tbaa !0
  %cmp49.icmp49.i = icmp eq i1 %cmp49.i, %cmp49.i_dup
  call void @eddi_check_function(i1 %cmp49.icmp49.i)
  br i1 %cmp49.i, label %for.body.lr.ph.i, label %InitU.exit

for.body.lr.ph.i:                                 ; preds = %if.end194
  %sub9.i = add nsw i64 %181, -1
  %sub9.i_dup = add nsw i64 %184, -1
  %sub9.i_QED_CHECK_68 = icmp eq i64 %sub9.i, %sub9.i_dup
  call void @eddi_check_function(i1 %sub9.i_QED_CHECK_68)
  br label %for.body.i293

for.body.i293:                                    ; preds = %for.inc28.i, %for.body.lr.ph.i
  %conv51.i = phi i64 [ 1, %for.body.lr.ph.i ], [ %conv.i, %for.inc28.i ]
  %q.050.i = phi i64 [ 0, %for.body.lr.ph.i ], [ %inc29.i, %for.inc28.i ]
  %conv51.i_dup = phi i64 [ 1, %for.body.lr.ph.i ], [ %conv.i_dup, %for.inc28.i ]
  %q.050.i_dup = phi i64 [ 0, %for.body.lr.ph.i ], [ %inc29.i_dup, %for.inc28.i ]
  %sub.i = add nsw i64 %conv51.i, -1
  %cmp646.i = icmp sgt i64 %conv51.i, 0
  %sub.i_dup = add nsw i64 %conv51.i_dup, -1
  %cmp646.i_dup = icmp sgt i64 %conv51.i_dup, 0
  %conv51.i_QED_CHECK_69 = icmp eq i64 %conv51.i, %conv51.i_dup
  %q.050.i_QED_CHECK_70 = icmp eq i64 %q.050.i, %q.050.i_dup
  %sub.i_QED_CHECK_71 = icmp eq i64 %sub.i, %sub.i_dup
  %cmp646.i_QED_CHECK_72 = icmp eq i1 %cmp646.i, %cmp646.i_dup
  %185 = and i1 %conv51.i_QED_CHECK_69, %q.050.i_QED_CHECK_70
  %186 = and i1 %sub.i_QED_CHECK_71, %cmp646.i_QED_CHECK_72
  %for.body.i293_error = and i1 %185, %186
  call void @eddi_check_function(i1 %for.body.i293_error)
  br i1 %cmp646.i, label %for.body8.lr.ph.i, label %for.inc28.i

for.body8.lr.ph.i:                                ; preds = %for.body.i293
  %mul13.i = shl nsw i64 %conv51.i, 1
  %conv14.i = sitofp i64 %mul13.i to double
  %mul13.i_dup = shl nsw i64 %conv51.i_dup, 1
  %conv14.i_dup = sitofp i64 %mul13.i_dup to double
  %mul13.i_QED_CHECK_73 = icmp eq i64 %mul13.i, %mul13.i_dup
  %conv14.i_QED_CHECK_74 = fcmp oeq double %conv14.i, %conv14.i_dup
  %for.body8.lr.ph.i_error = and i1 %mul13.i_QED_CHECK_73, %conv14.i_QED_CHECK_74
  call void @eddi_check_function(i1 %for.body8.lr.ph.i_error)
  br label %for.body8.i

for.body8.i:                                      ; preds = %if.end.i, %for.body8.lr.ph.i
  %j.047.i = phi i64 [ 0, %for.body8.lr.ph.i ], [ %inc.i298, %if.end.i ]
  %j.047.i_dup = phi i64 [ 0, %for.body8.lr.ph.i ], [ %inc.i298_dup, %if.end.i ]
  %add.i294 = add nsw i64 %sub.i, %j.047.i
  %cmp10.i = icmp sgt i64 %add.i294, %sub9.i
  %add.i294_dup = add nsw i64 %sub.i_dup, %j.047.i_dup
  %cmp10.i_dup = icmp sgt i64 %add.i294_dup, %sub9.i_dup
  %j.047.i_QED_CHECK_75 = icmp eq i64 %j.047.i, %j.047.i_dup
  %add.i294_QED_CHECK_76 = icmp eq i64 %add.i294, %add.i294_dup
  %cmp10.i_QED_CHECK_77 = icmp eq i1 %cmp10.i, %cmp10.i_dup
  %187 = and i1 %add.i294_QED_CHECK_76, %cmp10.i_QED_CHECK_77
  %for.body8.i_error = and i1 %j.047.i_QED_CHECK_75, %187
  call void @eddi_check_function(i1 %for.body8.i_error)
  br i1 %cmp10.i, label %InitU.exit, label %if.end.i

if.end.i:                                         ; preds = %for.body8.i
  %conv12.i = sitofp i64 %j.047.i to double
  %mul.i295 = fmul double %conv12.i, 6.283200e+00
  %div.i = fdiv double %mul.i295, %conv14.i
  %call.i296 = tail call double @cos(double %div.i) #8
  %mul16.i = shl nsw i64 %add.i294, 1
  %arrayidx.i297 = getelementptr inbounds double* %180, i64 %mul16.i
  store double %call.i296, double* %arrayidx.i297, align 8, !tbaa !4
  %call22.i = tail call double @sin(double %div.i) #8
  %sub23.i = fsub double -0.000000e+00, %call22.i
  %add2645.i = or i64 %mul16.i, 1
  %arrayidx27.i = getelementptr inbounds double* %180, i64 %add2645.i
  store double %sub23.i, double* %arrayidx27.i, align 8, !tbaa !4
  %inc.i298 = add nsw i64 %j.047.i, 1
  %cmp6.i = icmp slt i64 %inc.i298, %conv51.i
  %conv12.i_dup = sitofp i64 %j.047.i_dup to double
  %mul.i295_dup = fmul double %conv12.i_dup, 6.283200e+00
  %div.i_dup = fdiv double %mul.i295_dup, %conv14.i_dup
  %call.i296_dup = tail call double @cos(double %div.i_dup) #8
  %mul16.i_dup = shl nsw i64 %add.i294_dup, 1
  %arrayidx.i297_dup = getelementptr inbounds double* %183, i64 %mul16.i_dup
  store double %call.i296_dup, double* %arrayidx.i297_dup, align 8, !tbaa !4
  %call22.i_dup = tail call double @sin(double %div.i_dup) #8
  %sub23.i_dup = fsub double -0.000000e+00, %call22.i_dup
  %add2645.i_dup = or i64 %mul16.i_dup, 1
  %arrayidx27.i_dup = getelementptr inbounds double* %183, i64 %add2645.i_dup
  store double %sub23.i_dup, double* %arrayidx27.i_dup, align 8, !tbaa !4
  %inc.i298_dup = add nsw i64 %j.047.i_dup, 1
  %cmp6.i_dup = icmp slt i64 %inc.i298_dup, %conv51.i_dup
  %conv12.i_QED_CHECK_78 = fcmp oeq double %conv12.i, %conv12.i_dup
  %"mul.i295\00\00\00\00\00\00\00\90)\00_79" = fcmp oeq double %mul.i295, %mul.i295_dup
  %div.i_QED_CHECK_80 = fcmp oeq double %div.i, %div.i_dup
  %mul16.i_QED_CHECK_81 = icmp eq i64 %mul16.i, %mul16.i_dup
  %sub23.i_QED_CHECK_82 = fcmp oeq double %sub23.i, %sub23.i_dup
  %"add2645.i\00\00\00\00\00\00\00\90*\00_83" = icmp eq i64 %add2645.i, %add2645.i_dup
  %inc.i298_QED_CHECK_84 = icmp eq i64 %inc.i298, %inc.i298_dup
  %cmp6.i_QED_CHECK_85 = icmp eq i1 %cmp6.i, %cmp6.i_dup
  %188 = and i1 %conv12.i_QED_CHECK_78, %"mul.i295\00\00\00\00\00\00\00\90)\00_79"
  %189 = and i1 %div.i_QED_CHECK_80, %mul16.i_QED_CHECK_81
  %190 = and i1 %188, %189
  %191 = and i1 %sub23.i_QED_CHECK_82, %"add2645.i\00\00\00\00\00\00\00\90*\00_83"
  %192 = and i1 %inc.i298_QED_CHECK_84, %cmp6.i_QED_CHECK_85
  %193 = and i1 %191, %192
  %if.end.i_error = and i1 %190, %193
  call void @eddi_check_function(i1 %if.end.i_error)
  br i1 %cmp6.i, label %for.body8.i, label %for.inc28.i

for.inc28.i:                                      ; preds = %if.end.i, %for.body.i293
  %inc29.i = add nsw i64 %q.050.i, 1
  %sh_prom.i = trunc i64 %inc29.i to i32
  %shl.i = shl i32 1, %sh_prom.i
  %conv.i = sext i32 %shl.i to i64
  %cmp.i299 = icmp slt i64 %conv.i, %179
  %inc29.i_dup = add nsw i64 %q.050.i_dup, 1
  %sh_prom.i_dup = trunc i64 %inc29.i_dup to i32
  %shl.i_dup = shl i32 1, %sh_prom.i_dup
  %conv.i_dup = sext i32 %shl.i_dup to i64
  %cmp.i299_dup = icmp slt i64 %conv.i_dup, %182
  %inc29.i_QED_CHECK_86 = icmp eq i64 %inc29.i, %inc29.i_dup
  %sh_prom.i_QED_CHECK_87 = icmp eq i32 %sh_prom.i, %sh_prom.i_dup
  %shl.i_QED_CHECK_88 = icmp eq i32 %shl.i, %shl.i_dup
  %conv.i_QED_CHECK_89 = icmp eq i64 %conv.i, %conv.i_dup
  %"cmp.i299\00\00\00\00\00\00\00\904\00_90" = icmp eq i1 %cmp.i299, %cmp.i299_dup
  %194 = and i1 %inc29.i_QED_CHECK_86, %sh_prom.i_QED_CHECK_87
  %195 = and i1 %conv.i_QED_CHECK_89, %"cmp.i299\00\00\00\00\00\00\00\904\00_90"
  %196 = and i1 %shl.i_QED_CHECK_88, %195
  %for.inc28.i_error = and i1 %194, %196
  call void @eddi_check_function(i1 %for.inc28.i_error)
  br i1 %cmp.i299, label %for.body.i293, label %InitU.exit

InitU.exit:                                       ; preds = %for.inc28.i, %for.body8.i, %if.end194
  %197 = load double** @umain2, align 8, !tbaa !3
  %cmp40.i = icmp sgt i64 %181, 0
  %198 = load double** @umain2_dup, align 8, !tbaa !3
  %cmp40.i_dup = icmp sgt i64 %184, 0
  %cmp40.i_QED_CHECK_91 = icmp eq i1 %cmp40.i, %cmp40.i_dup
  call void @eddi_check_function(i1 %cmp40.i_QED_CHECK_91)
  br i1 %cmp40.i, label %for.body.lr.ph.split.us.i301, label %InitU2.exit

for.body.lr.ph.split.us.i301:                     ; preds = %InitU.exit
  %199 = load i64* @pad_length, align 8, !tbaa !0
  %add.i300 = add nsw i64 %199, %181
  %conv7.i = sitofp i64 %179 to double
  %200 = load i64* @pad_length_dup, align 8, !tbaa !0
  %add.i300_dup = add nsw i64 %200, %184
  %conv7.i_dup = sitofp i64 %182 to double
  %add.i300_QED_CHECK_92 = icmp eq i64 %add.i300, %add.i300_dup
  %conv7.i_QED_CHECK_93 = fcmp oeq double %conv7.i, %conv7.i_dup
  %for.body.lr.ph.split.us.i301_error = and i1 %add.i300_QED_CHECK_92, %conv7.i_QED_CHECK_93
  call void @eddi_check_function(i1 %for.body.lr.ph.split.us.i301_error)
  br label %for.body3.lr.ph.us.i307

for.inc21.us.i:                                   ; preds = %for.body3.us.i305
  %inc22.us.i = add nsw i64 %j.041.us.i, 1
  %exitcond42.i = icmp eq i64 %inc22.us.i, %181
  %inc22.us.i_dup = add nsw i64 %j.041.us.i_dup, 1
  %exitcond42.i_dup = icmp eq i64 %inc22.us.i_dup, %184
  %inc22.us.i_QED_CHECK_108 = icmp eq i64 %inc22.us.i, %inc22.us.i_dup
  %exitcond42.i_QED_CHECK_109 = icmp eq i1 %exitcond42.i, %exitcond42.i_dup
  %for.inc21.us.i_error = and i1 %inc22.us.i_QED_CHECK_108, %exitcond42.i_QED_CHECK_109
  call void @eddi_check_function(i1 %for.inc21.us.i_error)
  br i1 %exitcond42.i, label %InitU2.exit, label %for.body3.lr.ph.us.i307

for.body3.us.i305:                                ; preds = %for.body3.lr.ph.us.i307, %for.body3.us.i305
  %i.039.us.i = phi i64 [ 0, %for.body3.lr.ph.us.i307 ], [ %inc.us.i303, %for.body3.us.i305 ]
  %i.039.us.i_dup = phi i64 [ 0, %for.body3.lr.ph.us.i307 ], [ %inc.us.i303_dup, %for.body3.us.i305 ]
  %conv.us.i = sitofp i64 %i.039.us.i to double
  %mul4.us.i = fmul double %conv.us.i, 6.283200e+00
  %mul6.us.i = fmul double %conv5.us.i, %mul4.us.i
  %div.us.i = fdiv double %mul6.us.i, %conv7.i
  %call.us.i = tail call double @cos(double %div.us.i) #8
  %add8.us.i = add nsw i64 %i.039.us.i, %mul.us.i306
  %mul9.us.i = shl nsw i64 %add8.us.i, 1
  %arrayidx.us.i302 = getelementptr inbounds double* %197, i64 %mul9.us.i
  store double %call.us.i, double* %arrayidx.us.i302, align 8, !tbaa !4
  %call16.us.i = tail call double @sin(double %div.us.i) #8
  %sub.us.i = fsub double -0.000000e+00, %call16.us.i
  %add1937.us.i = or i64 %mul9.us.i, 1
  %arrayidx20.us.i = getelementptr inbounds double* %197, i64 %add1937.us.i
  store double %sub.us.i, double* %arrayidx20.us.i, align 8, !tbaa !4
  %inc.us.i303 = add nsw i64 %i.039.us.i, 1
  %exitcond.i304 = icmp eq i64 %inc.us.i303, %181
  %conv.us.i_dup = sitofp i64 %i.039.us.i_dup to double
  %mul4.us.i_dup = fmul double %conv.us.i_dup, 6.283200e+00
  %mul6.us.i_dup = fmul double %conv5.us.i_dup, %mul4.us.i_dup
  %div.us.i_dup = fdiv double %mul6.us.i_dup, %conv7.i_dup
  %call.us.i_dup = tail call double @cos(double %div.us.i_dup) #8
  %add8.us.i_dup = add nsw i64 %i.039.us.i_dup, %mul.us.i306_dup
  %mul9.us.i_dup = shl nsw i64 %add8.us.i_dup, 1
  %arrayidx.us.i302_dup = getelementptr inbounds double* %198, i64 %mul9.us.i_dup
  store double %call.us.i_dup, double* %arrayidx.us.i302_dup, align 8, !tbaa !4
  %call16.us.i_dup = tail call double @sin(double %div.us.i_dup) #8
  %sub.us.i_dup = fsub double -0.000000e+00, %call16.us.i_dup
  %add1937.us.i_dup = or i64 %mul9.us.i_dup, 1
  %arrayidx20.us.i_dup = getelementptr inbounds double* %198, i64 %add1937.us.i_dup
  store double %sub.us.i_dup, double* %arrayidx20.us.i_dup, align 8, !tbaa !4
  %inc.us.i303_dup = add nsw i64 %i.039.us.i_dup, 1
  %exitcond.i304_dup = icmp eq i64 %inc.us.i303_dup, %184
  %i.039.us.i_QED_CHECK_97 = icmp eq i64 %i.039.us.i, %i.039.us.i_dup
  %conv.us.i_QED_CHECK_98 = fcmp oeq double %conv.us.i, %conv.us.i_dup
  %mul4.us.i_QED_CHECK_99 = fcmp oeq double %mul4.us.i, %mul4.us.i_dup
  %mul6.us.i_QED_CHECK_100 = fcmp oeq double %mul6.us.i, %mul6.us.i_dup
  %"div.us.i\00\00\00\00\00\00\00\90>\00_101" = fcmp oeq double %div.us.i, %div.us.i_dup
  %add8.us.i_QED_CHECK_102 = icmp eq i64 %add8.us.i, %add8.us.i_dup
  %mul9.us.i_QED_CHECK_103 = icmp eq i64 %mul9.us.i, %mul9.us.i_dup
  %sub.us.i_QED_CHECK_104 = fcmp oeq double %sub.us.i, %sub.us.i_dup
  %add1937.us.i_QED_CHECK_105 = icmp eq i64 %add1937.us.i, %add1937.us.i_dup
  %inc.us.i303_QED_CHECK_106 = icmp eq i64 %inc.us.i303, %inc.us.i303_dup
  %exitcond.i304_QED_CHECK_107 = icmp eq i1 %exitcond.i304, %exitcond.i304_dup
  %201 = and i1 %i.039.us.i_QED_CHECK_97, %conv.us.i_QED_CHECK_98
  %202 = and i1 %mul6.us.i_QED_CHECK_100, %"div.us.i\00\00\00\00\00\00\00\90>\00_101"
  %203 = and i1 %mul4.us.i_QED_CHECK_99, %202
  %204 = and i1 %201, %203
  %205 = and i1 %mul9.us.i_QED_CHECK_103, %sub.us.i_QED_CHECK_104
  %206 = and i1 %add8.us.i_QED_CHECK_102, %205
  %207 = and i1 %inc.us.i303_QED_CHECK_106, %exitcond.i304_QED_CHECK_107
  %208 = and i1 %add1937.us.i_QED_CHECK_105, %207
  %209 = and i1 %206, %208
  %for.body3.us.i305_error = and i1 %204, %209
  call void @eddi_check_function(i1 %for.body3.us.i305_error)
  br i1 %exitcond.i304, label %for.inc21.us.i, label %for.body3.us.i305

for.body3.lr.ph.us.i307:                          ; preds = %for.inc21.us.i, %for.body.lr.ph.split.us.i301
  %j.041.us.i = phi i64 [ 0, %for.body.lr.ph.split.us.i301 ], [ %inc22.us.i, %for.inc21.us.i ]
  %j.041.us.i_dup = phi i64 [ 0, %for.body.lr.ph.split.us.i301 ], [ %inc22.us.i_dup, %for.inc21.us.i ]
  %mul.us.i306 = mul nsw i64 %j.041.us.i, %add.i300
  %conv5.us.i = sitofp i64 %j.041.us.i to double
  %mul.us.i306_dup = mul nsw i64 %j.041.us.i_dup, %add.i300_dup
  %conv5.us.i_dup = sitofp i64 %j.041.us.i_dup to double
  %"j.041.us.i\82t<\0A\FB\07\00\A0\02\00_94" = icmp eq i64 %j.041.us.i, %j.041.us.i_dup
  %"mul.us.i306\00\00\00\00\00\00\00\90,\00_95" = icmp eq i64 %mul.us.i306, %mul.us.i306_dup
  %conv5.us.i_QED_CHECK_96 = fcmp oeq double %conv5.us.i, %conv5.us.i_dup
  %210 = and i1 %"mul.us.i306\00\00\00\00\00\00\00\90,\00_95", %conv5.us.i_QED_CHECK_96
  %for.body3.lr.ph.us.i307_error = and i1 %"j.041.us.i\82t<\0A\FB\07\00\A0\02\00_94", %210
  call void @eddi_check_function(i1 %for.body3.lr.ph.us.i307_error)
  br label %for.body3.us.i305

InitU2.exit:                                      ; preds = %for.inc21.us.i, %InitU.exit
  call void @SlaveStart()
  %211 = load i64* @doprint, align 8, !tbaa !0
  %tobool195 = icmp eq i64 %211, 0
  %212 = load i64* @doprint_dup, align 8, !tbaa !0
  %tobool195_dup = icmp eq i64 %212, 0
  %tobool195_QED_CHECK_110 = icmp eq i1 %tobool195, %tobool195_dup
  call void @eddi_check_function(i1 %tobool195_QED_CHECK_110)
  br i1 %tobool195, label %if.end203, label %if.then196

if.then196:                                       ; preds = %InitU2.exit
  %213 = load i64* @test_result, align 8, !tbaa !0
  %tobool197 = icmp eq i64 %213, 0
  %214 = load i64* @test_result_dup, align 8, !tbaa !0
  %tobool197_dup = icmp eq i64 %214, 0
  %tobool197_QED_CHECK_132 = icmp eq i1 %tobool197, %tobool197_dup
  call void @eddi_check_function(i1 %tobool197_QED_CHECK_132)
  br i1 %tobool197, label %if.else200, label %if.then198

if.then198:                                       ; preds = %if.then196
  %puts238 = tail call i32 @puts(i8* getelementptr inbounds ([31 x i8]* @str58, i64 0, i64 0))
  %puts238_dup = tail call i32 @puts(i8* getelementptr inbounds ([31 x i8]* @str58_dup, i64 0, i64 0))
  br label %if.end202

if.else200:                                       ; preds = %if.then196
  %puts237 = tail call i32 @puts(i8* getelementptr inbounds ([23 x i8]* @str57, i64 0, i64 0))
  %puts237_dup = tail call i32 @puts(i8* getelementptr inbounds ([23 x i8]* @str57_dup, i64 0, i64 0))
  br label %if.end202

if.end202:                                        ; preds = %if.else200, %if.then198
  %215 = load i64* @N, align 8, !tbaa !0
  %216 = load double** @x, align 8, !tbaa !3
  %217 = load i64* @N_dup, align 8, !tbaa !0
  %218 = load double** @x_dup, align 8, !tbaa !3
  call void @PrintArray(i64 %215, i64 %217, double* %216, double* %218)
  br label %if.end203

if.end203:                                        ; preds = %if.end202, %InitU2.exit
  %putchar230 = tail call i32 @putchar(i32 10) #6
  %puts231 = tail call i32 @puts(i8* getelementptr inbounds ([36 x i8]* @str51, i64 0, i64 0))
  %puts232 = tail call i32 @puts(i8* getelementptr inbounds ([53 x i8]* @str52, i64 0, i64 0))
  %puts233 = tail call i32 @puts(i8* getelementptr inbounds ([52 x i8]* @str53, i64 0, i64 0))
  %219 = load i64* @test_result, align 8, !tbaa !0
  %tobool208 = icmp eq i64 %219, 0
  %putchar230_dup = tail call i32 @putchar(i32 10) #6
  %puts231_dup = tail call i32 @puts(i8* getelementptr inbounds ([36 x i8]* @str51_dup, i64 0, i64 0))
  %puts232_dup = tail call i32 @puts(i8* getelementptr inbounds ([53 x i8]* @str52_dup, i64 0, i64 0))
  %puts233_dup = tail call i32 @puts(i8* getelementptr inbounds ([52 x i8]* @str53_dup, i64 0, i64 0))
  %220 = load i64* @test_result_dup, align 8, !tbaa !0
  %tobool208_dup = icmp eq i64 %220, 0
  %tobool208_QED_CHECK_111 = icmp eq i1 %tobool208, %tobool208_dup
  call void @eddi_check_function(i1 %tobool208_QED_CHECK_111)
  br i1 %tobool208, label %if.end223, label %if.then209

if.then209:                                       ; preds = %if.end203
  %221 = load double** @x, align 8, !tbaa !3
  %222 = load i64* @rootN, align 8, !tbaa !0
  %cmp27.i = icmp sgt i64 %222, 0
  %223 = load double** @x_dup, align 8, !tbaa !3
  %224 = load i64* @rootN_dup, align 8, !tbaa !0
  %cmp27.i_dup = icmp sgt i64 %224, 0
  %cmp27.i_QED_CHECK_112 = icmp eq i1 %cmp27.i, %cmp27.i_dup
  call void @eddi_check_function(i1 %cmp27.i_QED_CHECK_112)
  br i1 %cmp27.i, label %for.body.lr.ph.split.us.i, label %CheckSum.exit

for.body.lr.ph.split.us.i:                        ; preds = %if.then209
  %225 = load i64* @pad_length, align 8, !tbaa !0
  %add.us.i = add nsw i64 %225, %222
  %226 = load i64* @pad_length_dup, align 8, !tbaa !0
  %add.us.i_dup = add nsw i64 %226, %224
  %add.us.i_QED_CHECK_113 = icmp eq i64 %add.us.i, %add.us.i_dup
  call void @eddi_check_function(i1 %add.us.i_QED_CHECK_113)
  br label %for.body3.lr.ph.us.i

for.inc12.us.i:                                   ; preds = %for.body3.us.i
  %inc13.us.i = add nsw i64 %j.028.us.i, 1
  %exitcond31.i = icmp eq i64 %inc13.us.i, %222
  %inc13.us.i_dup = add nsw i64 %j.028.us.i_dup, 1
  %exitcond31.i_dup = icmp eq i64 %inc13.us.i_dup, %224
  %inc13.us.i_QED_CHECK_126 = icmp eq i64 %inc13.us.i, %inc13.us.i_dup
  %"exitcond31.i\8Ey<\0A\FB\07\00\A0\02\00_127" = icmp eq i1 %exitcond31.i, %exitcond31.i_dup
  %for.inc12.us.i_error = and i1 %inc13.us.i_QED_CHECK_126, %"exitcond31.i\8Ey<\0A\FB\07\00\A0\02\00_127"
  call void @eddi_check_function(i1 %for.inc12.us.i_error)
  br i1 %exitcond31.i, label %CheckSum.exit, label %for.body3.lr.ph.us.i

for.body3.us.i:                                   ; preds = %for.body3.lr.ph.us.i, %for.body3.us.i
  %cks.126.us.i = phi double [ %cks.029.us.i, %for.body3.lr.ph.us.i ], [ %add11.us.i, %for.body3.us.i ]
  %i.025.us.i = phi i64 [ 0, %for.body3.lr.ph.us.i ], [ %inc.us.i, %for.body3.us.i ]
  %cks.126.us.i_dup = phi double [ %cks.029.us.i_dup, %for.body3.lr.ph.us.i ], [ %add11.us.i_dup, %for.body3.us.i ]
  %i.025.us.i_dup = phi i64 [ 0, %for.body3.lr.ph.us.i ], [ %inc.us.i_dup, %for.body3.us.i ]
  %add4.us.i = add nsw i64 %i.025.us.i, %mul.us.i
  %mul5.us.i = shl nsw i64 %add4.us.i, 1
  %arrayidx.us.i = getelementptr inbounds double* %221, i64 %mul5.us.i
  %227 = load double* %arrayidx.us.i, align 8, !tbaa !4
  %add823.us.i = or i64 %mul5.us.i, 1
  %arrayidx9.us.i = getelementptr inbounds double* %221, i64 %add823.us.i
  %228 = load double* %arrayidx9.us.i, align 8, !tbaa !4
  %add10.us.i = fadd double %227, %228
  %add11.us.i = fadd double %cks.126.us.i, %add10.us.i
  %inc.us.i = add nsw i64 %i.025.us.i, 1
  %exitcond.i = icmp eq i64 %inc.us.i, %222
  %add4.us.i_dup = add nsw i64 %i.025.us.i_dup, %mul.us.i_dup
  %mul5.us.i_dup = shl nsw i64 %add4.us.i_dup, 1
  %arrayidx.us.i_dup = getelementptr inbounds double* %223, i64 %mul5.us.i_dup
  %229 = load double* %arrayidx.us.i_dup, align 8, !tbaa !4
  %add823.us.i_dup = or i64 %mul5.us.i_dup, 1
  %arrayidx9.us.i_dup = getelementptr inbounds double* %223, i64 %add823.us.i_dup
  %230 = load double* %arrayidx9.us.i_dup, align 8, !tbaa !4
  %add10.us.i_dup = fadd double %229, %230
  %add11.us.i_dup = fadd double %cks.126.us.i_dup, %add10.us.i_dup
  %inc.us.i_dup = add nsw i64 %i.025.us.i_dup, 1
  %exitcond.i_dup = icmp eq i64 %inc.us.i_dup, %224
  %cks.126.us.i_QED_CHECK_117 = fcmp oeq double %cks.126.us.i, %cks.126.us.i_dup
  %i.025.us.i_QED_CHECK_118 = icmp eq i64 %i.025.us.i, %i.025.us.i_dup
  %add4.us.i_QED_CHECK_119 = icmp eq i64 %add4.us.i, %add4.us.i_dup
  %mul5.us.i_QED_CHECK_120 = icmp eq i64 %mul5.us.i, %mul5.us.i_dup
  %add823.us.i_QED_CHECK_121 = icmp eq i64 %add823.us.i, %add823.us.i_dup
  %add10.us.i_QED_CHECK_122 = fcmp oeq double %add10.us.i, %add10.us.i_dup
  %add11.us.i_QED_CHECK_123 = fcmp oeq double %add11.us.i, %add11.us.i_dup
  %inc.us.i_QED_CHECK_124 = icmp eq i64 %inc.us.i, %inc.us.i_dup
  %exitcond.i_QED_CHECK_125 = icmp eq i1 %exitcond.i, %exitcond.i_dup
  %231 = and i1 %cks.126.us.i_QED_CHECK_117, %i.025.us.i_QED_CHECK_118
  %232 = and i1 %add4.us.i_QED_CHECK_119, %mul5.us.i_QED_CHECK_120
  %233 = and i1 %231, %232
  %234 = and i1 %add823.us.i_QED_CHECK_121, %add10.us.i_QED_CHECK_122
  %235 = and i1 %inc.us.i_QED_CHECK_124, %exitcond.i_QED_CHECK_125
  %236 = and i1 %add11.us.i_QED_CHECK_123, %235
  %237 = and i1 %234, %236
  %for.body3.us.i_error = and i1 %233, %237
  call void @eddi_check_function(i1 %for.body3.us.i_error)
  br i1 %exitcond.i, label %for.inc12.us.i, label %for.body3.us.i

for.body3.lr.ph.us.i:                             ; preds = %for.inc12.us.i, %for.body.lr.ph.split.us.i
  %cks.029.us.i = phi double [ 0.000000e+00, %for.body.lr.ph.split.us.i ], [ %add11.us.i, %for.inc12.us.i ]
  %j.028.us.i = phi i64 [ 0, %for.body.lr.ph.split.us.i ], [ %inc13.us.i, %for.inc12.us.i ]
  %cks.029.us.i_dup = phi double [ 0.000000e+00, %for.body.lr.ph.split.us.i ], [ %add11.us.i_dup, %for.inc12.us.i ]
  %j.028.us.i_dup = phi i64 [ 0, %for.body.lr.ph.split.us.i ], [ %inc13.us.i_dup, %for.inc12.us.i ]
  %mul.us.i = mul nsw i64 %j.028.us.i, %add.us.i
  %mul.us.i_dup = mul nsw i64 %j.028.us.i_dup, %add.us.i_dup
  %cks.029.us.i_QED_CHECK_114 = fcmp oeq double %cks.029.us.i, %cks.029.us.i_dup
  %j.028.us.i_QED_CHECK_115 = icmp eq i64 %j.028.us.i, %j.028.us.i_dup
  %mul.us.i_QED_CHECK_116 = icmp eq i64 %mul.us.i, %mul.us.i_dup
  %238 = and i1 %j.028.us.i_QED_CHECK_115, %mul.us.i_QED_CHECK_116
  %for.body3.lr.ph.us.i_error = and i1 %cks.029.us.i_QED_CHECK_114, %238
  call void @eddi_check_function(i1 %for.body3.lr.ph.us.i_error)
  br label %for.body3.us.i

CheckSum.exit:                                    ; preds = %for.inc12.us.i, %if.then209
  %cks.0.lcssa.i = phi double [ 0.000000e+00, %if.then209 ], [ %add11.us.i, %for.inc12.us.i ]
  %cks.0.lcssa.i_dup = phi double [ 0.000000e+00, %if.then209 ], [ %add11.us.i_dup, %for.inc12.us.i ]
  store double %cks.0.lcssa.i, double* @ck3, align 8, !tbaa !4
  %puts234 = tail call i32 @puts(i8* getelementptr inbounds ([39 x i8]* @str54, i64 0, i64 0))
  %239 = load double* @ck1, align 8, !tbaa !4
  %240 = load double* @ck3, align 8, !tbaa !4
  %sub212 = fsub double %239, %240
  %call213 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([42 x i8]* @.str43, i64 0, i64 0), double %sub212, double %239, double %240) #6
  %241 = load double* @ck1, align 8, !tbaa !4
  %242 = load double* @ck3, align 8, !tbaa !4
  %sub214 = fsub double %241, %242
  %call215 = tail call double @fabs(double %sub214) #8
  %cmp216 = fcmp olt double %call215, 1.000000e-03
  store double %cks.0.lcssa.i_dup, double* @ck3_dup, align 8, !tbaa !4
  %puts234_dup = tail call i32 @puts(i8* getelementptr inbounds ([39 x i8]* @str54_dup, i64 0, i64 0))
  %243 = load double* @ck1_dup, align 8, !tbaa !4
  %244 = load double* @ck3_dup, align 8, !tbaa !4
  %sub212_dup = fsub double %243, %244
  %call213_dup = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([42 x i8]* @.str43_dup, i64 0, i64 0), double %sub212_dup, double %243, double %244) #6
  %245 = load double* @ck1_dup, align 8, !tbaa !4
  %246 = load double* @ck3_dup, align 8, !tbaa !4
  %sub214_dup = fsub double %245, %246
  %call215_dup = tail call double @fabs(double %sub214_dup) #8
  %cmp216_dup = fcmp olt double %call215_dup, 1.000000e-03
  %cks.0.lcssa.i_QED_CHECK_128 = fcmp oeq double %cks.0.lcssa.i, %cks.0.lcssa.i_dup
  %sub212_QED_CHECK_129 = fcmp oeq double %sub212, %sub212_dup
  %sub214sub214 = fcmp oeq double %sub214, %sub214_dup
  %cmp216_QED_CHECK_131 = icmp eq i1 %cmp216, %cmp216_dup
  %247 = and i1 %cks.0.lcssa.i_QED_CHECK_128, %sub212_QED_CHECK_129
  %248 = and i1 %sub214sub214, %cmp216_QED_CHECK_131
  %CheckSum.exit_error = and i1 %247, %248
  call void @eddi_check_function(i1 %CheckSum.exit_error)
  br i1 %cmp216, label %if.then218, label %if.else220

if.then218:                                       ; preds = %CheckSum.exit
  %puts236 = tail call i32 @puts(i8* getelementptr inbounds ([12 x i8]* @str56, i64 0, i64 0))
  %puts236_dup = tail call i32 @puts(i8* getelementptr inbounds ([12 x i8]* @str56_dup, i64 0, i64 0))
  br label %if.end223

if.else220:                                       ; preds = %CheckSum.exit
  %puts235 = tail call i32 @puts(i8* getelementptr inbounds ([12 x i8]* @str55, i64 0, i64 0))
  %puts235_dup = tail call i32 @puts(i8* getelementptr inbounds ([12 x i8]* @str55_dup, i64 0, i64 0))
  br label %if.end223

if.end223:                                        ; preds = %if.else220, %if.then218, %if.end203
  %249 = alloca <{ i32, i32 }>
  %250 = load <{ i32, i32 }>* %249
  %251 = insertvalue <{ i32, i32 }> %250, i32 0, 0
  %252 = insertvalue <{ i32, i32 }> %251, i32 0, 1
  ret <{ i32, i32 }> %252
}

declare i32 @"\01_getopt"(i32, i8**, i8*) #0

; Function Attrs: nounwind readonly
declare i32 @atoi(i8* nocapture) #1

define void @printerr(i8* %s, i8* %s_dup) {
entry:
  %0 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !3
  %call = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %0, i8* getelementptr inbounds ([11 x i8]* @.str49, i64 0, i64 0), i8* %s) #6
  %1 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !3
  %call_dup = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %1, i8* getelementptr inbounds ([11 x i8]* @.str49_dup, i64 0, i64 0), i8* %s_dup) #6
  ret void
}

; Function Attrs: noreturn
declare void @exit(i32) #2

define <{ i64, i64 }> @log_2(i64 %number, i64 %number_dup) {
entry:
  br label %while.cond.outer

while.cond.outer:                                 ; preds = %if.else, %entry
  %cumulative.0.ph = phi i64 [ 1, %entry ], [ %mul, %if.else ]
  %out.0.ph = phi i64 [ 0, %entry ], [ %inc, %if.else ]
  %cumulative.0.ph_dup = phi i64 [ 1, %entry ], [ %mul_dup, %if.else ]
  %out.0.ph_dup = phi i64 [ 0, %entry ], [ %inc_dup, %if.else ]
  %cmp = icmp slt i64 %cumulative.0.ph, %number
  %cmp2 = icmp eq i64 %cumulative.0.ph, %number
  %cmp_dup = icmp slt i64 %cumulative.0.ph_dup, %number_dup
  %cmp2_dup = icmp eq i64 %cumulative.0.ph_dup, %number_dup
  %cumulative.0.ph_QED_CHECK_194 = icmp eq i64 %cumulative.0.ph, %cumulative.0.ph_dup
  %out.0.ph_QED_CHECK_195 = icmp eq i64 %out.0.ph, %out.0.ph_dup
  %cmp_QED_CHECK_196 = icmp eq i1 %cmp, %cmp_dup
  %cmp2_QED_CHECK_197 = icmp eq i1 %cmp2, %cmp2_dup
  %0 = and i1 %cumulative.0.ph_QED_CHECK_194, %out.0.ph_QED_CHECK_195
  %1 = and i1 %cmp_QED_CHECK_196, %cmp2_QED_CHECK_197
  %while.cond.outer_error = and i1 %0, %1
  call void @eddi_check_function(i1 %while.cond.outer_error)
  br i1 %cmp, label %while.cond.outer.split.us, label %while.cond.outer.while.cond.outer.split_crit_edge

while.cond.outer.while.cond.outer.split_crit_edge: ; preds = %while.cond.outer
  br label %while.end

while.cond.outer.split.us:                        ; preds = %while.cond.outer
  %cmp1 = icmp slt i64 %out.0.ph, 50
  %cmp1_dup = icmp slt i64 %out.0.ph_dup, 50
  %cmp1_QED_CHECK_198 = icmp eq i1 %cmp1, %cmp1_dup
  call void @eddi_check_function(i1 %cmp1_QED_CHECK_198)
  br i1 %cmp1, label %while.cond.outer.split.us.split.us, label %while.cond.outer.split.us.while.cond.outer.split.us.split_crit_edge

while.cond.outer.split.us.while.cond.outer.split.us.split_crit_edge: ; preds = %while.cond.outer.split.us
  br label %while.end

while.cond.outer.split.us.split.us:               ; preds = %while.cond.outer.split.us
  br i1 %cmp2, label %while.end, label %if.else

if.else:                                          ; preds = %while.cond.outer.split.us.split.us
  %mul = shl nsw i64 %cumulative.0.ph, 1
  %inc = add nsw i64 %out.0.ph, 1
  %mul_dup = shl nsw i64 %cumulative.0.ph_dup, 1
  %inc_dup = add nsw i64 %out.0.ph_dup, 1
  %mul_QED_CHECK_199 = icmp eq i64 %mul, %mul_dup
  %inc_QED_CHECK_200 = icmp eq i64 %inc, %inc_dup
  %if.else_error = and i1 %mul_QED_CHECK_199, %inc_QED_CHECK_200
  call void @eddi_check_function(i1 %if.else_error)
  br label %while.cond.outer

while.end:                                        ; preds = %while.cond.outer.split.us.split.us, %while.cond.outer.split.us.while.cond.outer.split.us.split_crit_edge, %while.cond.outer.while.cond.outer.split_crit_edge
  %cmp245 = phi i1 [ %cmp2, %while.cond.outer.split.us.while.cond.outer.split.us.split_crit_edge ], [ %cmp2, %while.cond.outer.while.cond.outer.split_crit_edge ], [ true, %while.cond.outer.split.us.split.us ]
  %cmp245_dup = phi i1 [ %cmp2_dup, %while.cond.outer.split.us.while.cond.outer.split.us.split_crit_edge ], [ %cmp2_dup, %while.cond.outer.while.cond.outer.split_crit_edge ], [ true, %while.cond.outer.split.us.split.us ]
  %out.0. = select i1 %cmp245, i64 %out.0.ph, i64 -1
  %out.0._dup = select i1 %cmp245_dup, i64 %out.0.ph_dup, i64 -1
  %cmp245_QED_CHECK_201 = icmp eq i1 %cmp245, %cmp245_dup
  %out.0._QED_CHECK_202 = icmp eq i64 %out.0., %out.0._dup
  %while.end_error = and i1 %cmp245_QED_CHECK_201, %out.0._QED_CHECK_202
  call void @eddi_check_function(i1 %while.end_error)
  %2 = alloca <{ i64, i64 }>
  %3 = load <{ i64, i64 }>* %2
  %4 = insertvalue <{ i64, i64 }> %3, i64 %out.0., 0
  %5 = insertvalue <{ i64, i64 }> %4, i64 %out.0._dup, 1
  ret <{ i64, i64 }> %5
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture, ...) #3

; Function Attrs: nounwind
declare noalias i8* @valloc(i64) #3

define void @InitX(double* %x, double* %x_dup) {
entry:
  tail call void @srand48(i64 0) #6
  %0 = load i64* @rootN, align 8, !tbaa !0
  %cmp24 = icmp sgt i64 %0, 0
  %1 = load i64* @rootN_dup, align 8, !tbaa !0
  %cmp24_dup = icmp sgt i64 %1, 0
  %cmp24_QED_CHECK_203 = icmp eq i1 %cmp24, %cmp24_dup
  call void @eddi_check_function(i1 %cmp24_QED_CHECK_203)
  br i1 %cmp24, label %for.body, label %for.end13

for.body:                                         ; preds = %for.inc11, %entry
  %2 = phi i64 [ %15, %for.inc11 ], [ %0, %entry ]
  %j.025 = phi i64 [ %inc12, %for.inc11 ], [ 0, %entry ]
  %3 = phi i64 [ %16, %for.inc11 ], [ %1, %entry ]
  %j.025_dup = phi i64 [ %inc12_dup, %for.inc11 ], [ 0, %entry ]
  %4 = load i64* @pad_length, align 8, !tbaa !0
  %add = add nsw i64 %4, %2
  %mul = mul nsw i64 %add, %j.025
  %cmp222 = icmp sgt i64 %2, 0
  %5 = load i64* @pad_length_dup, align 8, !tbaa !0
  %add_dup = add nsw i64 %5, %3
  %mul_dup = mul nsw i64 %add_dup, %j.025_dup
  %cmp222_dup = icmp sgt i64 %3, 0
  %_QED_CHECK_204 = icmp eq i64 %2, %3
  %j.025_QED_CHECK_205 = icmp eq i64 %j.025, %j.025_dup
  %add_QED_CHECK_206 = icmp eq i64 %add, %add_dup
  %mul_QED_CHECK_207 = icmp eq i64 %mul, %mul_dup
  %cmp222_QED_CHECK_208 = icmp eq i1 %cmp222, %cmp222_dup
  %6 = and i1 %_QED_CHECK_204, %j.025_QED_CHECK_205
  %7 = and i1 %mul_QED_CHECK_207, %cmp222_QED_CHECK_208
  %8 = and i1 %add_QED_CHECK_206, %7
  %for.body_error = and i1 %6, %8
  call void @eddi_check_function(i1 %for.body_error)
  br i1 %cmp222, label %for.body3, label %for.inc11

for.body3:                                        ; preds = %for.body3, %for.body
  %i.023 = phi i64 [ %inc, %for.body3 ], [ 0, %for.body ]
  %i.023_dup = phi i64 [ %inc_dup, %for.body3 ], [ 0, %for.body ]
  %call = tail call double @drand48() #6
  %add4 = add nsw i64 %i.023, %mul
  %mul5 = shl nsw i64 %add4, 1
  %arrayidx = getelementptr inbounds double* %x, i64 %mul5
  store double %call, double* %arrayidx, align 8, !tbaa !4
  %call6 = tail call double @drand48() #6
  %add921 = or i64 %mul5, 1
  %arrayidx10 = getelementptr inbounds double* %x, i64 %add921
  store double %call6, double* %arrayidx10, align 8, !tbaa !4
  %inc = add nsw i64 %i.023, 1
  %9 = load i64* @rootN, align 8, !tbaa !0
  %cmp2 = icmp slt i64 %inc, %9
  %add4_dup = add nsw i64 %i.023_dup, %mul_dup
  %mul5_dup = shl nsw i64 %add4_dup, 1
  %arrayidx_dup = getelementptr inbounds double* %x_dup, i64 %mul5_dup
  store double %call, double* %arrayidx_dup, align 8, !tbaa !4
  %add921_dup = or i64 %mul5_dup, 1
  %arrayidx10_dup = getelementptr inbounds double* %x_dup, i64 %add921_dup
  store double %call6, double* %arrayidx10_dup, align 8, !tbaa !4
  %inc_dup = add nsw i64 %i.023_dup, 1
  %10 = load i64* @rootN_dup, align 8, !tbaa !0
  %cmp2_dup = icmp slt i64 %inc_dup, %10
  %i.023_QED_CHECK_209 = icmp eq i64 %i.023, %i.023_dup
  %add4_QED_CHECK_210 = icmp eq i64 %add4, %add4_dup
  %mul5_QED_CHECK_211 = icmp eq i64 %mul5, %mul5_dup
  %add921add921 = icmp eq i64 %add921, %add921_dup
  %incinc = icmp eq i64 %inc, %inc_dup
  %cmp2_QED_CHECK_214 = icmp eq i1 %cmp2, %cmp2_dup
  %11 = and i1 %add4_QED_CHECK_210, %mul5_QED_CHECK_211
  %12 = and i1 %i.023_QED_CHECK_209, %11
  %13 = and i1 %incinc, %cmp2_QED_CHECK_214
  %14 = and i1 %add921add921, %13
  %for.body3_error = and i1 %12, %14
  call void @eddi_check_function(i1 %for.body3_error)
  br i1 %cmp2, label %for.body3, label %for.inc11

for.inc11:                                        ; preds = %for.body3, %for.body
  %15 = phi i64 [ %2, %for.body ], [ %9, %for.body3 ]
  %16 = phi i64 [ %3, %for.body ], [ %10, %for.body3 ]
  %inc12 = add nsw i64 %j.025, 1
  %cmp = icmp slt i64 %inc12, %15
  %inc12_dup = add nsw i64 %j.025_dup, 1
  %cmp_dup = icmp slt i64 %inc12_dup, %16
  %_QED_CHECK_215 = icmp eq i64 %15, %16
  %inc12_QED_CHECK_216 = icmp eq i64 %inc12, %inc12_dup
  %cmp_QED_CHECK_217 = icmp eq i1 %cmp, %cmp_dup
  %17 = and i1 %inc12_QED_CHECK_216, %cmp_QED_CHECK_217
  %for.inc11_error = and i1 %_QED_CHECK_215, %17
  call void @eddi_check_function(i1 %for.inc11_error)
  br i1 %cmp, label %for.body, label %for.end13

for.end13:                                        ; preds = %for.inc11, %entry
  ret void
}

define <{ double, double }> @CheckSum(double* %x, double* %x_dup) {
entry:
  %0 = load i64* @rootN, align 8, !tbaa !0
  %cmp27 = icmp sgt i64 %0, 0
  %1 = load i64* @rootN_dup, align 8, !tbaa !0
  %cmp27_dup = icmp sgt i64 %1, 0
  %cmp27_QED_CHECK_218 = icmp eq i1 %cmp27, %cmp27_dup
  call void @eddi_check_function(i1 %cmp27_QED_CHECK_218)
  br i1 %cmp27, label %for.body.lr.ph.split.us, label %for.end14

for.body.lr.ph.split.us:                          ; preds = %entry
  %2 = load i64* @pad_length, align 8, !tbaa !0
  %3 = load i64* @pad_length_dup, align 8, !tbaa !0
  br label %for.body3.lr.ph.us

for.inc12.us:                                     ; preds = %for.body3.us
  %inc13.us = add nsw i64 %j.028.us, 1
  %exitcond31 = icmp eq i64 %inc13.us, %0
  %inc13.us_dup = add nsw i64 %j.028.us_dup, 1
  %exitcond31_dup = icmp eq i64 %inc13.us_dup, %1
  %inc13.us_QED_CHECK_232 = icmp eq i64 %inc13.us, %inc13.us_dup
  %exitcond31_QED_CHECK_233 = icmp eq i1 %exitcond31, %exitcond31_dup
  %for.inc12.us_error = and i1 %inc13.us_QED_CHECK_232, %exitcond31_QED_CHECK_233
  call void @eddi_check_function(i1 %for.inc12.us_error)
  br i1 %exitcond31, label %for.end14, label %for.body3.lr.ph.us

for.body3.us:                                     ; preds = %for.body3.lr.ph.us, %for.body3.us
  %cks.126.us = phi double [ %cks.029.us, %for.body3.lr.ph.us ], [ %add11.us, %for.body3.us ]
  %i.025.us = phi i64 [ 0, %for.body3.lr.ph.us ], [ %inc.us, %for.body3.us ]
  %cks.126.us_dup = phi double [ %cks.029.us_dup, %for.body3.lr.ph.us ], [ %add11.us_dup, %for.body3.us ]
  %i.025.us_dup = phi i64 [ 0, %for.body3.lr.ph.us ], [ %inc.us_dup, %for.body3.us ]
  %add4.us = add nsw i64 %i.025.us, %mul.us
  %mul5.us = shl nsw i64 %add4.us, 1
  %arrayidx.us = getelementptr inbounds double* %x, i64 %mul5.us
  %4 = load double* %arrayidx.us, align 8, !tbaa !4
  %add823.us = or i64 %mul5.us, 1
  %arrayidx9.us = getelementptr inbounds double* %x, i64 %add823.us
  %5 = load double* %arrayidx9.us, align 8, !tbaa !4
  %add10.us = fadd double %4, %5
  %add11.us = fadd double %cks.126.us, %add10.us
  %inc.us = add nsw i64 %i.025.us, 1
  %exitcond = icmp eq i64 %inc.us, %0
  %add4.us_dup = add nsw i64 %i.025.us_dup, %mul.us_dup
  %mul5.us_dup = shl nsw i64 %add4.us_dup, 1
  %arrayidx.us_dup = getelementptr inbounds double* %x_dup, i64 %mul5.us_dup
  %6 = load double* %arrayidx.us_dup, align 8, !tbaa !4
  %add823.us_dup = or i64 %mul5.us_dup, 1
  %arrayidx9.us_dup = getelementptr inbounds double* %x_dup, i64 %add823.us_dup
  %7 = load double* %arrayidx9.us_dup, align 8, !tbaa !4
  %add10.us_dup = fadd double %6, %7
  %add11.us_dup = fadd double %cks.126.us_dup, %add10.us_dup
  %inc.us_dup = add nsw i64 %i.025.us_dup, 1
  %exitcond_dup = icmp eq i64 %inc.us_dup, %1
  %cks.126.us_QED_CHECK_223 = fcmp oeq double %cks.126.us, %cks.126.us_dup
  %i.025.us_QED_CHECK_224 = icmp eq i64 %i.025.us, %i.025.us_dup
  %add4.us_QED_CHECK_225 = icmp eq i64 %add4.us, %add4.us_dup
  %mul5.us_QED_CHECK_226 = icmp eq i64 %mul5.us, %mul5.us_dup
  %add823.us_QED_CHECK_227 = icmp eq i64 %add823.us, %add823.us_dup
  %add10.us_QED_CHECK_228 = fcmp oeq double %add10.us, %add10.us_dup
  %add11.us_QED_CHECK_229 = fcmp oeq double %add11.us, %add11.us_dup
  %inc.us_QED_CHECK_230 = icmp eq i64 %inc.us, %inc.us_dup
  %exitcond_QED_CHECK_231 = icmp eq i1 %exitcond, %exitcond_dup
  %8 = and i1 %cks.126.us_QED_CHECK_223, %i.025.us_QED_CHECK_224
  %9 = and i1 %add4.us_QED_CHECK_225, %mul5.us_QED_CHECK_226
  %10 = and i1 %8, %9
  %11 = and i1 %add823.us_QED_CHECK_227, %add10.us_QED_CHECK_228
  %12 = and i1 %inc.us_QED_CHECK_230, %exitcond_QED_CHECK_231
  %13 = and i1 %add11.us_QED_CHECK_229, %12
  %14 = and i1 %11, %13
  %for.body3.us_error = and i1 %10, %14
  call void @eddi_check_function(i1 %for.body3.us_error)
  br i1 %exitcond, label %for.inc12.us, label %for.body3.us

for.body3.lr.ph.us:                               ; preds = %for.inc12.us, %for.body.lr.ph.split.us
  %cks.029.us = phi double [ 0.000000e+00, %for.body.lr.ph.split.us ], [ %add11.us, %for.inc12.us ]
  %j.028.us = phi i64 [ 0, %for.body.lr.ph.split.us ], [ %inc13.us, %for.inc12.us ]
  %cks.029.us_dup = phi double [ 0.000000e+00, %for.body.lr.ph.split.us ], [ %add11.us_dup, %for.inc12.us ]
  %j.028.us_dup = phi i64 [ 0, %for.body.lr.ph.split.us ], [ %inc13.us_dup, %for.inc12.us ]
  %add.us = add nsw i64 %2, %0
  %mul.us = mul nsw i64 %add.us, %j.028.us
  %add.us_dup = add nsw i64 %3, %1
  %mul.us_dup = mul nsw i64 %add.us_dup, %j.028.us_dup
  %cks.029.us_QED_CHECK_219 = fcmp oeq double %cks.029.us, %cks.029.us_dup
  %"j.028.us\00\00\00\00\00\00\00\90(\00_220" = icmp eq i64 %j.028.us, %j.028.us_dup
  %add.us_QED_CHECK_221 = icmp eq i64 %add.us, %add.us_dup
  %mul.us_QED_CHECK_222 = icmp eq i64 %mul.us, %mul.us_dup
  %15 = and i1 %cks.029.us_QED_CHECK_219, %"j.028.us\00\00\00\00\00\00\00\90(\00_220"
  %16 = and i1 %add.us_QED_CHECK_221, %mul.us_QED_CHECK_222
  %for.body3.lr.ph.us_error = and i1 %15, %16
  call void @eddi_check_function(i1 %for.body3.lr.ph.us_error)
  br label %for.body3.us

for.end14:                                        ; preds = %for.inc12.us, %entry
  %cks.0.lcssa = phi double [ 0.000000e+00, %entry ], [ %add11.us, %for.inc12.us ]
  %cks.0.lcssa_dup = phi double [ 0.000000e+00, %entry ], [ %add11.us_dup, %for.inc12.us ]
  %cks.0.lcssa_QED_CHECK_234 = fcmp oeq double %cks.0.lcssa, %cks.0.lcssa_dup
  call void @eddi_check_function(i1 %cks.0.lcssa_QED_CHECK_234)
  %17 = alloca <{ double, double }>
  %18 = load <{ double, double }>* %17
  %19 = insertvalue <{ double, double }> %18, double %cks.0.lcssa, 0
  %20 = insertvalue <{ double, double }> %19, double %cks.0.lcssa_dup, 1
  ret <{ double, double }> %20
}

define void @PrintArray(i64 %N, i64 %N_dup, double* %x, double* %x_dup) {
entry:
  %0 = load i64* @rootN, align 8, !tbaa !0
  %cmp44 = icmp sgt i64 %0, 0
  %1 = load i64* @rootN_dup, align 8, !tbaa !0
  %cmp44_dup = icmp sgt i64 %1, 0
  %cmp44_QED_CHECK_235 = icmp eq i1 %cmp44, %cmp44_dup
  call void @eddi_check_function(i1 %cmp44_QED_CHECK_235)
  br i1 %cmp44, label %for.body.lr.ph, label %for.end23

for.body.lr.ph:                                   ; preds = %entry
  %sub = add nsw i64 %N, -1
  %sub_dup = add nsw i64 %N_dup, -1
  %sub_QED_CHECK_236 = icmp eq i64 %sub, %sub_dup
  call void @eddi_check_function(i1 %sub_QED_CHECK_236)
  br label %for.body

for.body:                                         ; preds = %for.inc21, %for.body.lr.ph
  %2 = phi i64 [ %0, %for.body.lr.ph ], [ %28, %for.inc21 ]
  %i.045 = phi i64 [ 0, %for.body.lr.ph ], [ %inc22, %for.inc21 ]
  %3 = phi i64 [ %1, %for.body.lr.ph ], [ %29, %for.inc21 ]
  %i.045_dup = phi i64 [ 0, %for.body.lr.ph ], [ %inc22_dup, %for.inc21 ]
  %4 = load i64* @pad_length, align 8, !tbaa !0
  %add = add nsw i64 %4, %2
  %mul = mul nsw i64 %add, %i.045
  %cmp242 = icmp sgt i64 %2, 0
  %5 = load i64* @pad_length_dup, align 8, !tbaa !0
  %add_dup = add nsw i64 %5, %3
  %mul_dup = mul nsw i64 %add_dup, %i.045_dup
  %cmp242_dup = icmp sgt i64 %3, 0
  %_QED_CHECK_237 = icmp eq i64 %2, %3
  %i.045_QED_CHECK_238 = icmp eq i64 %i.045, %i.045_dup
  %add_QED_CHECK_239 = icmp eq i64 %add, %add_dup
  %mul_QED_CHECK_240 = icmp eq i64 %mul, %mul_dup
  %cmp242_QED_CHECK_241 = icmp eq i1 %cmp242, %cmp242_dup
  %6 = and i1 %_QED_CHECK_237, %i.045_QED_CHECK_238
  %7 = and i1 %mul_QED_CHECK_240, %cmp242_QED_CHECK_241
  %8 = and i1 %add_QED_CHECK_239, %7
  %for.body_error = and i1 %6, %8
  call void @eddi_check_function(i1 %for.body_error)
  br i1 %cmp242, label %for.body3, label %for.inc21

for.body3:                                        ; preds = %for.inc, %for.body
  %j.043 = phi i64 [ %add15, %for.inc ], [ 0, %for.body ]
  %j.043_dup = phi i64 [ %add15_dup, %for.inc ], [ 0, %for.body ]
  %add4 = add nsw i64 %j.043, %mul
  %mul5 = shl nsw i64 %add4, 1
  %arrayidx = getelementptr inbounds double* %x, i64 %mul5
  %9 = load double* %arrayidx, align 8, !tbaa !4
  %add838 = or i64 %mul5, 1
  %arrayidx9 = getelementptr inbounds double* %x, i64 %add838
  %10 = load double* %arrayidx9, align 8, !tbaa !4
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str47, i64 0, i64 0), double %9, double %10) #6
  %11 = load i64* @rootN, align 8, !tbaa !0
  %mul10 = mul nsw i64 %11, %i.045
  %add11 = add nsw i64 %mul10, %j.043
  %cmp12 = icmp eq i64 %add11, %sub
  %add4_dup = add nsw i64 %j.043_dup, %mul_dup
  %mul5_dup = shl nsw i64 %add4_dup, 1
  %arrayidx_dup = getelementptr inbounds double* %x_dup, i64 %mul5_dup
  %12 = load double* %arrayidx_dup, align 8, !tbaa !4
  %add838_dup = or i64 %mul5_dup, 1
  %arrayidx9_dup = getelementptr inbounds double* %x_dup, i64 %add838_dup
  %13 = load double* %arrayidx9_dup, align 8, !tbaa !4
  %call_dup = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str47_dup, i64 0, i64 0), double %12, double %13) #6
  %14 = load i64* @rootN_dup, align 8, !tbaa !0
  %mul10_dup = mul nsw i64 %14, %i.045_dup
  %add11_dup = add nsw i64 %mul10_dup, %j.043_dup
  %cmp12_dup = icmp eq i64 %add11_dup, %sub_dup
  %j.043_QED_CHECK_242 = icmp eq i64 %j.043, %j.043_dup
  %add4_QED_CHECK_243 = icmp eq i64 %add4, %add4_dup
  %mul5mul5 = icmp eq i64 %mul5, %mul5_dup
  %add838add838 = icmp eq i64 %add838, %add838_dup
  %mul10_QED_CHECK_246 = icmp eq i64 %mul10, %mul10_dup
  %add11_QED_CHECK_247 = icmp eq i64 %add11, %add11_dup
  %cmp12_QED_CHECK_248 = icmp eq i1 %cmp12, %cmp12_dup
  %15 = and i1 %add4_QED_CHECK_243, %mul5mul5
  %16 = and i1 %j.043_QED_CHECK_242, %15
  %17 = and i1 %add838add838, %mul10_QED_CHECK_246
  %18 = and i1 %add11_QED_CHECK_247, %cmp12_QED_CHECK_248
  %19 = and i1 %17, %18
  %for.body3_error = and i1 %16, %19
  call void @eddi_check_function(i1 %for.body3_error)
  br i1 %cmp12, label %if.end, label %if.then

if.then:                                          ; preds = %for.body3
  %putchar41 = tail call i32 @putchar(i32 44) #6
  %.pre = load i64* @rootN, align 8, !tbaa !0
  %putchar41_dup = tail call i32 @putchar(i32 44) #6
  %.pre_dup = load i64* @rootN_dup, align 8, !tbaa !0
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body3
  %20 = phi i64 [ %11, %for.body3 ], [ %.pre, %if.then ]
  %21 = phi i64 [ %14, %for.body3 ], [ %.pre_dup, %if.then ]
  %mul14 = mul nsw i64 %20, %i.045
  %add15 = add i64 %j.043, 1
  %add16 = add i64 %add15, %mul14
  %rem39 = and i64 %add16, 7
  %cmp17 = icmp eq i64 %rem39, 0
  %mul14_dup = mul nsw i64 %21, %i.045_dup
  %add15_dup = add i64 %j.043_dup, 1
  %add16_dup = add i64 %add15_dup, %mul14_dup
  %rem39_dup = and i64 %add16_dup, 7
  %cmp17_dup = icmp eq i64 %rem39_dup, 0
  %_QED_CHECK_249 = icmp eq i64 %20, %21
  %mul14_QED_CHECK_250 = icmp eq i64 %mul14, %mul14_dup
  %add15_QED_CHECK_251 = icmp eq i64 %add15, %add15_dup
  %add16_QED_CHECK_252 = icmp eq i64 %add16, %add16_dup
  %rem39_QED_CHECK_253 = icmp eq i64 %rem39, %rem39_dup
  %cmp17_QED_CHECK_254 = icmp eq i1 %cmp17, %cmp17_dup
  %22 = and i1 %mul14_QED_CHECK_250, %add15_QED_CHECK_251
  %23 = and i1 %_QED_CHECK_249, %22
  %24 = and i1 %rem39_QED_CHECK_253, %cmp17_QED_CHECK_254
  %25 = and i1 %add16_QED_CHECK_252, %24
  %if.end_error = and i1 %23, %25
  call void @eddi_check_function(i1 %if.end_error)
  br i1 %cmp17, label %if.then18, label %for.inc

if.then18:                                        ; preds = %if.end
  %putchar40 = tail call i32 @putchar(i32 10) #6
  %.pre47 = load i64* @rootN, align 8, !tbaa !0
  %putchar40_dup = tail call i32 @putchar(i32 10) #6
  %.pre47_dup = load i64* @rootN_dup, align 8, !tbaa !0
  br label %for.inc

for.inc:                                          ; preds = %if.then18, %if.end
  %26 = phi i64 [ %20, %if.end ], [ %.pre47, %if.then18 ]
  %27 = phi i64 [ %21, %if.end ], [ %.pre47_dup, %if.then18 ]
  %cmp2 = icmp slt i64 %add15, %26
  %cmp2_dup = icmp slt i64 %add15_dup, %27
  %_QED_CHECK_255 = icmp eq i64 %26, %27
  %cmp2_QED_CHECK_256 = icmp eq i1 %cmp2, %cmp2_dup
  %for.inc_error = and i1 %_QED_CHECK_255, %cmp2_QED_CHECK_256
  call void @eddi_check_function(i1 %for.inc_error)
  br i1 %cmp2, label %for.body3, label %for.inc21

for.inc21:                                        ; preds = %for.inc, %for.body
  %28 = phi i64 [ %2, %for.body ], [ %26, %for.inc ]
  %29 = phi i64 [ %3, %for.body ], [ %27, %for.inc ]
  %inc22 = add nsw i64 %i.045, 1
  %cmp = icmp slt i64 %inc22, %28
  %inc22_dup = add nsw i64 %i.045_dup, 1
  %cmp_dup = icmp slt i64 %inc22_dup, %29
  %_QED_CHECK_257 = icmp eq i64 %28, %29
  %inc22_QED_CHECK_258 = icmp eq i64 %inc22, %inc22_dup
  %cmp_QED_CHECK_259 = icmp eq i1 %cmp, %cmp_dup
  %30 = and i1 %inc22_QED_CHECK_258, %cmp_QED_CHECK_259
  %for.inc21_error = and i1 %_QED_CHECK_257, %30
  call void @eddi_check_function(i1 %for.inc21_error)
  br i1 %cmp, label %for.body, label %for.end23

for.end23:                                        ; preds = %for.inc21, %entry
  %putchar = tail call i32 @putchar(i32 10) #6
  %putchar37 = tail call i32 @putchar(i32 10) #6
  %putchar_dup = tail call i32 @putchar(i32 10) #6
  %putchar37_dup = tail call i32 @putchar(i32 10) #6
  ret void
}

define void @InitU(i64 %N, i64 %N_dup, double* %u, double* %u_dup) {
entry:
  %cmp49 = icmp sgt i64 %N, 1
  %cmp49_dup = icmp sgt i64 %N_dup, 1
  %cmp49_QED_CHECK_260 = icmp eq i1 %cmp49, %cmp49_dup
  call void @eddi_check_function(i1 %cmp49_QED_CHECK_260)
  br i1 %cmp49, label %for.body.lr.ph, label %for.end30

for.body.lr.ph:                                   ; preds = %entry
  %0 = load i64* @rootN, align 8, !tbaa !0
  %sub9 = add nsw i64 %0, -1
  %1 = load i64* @rootN_dup, align 8, !tbaa !0
  %sub9_dup = add nsw i64 %1, -1
  %sub9_QED_CHECK_261 = icmp eq i64 %sub9, %sub9_dup
  call void @eddi_check_function(i1 %sub9_QED_CHECK_261)
  br label %for.body

for.body:                                         ; preds = %for.inc28, %for.body.lr.ph
  %conv51 = phi i64 [ 1, %for.body.lr.ph ], [ %conv, %for.inc28 ]
  %q.050 = phi i64 [ 0, %for.body.lr.ph ], [ %inc29, %for.inc28 ]
  %conv51_dup = phi i64 [ 1, %for.body.lr.ph ], [ %conv_dup, %for.inc28 ]
  %q.050_dup = phi i64 [ 0, %for.body.lr.ph ], [ %inc29_dup, %for.inc28 ]
  %sub = add nsw i64 %conv51, -1
  %cmp646 = icmp sgt i64 %conv51, 0
  %sub_dup = add nsw i64 %conv51_dup, -1
  %cmp646_dup = icmp sgt i64 %conv51_dup, 0
  %conv51_QED_CHECK_262 = icmp eq i64 %conv51, %conv51_dup
  %q.050_QED_CHECK_263 = icmp eq i64 %q.050, %q.050_dup
  %sub_QED_CHECK_264 = icmp eq i64 %sub, %sub_dup
  %cmp646_QED_CHECK_265 = icmp eq i1 %cmp646, %cmp646_dup
  %2 = and i1 %conv51_QED_CHECK_262, %q.050_QED_CHECK_263
  %3 = and i1 %sub_QED_CHECK_264, %cmp646_QED_CHECK_265
  %for.body_error = and i1 %2, %3
  call void @eddi_check_function(i1 %for.body_error)
  br i1 %cmp646, label %for.body8.lr.ph, label %for.inc28

for.body8.lr.ph:                                  ; preds = %for.body
  %mul13 = shl nsw i64 %conv51, 1
  %conv14 = sitofp i64 %mul13 to double
  %mul13_dup = shl nsw i64 %conv51_dup, 1
  %conv14_dup = sitofp i64 %mul13_dup to double
  %mul13_QED_CHECK_266 = icmp eq i64 %mul13, %mul13_dup
  %conv14_QED_CHECK_267 = fcmp oeq double %conv14, %conv14_dup
  %for.body8.lr.ph_error = and i1 %mul13_QED_CHECK_266, %conv14_QED_CHECK_267
  call void @eddi_check_function(i1 %for.body8.lr.ph_error)
  br label %for.body8

for.body8:                                        ; preds = %if.end, %for.body8.lr.ph
  %j.047 = phi i64 [ 0, %for.body8.lr.ph ], [ %inc, %if.end ]
  %j.047_dup = phi i64 [ 0, %for.body8.lr.ph ], [ %inc_dup, %if.end ]
  %add = add nsw i64 %sub, %j.047
  %cmp10 = icmp sgt i64 %add, %sub9
  %add_dup = add nsw i64 %sub_dup, %j.047_dup
  %cmp10_dup = icmp sgt i64 %add_dup, %sub9_dup
  %j.047_QED_CHECK_268 = icmp eq i64 %j.047, %j.047_dup
  %add_QED_CHECK_269 = icmp eq i64 %add, %add_dup
  %cmp10_QED_CHECK_270 = icmp eq i1 %cmp10, %cmp10_dup
  %4 = and i1 %add_QED_CHECK_269, %cmp10_QED_CHECK_270
  %for.body8_error = and i1 %j.047_QED_CHECK_268, %4
  call void @eddi_check_function(i1 %for.body8_error)
  br i1 %cmp10, label %for.end30, label %if.end

if.end:                                           ; preds = %for.body8
  %conv12 = sitofp i64 %j.047 to double
  %mul = fmul double %conv12, 6.283200e+00
  %div = fdiv double %mul, %conv14
  %call = tail call double @cos(double %div) #8
  %mul16 = shl nsw i64 %add, 1
  %arrayidx = getelementptr inbounds double* %u, i64 %mul16
  store double %call, double* %arrayidx, align 8, !tbaa !4
  %call22 = tail call double @sin(double %div) #8
  %sub23 = fsub double -0.000000e+00, %call22
  %add2645 = or i64 %mul16, 1
  %arrayidx27 = getelementptr inbounds double* %u, i64 %add2645
  store double %sub23, double* %arrayidx27, align 8, !tbaa !4
  %inc = add nsw i64 %j.047, 1
  %cmp6 = icmp slt i64 %inc, %conv51
  %conv12_dup = sitofp i64 %j.047_dup to double
  %mul_dup = fmul double %conv12_dup, 6.283200e+00
  %div_dup = fdiv double %mul_dup, %conv14_dup
  %call_dup = tail call double @cos(double %div_dup) #8
  %mul16_dup = shl nsw i64 %add_dup, 1
  %arrayidx_dup = getelementptr inbounds double* %u_dup, i64 %mul16_dup
  store double %call_dup, double* %arrayidx_dup, align 8, !tbaa !4
  %call22_dup = tail call double @sin(double %div_dup) #8
  %sub23_dup = fsub double -0.000000e+00, %call22_dup
  %add2645_dup = or i64 %mul16_dup, 1
  %arrayidx27_dup = getelementptr inbounds double* %u_dup, i64 %add2645_dup
  store double %sub23_dup, double* %arrayidx27_dup, align 8, !tbaa !4
  %inc_dup = add nsw i64 %j.047_dup, 1
  %cmp6_dup = icmp slt i64 %inc_dup, %conv51_dup
  %conv12_QED_CHECK_271 = fcmp oeq double %conv12, %conv12_dup
  %mul_QED_CHECK_272 = fcmp oeq double %mul, %mul_dup
  %div_QED_CHECK_273 = fcmp oeq double %div, %div_dup
  %mul16_QED_CHECK_274 = icmp eq i64 %mul16, %mul16_dup
  %sub23_QED_CHECK_275 = fcmp oeq double %sub23, %sub23_dup
  %add2645_QED_CHECK_276 = icmp eq i64 %add2645, %add2645_dup
  %inc_QED_CHECK_277 = icmp eq i64 %inc, %inc_dup
  %cmp6_QED_CHECK_278 = icmp eq i1 %cmp6, %cmp6_dup
  %5 = and i1 %conv12_QED_CHECK_271, %mul_QED_CHECK_272
  %6 = and i1 %div_QED_CHECK_273, %mul16_QED_CHECK_274
  %7 = and i1 %5, %6
  %8 = and i1 %sub23_QED_CHECK_275, %add2645_QED_CHECK_276
  %9 = and i1 %inc_QED_CHECK_277, %cmp6_QED_CHECK_278
  %10 = and i1 %8, %9
  %if.end_error = and i1 %7, %10
  call void @eddi_check_function(i1 %if.end_error)
  br i1 %cmp6, label %for.body8, label %for.inc28

for.inc28:                                        ; preds = %if.end, %for.body
  %inc29 = add nsw i64 %q.050, 1
  %sh_prom = trunc i64 %inc29 to i32
  %shl = shl i32 1, %sh_prom
  %conv = sext i32 %shl to i64
  %cmp = icmp slt i64 %conv, %N
  %inc29_dup = add nsw i64 %q.050_dup, 1
  %sh_prom_dup = trunc i64 %inc29_dup to i32
  %shl_dup = shl i32 1, %sh_prom_dup
  %conv_dup = sext i32 %shl_dup to i64
  %cmp_dup = icmp slt i64 %conv_dup, %N_dup
  %inc29_QED_CHECK_279 = icmp eq i64 %inc29, %inc29_dup
  %sh_prom_QED_CHECK_280 = icmp eq i32 %sh_prom, %sh_prom_dup
  %shl_QED_CHECK_281 = icmp eq i32 %shl, %shl_dup
  %conv_QED_CHECK_282 = icmp eq i64 %conv, %conv_dup
  %cmp_QED_CHECK_283 = icmp eq i1 %cmp, %cmp_dup
  %11 = and i1 %inc29_QED_CHECK_279, %sh_prom_QED_CHECK_280
  %12 = and i1 %conv_QED_CHECK_282, %cmp_QED_CHECK_283
  %13 = and i1 %shl_QED_CHECK_281, %12
  %for.inc28_error = and i1 %11, %13
  call void @eddi_check_function(i1 %for.inc28_error)
  br i1 %cmp, label %for.body, label %for.end30

for.end30:                                        ; preds = %for.inc28, %for.body8, %entry
  ret void
}

define void @InitU2(i64 %N, i64 %N_dup, double* %u, double* %u_dup, i64 %n1, i64 %n1_dup) {
entry:
  %cmp40 = icmp sgt i64 %n1, 0
  %cmp40_dup = icmp sgt i64 %n1_dup, 0
  %cmp40_QED_CHECK_284 = icmp eq i1 %cmp40, %cmp40_dup
  call void @eddi_check_function(i1 %cmp40_QED_CHECK_284)
  br i1 %cmp40, label %for.body.lr.ph.split.us, label %for.end23

for.body.lr.ph.split.us:                          ; preds = %entry
  %0 = load i64* @rootN, align 8, !tbaa !0
  %1 = load i64* @pad_length, align 8, !tbaa !0
  %add = add nsw i64 %1, %0
  %conv7 = sitofp i64 %N to double
  %2 = load i64* @rootN_dup, align 8, !tbaa !0
  %3 = load i64* @pad_length_dup, align 8, !tbaa !0
  %add_dup = add nsw i64 %3, %2
  %conv7_dup = sitofp i64 %N_dup to double
  %add_QED_CHECK_285 = icmp eq i64 %add, %add_dup
  %conv7_QED_CHECK_286 = fcmp oeq double %conv7, %conv7_dup
  %for.body.lr.ph.split.us_error = and i1 %add_QED_CHECK_285, %conv7_QED_CHECK_286
  call void @eddi_check_function(i1 %for.body.lr.ph.split.us_error)
  br label %for.body3.lr.ph.us

for.inc21.us:                                     ; preds = %for.body3.us
  %inc22.us = add nsw i64 %j.041.us, 1
  %exitcond42 = icmp eq i64 %inc22.us, %n1
  %inc22.us_dup = add nsw i64 %j.041.us_dup, 1
  %exitcond42_dup = icmp eq i64 %inc22.us_dup, %n1_dup
  %inc22.us_QED_CHECK_301 = icmp eq i64 %inc22.us, %inc22.us_dup
  %exitcond42_QED_CHECK_302 = icmp eq i1 %exitcond42, %exitcond42_dup
  %for.inc21.us_error = and i1 %inc22.us_QED_CHECK_301, %exitcond42_QED_CHECK_302
  call void @eddi_check_function(i1 %for.inc21.us_error)
  br i1 %exitcond42, label %for.end23, label %for.body3.lr.ph.us

for.body3.us:                                     ; preds = %for.body3.lr.ph.us, %for.body3.us
  %i.039.us = phi i64 [ 0, %for.body3.lr.ph.us ], [ %inc.us, %for.body3.us ]
  %i.039.us_dup = phi i64 [ 0, %for.body3.lr.ph.us ], [ %inc.us_dup, %for.body3.us ]
  %conv.us = sitofp i64 %i.039.us to double
  %mul4.us = fmul double %conv.us, 6.283200e+00
  %mul6.us = fmul double %conv5.us, %mul4.us
  %div.us = fdiv double %mul6.us, %conv7
  %call.us = tail call double @cos(double %div.us) #8
  %add8.us = add nsw i64 %i.039.us, %mul.us
  %mul9.us = shl nsw i64 %add8.us, 1
  %arrayidx.us = getelementptr inbounds double* %u, i64 %mul9.us
  store double %call.us, double* %arrayidx.us, align 8, !tbaa !4
  %call16.us = tail call double @sin(double %div.us) #8
  %sub.us = fsub double -0.000000e+00, %call16.us
  %add1937.us = or i64 %mul9.us, 1
  %arrayidx20.us = getelementptr inbounds double* %u, i64 %add1937.us
  store double %sub.us, double* %arrayidx20.us, align 8, !tbaa !4
  %inc.us = add nsw i64 %i.039.us, 1
  %exitcond = icmp eq i64 %inc.us, %n1
  %conv.us_dup = sitofp i64 %i.039.us_dup to double
  %mul4.us_dup = fmul double %conv.us_dup, 6.283200e+00
  %mul6.us_dup = fmul double %conv5.us_dup, %mul4.us_dup
  %div.us_dup = fdiv double %mul6.us_dup, %conv7_dup
  %call.us_dup = tail call double @cos(double %div.us_dup) #8
  %add8.us_dup = add nsw i64 %i.039.us_dup, %mul.us_dup
  %mul9.us_dup = shl nsw i64 %add8.us_dup, 1
  %arrayidx.us_dup = getelementptr inbounds double* %u_dup, i64 %mul9.us_dup
  store double %call.us_dup, double* %arrayidx.us_dup, align 8, !tbaa !4
  %call16.us_dup = tail call double @sin(double %div.us_dup) #8
  %sub.us_dup = fsub double -0.000000e+00, %call16.us_dup
  %add1937.us_dup = or i64 %mul9.us_dup, 1
  %arrayidx20.us_dup = getelementptr inbounds double* %u_dup, i64 %add1937.us_dup
  store double %sub.us_dup, double* %arrayidx20.us_dup, align 8, !tbaa !4
  %inc.us_dup = add nsw i64 %i.039.us_dup, 1
  %exitcond_dup = icmp eq i64 %inc.us_dup, %n1_dup
  %i.039.us_QED_CHECK_290 = icmp eq i64 %i.039.us, %i.039.us_dup
  %conv.us_QED_CHECK_291 = fcmp oeq double %conv.us, %conv.us_dup
  %mul4.us_QED_CHECK_292 = fcmp oeq double %mul4.us, %mul4.us_dup
  %mul6.us_QED_CHECK_293 = fcmp oeq double %mul6.us, %mul6.us_dup
  %div.us_QED_CHECK_294 = fcmp oeq double %div.us, %div.us_dup
  %add8.us_QED_CHECK_295 = icmp eq i64 %add8.us, %add8.us_dup
  %mul9.usmul9.us = icmp eq i64 %mul9.us, %mul9.us_dup
  %sub.ussub.us = fcmp oeq double %sub.us, %sub.us_dup
  %add1937.us_QED_CHECK_298 = icmp eq i64 %add1937.us, %add1937.us_dup
  %inc.us_QED_CHECK_299 = icmp eq i64 %inc.us, %inc.us_dup
  %exitcond_QED_CHECK_300 = icmp eq i1 %exitcond, %exitcond_dup
  %4 = and i1 %i.039.us_QED_CHECK_290, %conv.us_QED_CHECK_291
  %5 = and i1 %mul6.us_QED_CHECK_293, %div.us_QED_CHECK_294
  %6 = and i1 %mul4.us_QED_CHECK_292, %5
  %7 = and i1 %4, %6
  %8 = and i1 %mul9.usmul9.us, %sub.ussub.us
  %9 = and i1 %add8.us_QED_CHECK_295, %8
  %10 = and i1 %inc.us_QED_CHECK_299, %exitcond_QED_CHECK_300
  %11 = and i1 %add1937.us_QED_CHECK_298, %10
  %12 = and i1 %9, %11
  %for.body3.us_error = and i1 %7, %12
  call void @eddi_check_function(i1 %for.body3.us_error)
  br i1 %exitcond, label %for.inc21.us, label %for.body3.us

for.body3.lr.ph.us:                               ; preds = %for.inc21.us, %for.body.lr.ph.split.us
  %j.041.us = phi i64 [ 0, %for.body.lr.ph.split.us ], [ %inc22.us, %for.inc21.us ]
  %j.041.us_dup = phi i64 [ 0, %for.body.lr.ph.split.us ], [ %inc22.us_dup, %for.inc21.us ]
  %mul.us = mul nsw i64 %add, %j.041.us
  %conv5.us = sitofp i64 %j.041.us to double
  %mul.us_dup = mul nsw i64 %add_dup, %j.041.us_dup
  %conv5.us_dup = sitofp i64 %j.041.us_dup to double
  %j.041.us_QED_CHECK_287 = icmp eq i64 %j.041.us, %j.041.us_dup
  %mul.us_QED_CHECK_288 = icmp eq i64 %mul.us, %mul.us_dup
  %conv5.us_QED_CHECK_289 = fcmp oeq double %conv5.us, %conv5.us_dup
  %13 = and i1 %mul.us_QED_CHECK_288, %conv5.us_QED_CHECK_289
  %for.body3.lr.ph.us_error = and i1 %j.041.us_QED_CHECK_287, %13
  call void @eddi_check_function(i1 %for.body3.lr.ph.us_error)
  br label %for.body3.us

for.end23:                                        ; preds = %for.inc21.us, %entry
  ret void
}

define void @SlaveStart() {
entry:
  %0 = load i64* @rootN, align 8, !tbaa !0
  %sub = shl i64 %0, 4
  %mul1 = add i64 %sub, -16
  %call = tail call i8* @malloc(i64 %mul1) #6
  %1 = bitcast i8* %call to double*
  %cmp = icmp eq i8* %call, null
  %2 = load i64* @rootN_dup, align 8, !tbaa !0
  %sub_dup = shl i64 %2, 4
  %mul1_dup = add i64 %sub_dup, -16
  %call_dup = tail call i8* @malloc(i64 %mul1_dup) #6
  %3 = bitcast i8* %call_dup to double*
  %cmp_dup = icmp eq i8* %call_dup, null
  %sub_QED_CHECK_303 = icmp eq i64 %sub, %sub_dup
  %mul1_QED_CHECK_304 = icmp eq i64 %mul1, %mul1_dup
  %cmp_QED_CHECK_305 = icmp eq i1 %cmp, %cmp_dup
  %4 = and i1 %mul1_QED_CHECK_304, %cmp_QED_CHECK_305
  %entry_error = and i1 %sub_QED_CHECK_303, %4
  call void @eddi_check_function(i1 %entry_error)
  br i1 %cmp, label %if.then, label %for.cond.preheader

for.cond.preheader:                               ; preds = %entry
  %sub328 = shl i64 %0, 1
  %mul429 = add i64 %sub328, -2
  %cmp530 = icmp sgt i64 %mul429, 0
  %sub328_dup = shl i64 %2, 1
  %mul429_dup = add i64 %sub328_dup, -2
  %cmp530_dup = icmp sgt i64 %mul429_dup, 0
  %sub328_QED_CHECK_306 = icmp eq i64 %sub328, %sub328_dup
  %mul429_QED_CHECK_307 = icmp eq i64 %mul429, %mul429_dup
  %cmp530_QED_CHECK_308 = icmp eq i1 %cmp530, %cmp530_dup
  %5 = and i1 %mul429_QED_CHECK_307, %cmp530_QED_CHECK_308
  %for.cond.preheader_error = and i1 %sub328_QED_CHECK_306, %5
  call void @eddi_check_function(i1 %for.cond.preheader_error)
  br i1 %cmp530, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %for.cond.preheader
  %6 = load double** @umain, align 8, !tbaa !3
  %7 = bitcast double* %6 to i8*
  %8 = shl i64 %0, 1
  %9 = add i64 %8, -2
  %10 = icmp sgt i64 %9, 1
  %.op = shl i64 %9, 3
  %11 = select i1 %10, i64 %.op, i64 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %call, i8* %7, i64 %11, i32 8, i1 false)
  %12 = load double** @umain_dup, align 8, !tbaa !3
  %13 = bitcast double* %12 to i8*
  %14 = shl i64 %2, 1
  %15 = add i64 %14, -2
  %16 = icmp sgt i64 %15, 1
  %.op_dup = shl i64 %15, 3
  %17 = select i1 %16, i64 %.op_dup, i64 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %call_dup, i8* %13, i64 %17, i32 8, i1 false)
  %_QED_CHECK_309 = icmp eq i64 %8, %14
  %_QED_CHECK_310 = icmp eq i64 %9, %15
  %_QED_CHECK_311 = icmp eq i1 %10, %16
  %.op_QED_CHECK_312 = icmp eq i64 %.op, %.op_dup
  %_QED_CHECK_313 = icmp eq i64 %11, %17
  %18 = and i1 %_QED_CHECK_309, %_QED_CHECK_310
  %19 = and i1 %.op_QED_CHECK_312, %_QED_CHECK_313
  %20 = and i1 %_QED_CHECK_311, %19
  %for.body.lr.ph_error = and i1 %18, %20
  call void @eddi_check_function(i1 %for.body.lr.ph_error)
  br label %for.end

if.then:                                          ; preds = %entry
  %21 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !3
  %call2 = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %21, i8* getelementptr inbounds ([44 x i8]* @.str46, i64 0, i64 0), i64 0) #6
  tail call void @exit(i32 -1) #7
  %22 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !3
  %call2_dup = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %22, i8* getelementptr inbounds ([44 x i8]* @.str46_dup, i64 0, i64 0), i64 0) #6
  tail call void @exit(i32 -1) #7
  unreachable

for.end:                                          ; preds = %for.body.lr.ph, %for.cond.preheader
  %23 = load i64* @P, align 8, !tbaa !0
  %div9 = sdiv i64 %0, %23
  %24 = load i64* @M, align 8, !tbaa !0
  %25 = load i64* @N, align 8, !tbaa !0
  %26 = load double** @x, align 8, !tbaa !3
  %27 = load double** @trans, align 8, !tbaa !3
  %28 = load double** @umain2, align 8, !tbaa !3
  %29 = load i64* @pad_length, align 8, !tbaa !0
  %30 = load i64* @test_result, align 8, !tbaa !0
  %31 = load i64* @P_dup, align 8, !tbaa !0
  %div9_dup = sdiv i64 %2, %31
  %32 = load i64* @M_dup, align 8, !tbaa !0
  %33 = load i64* @N_dup, align 8, !tbaa !0
  %34 = load double** @x_dup, align 8, !tbaa !3
  %35 = load double** @trans_dup, align 8, !tbaa !3
  %36 = load double** @umain2_dup, align 8, !tbaa !3
  %37 = load i64* @pad_length_dup, align 8, !tbaa !0
  %38 = load i64* @test_result_dup, align 8, !tbaa !0
  call void @FFT1D(i64 1, i64 1, i64 %24, i64 %32, i64 %25, i64 %33, double* %26, double* %34, double* %27, double* %35, double* %1, double* %3, double* %28, double* %36, i64 0, i64 0, i64* undef, i64* undef, i64 0, i64 0, i64 %div9, i64 %div9_dup, i64 %29, i64 %37, i64 %30, i64 %38, i64 undef, i64 undef)
  %39 = load i64* @test_result, align 8, !tbaa !0
  %tobool = icmp eq i64 %39, 0
  %40 = load i64* @test_result_dup, align 8, !tbaa !0
  %tobool_dup = icmp eq i64 %40, 0
  %div9_QED_CHECK_314 = icmp eq i64 %div9, %div9_dup
  %tobool_QED_CHECK_315 = icmp eq i1 %tobool, %tobool_dup
  %for.end_error = and i1 %div9_QED_CHECK_314, %tobool_QED_CHECK_315
  call void @eddi_check_function(i1 %for.end_error)
  br i1 %tobool, label %if.end12, label %if.then11

if.then11:                                        ; preds = %for.end
  %41 = load i64* @M, align 8, !tbaa !0
  %42 = load i64* @N, align 8, !tbaa !0
  %43 = load double** @x, align 8, !tbaa !3
  %44 = load double** @trans, align 8, !tbaa !3
  %45 = load double** @umain2, align 8, !tbaa !3
  %46 = load i64* @pad_length, align 8, !tbaa !0
  %47 = load i64* @M_dup, align 8, !tbaa !0
  %48 = load i64* @N_dup, align 8, !tbaa !0
  %49 = load double** @x_dup, align 8, !tbaa !3
  %50 = load double** @trans_dup, align 8, !tbaa !3
  %51 = load double** @umain2_dup, align 8, !tbaa !3
  %52 = load i64* @pad_length_dup, align 8, !tbaa !0
  call void @FFT1D(i64 -1, i64 -1, i64 %41, i64 %47, i64 %42, i64 %48, double* %43, double* %49, double* %44, double* %50, double* %1, double* %3, double* %45, double* %51, i64 0, i64 0, i64* undef, i64* undef, i64 0, i64 0, i64 %div9, i64 %div9_dup, i64 %46, i64 %52, i64 %39, i64 %40, i64 undef, i64 undef)
  br label %if.end12

if.end12:                                         ; preds = %if.then11, %for.end
  ret void
}

; Function Attrs: nounwind readnone
declare double @fabs(double) #4

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct.__sFILE* nocapture, i8* nocapture, ...) #3

define <{ double, double }> @TouchArray(double* %x, double* %x_dup, double* %scratch, double* %scratch_dup, double* %u, double* %u_dup, double* %upriv, double* %upriv_dup, i64 %MyFirst, i64 %MyFirst_dup, i64 %MyLast, i64 %MyLast_dup) {
entry:
  %0 = load i64* @rootN, align 8, !tbaa !0
  %sub72 = shl i64 %0, 1
  %mul73 = add i64 %sub72, -2
  %cmp74 = icmp sgt i64 %mul73, 0
  %1 = load i64* @rootN_dup, align 8, !tbaa !0
  %sub72_dup = shl i64 %1, 1
  %mul73_dup = add i64 %sub72_dup, -2
  %cmp74_dup = icmp sgt i64 %mul73_dup, 0
  %sub72_QED_CHECK_316 = icmp eq i64 %sub72, %sub72_dup
  %mul73_QED_CHECK_317 = icmp eq i64 %mul73, %mul73_dup
  %cmp74_QED_CHECK_318 = icmp eq i1 %cmp74, %cmp74_dup
  %2 = and i1 %mul73_QED_CHECK_317, %cmp74_QED_CHECK_318
  %entry_error = and i1 %sub72_QED_CHECK_316, %2
  call void @eddi_check_function(i1 %entry_error)
  br i1 %cmp74, label %for.body, label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.body, %entry
  %tot.0.lcssa = phi double [ 0.000000e+00, %entry ], [ %add, %for.body ]
  %tot.0.lcssa_dup = phi double [ 0.000000e+00, %entry ], [ %add_dup, %for.body ]
  %cmp268 = icmp slt i64 %MyFirst, %MyLast
  %cmp268_dup = icmp slt i64 %MyFirst_dup, %MyLast_dup
  %tot.0.lcssa_QED_CHECK_324 = fcmp oeq double %tot.0.lcssa, %tot.0.lcssa_dup
  %cmp268_QED_CHECK_325 = icmp eq i1 %cmp268, %cmp268_dup
  %for.cond1.preheader_error = and i1 %tot.0.lcssa_QED_CHECK_324, %cmp268_QED_CHECK_325
  call void @eddi_check_function(i1 %for.cond1.preheader_error)
  br i1 %cmp268, label %for.body3.lr.ph, label %for.end41

for.body3.lr.ph:                                  ; preds = %for.cond1.preheader
  %3 = load i64* @pad_length, align 8, !tbaa !0
  %add4 = add nsw i64 %3, %0
  %cmp765 = icmp sgt i64 %0, 0
  %4 = load i64* @pad_length_dup, align 8, !tbaa !0
  %add4_dup = add nsw i64 %4, %1
  %cmp765_dup = icmp sgt i64 %1, 0
  %add4_QED_CHECK_326 = icmp eq i64 %add4, %add4_dup
  %cmp765_QED_CHECK_327 = icmp eq i1 %cmp765, %cmp765_dup
  %for.body3.lr.ph_error = and i1 %add4_QED_CHECK_326, %cmp765_QED_CHECK_327
  call void @eddi_check_function(i1 %for.body3.lr.ph_error)
  br i1 %cmp765, label %for.body8.lr.ph.us, label %for.inc39

for.inc39.us:                                     ; preds = %for.body8.us
  %inc40.us = add nsw i64 %j.169.us, 1
  %exitcond79 = icmp eq i64 %inc40.us, %MyLast
  %inc40.us_dup = add nsw i64 %j.169.us_dup, 1
  %exitcond79_dup = icmp eq i64 %inc40.us_dup, %MyLast_dup
  %inc40.us_QED_CHECK_344 = icmp eq i64 %inc40.us, %inc40.us_dup
  %exitcond79_QED_CHECK_345 = icmp eq i1 %exitcond79, %exitcond79_dup
  %for.inc39.us_error = and i1 %inc40.us_QED_CHECK_344, %exitcond79_QED_CHECK_345
  call void @eddi_check_function(i1 %for.inc39.us_error)
  br i1 %exitcond79, label %for.end41, label %for.body8.lr.ph.us

for.body8.us:                                     ; preds = %for.body8.lr.ph.us, %for.body8.us
  %tot.267.us = phi double [ %tot.170.us, %for.body8.lr.ph.us ], [ %add35.us, %for.body8.us ]
  %i.066.us = phi i64 [ 0, %for.body8.lr.ph.us ], [ %inc37.us, %for.body8.us ]
  %tot.267.us_dup = phi double [ %tot.170.us_dup, %for.body8.lr.ph.us ], [ %add35.us_dup, %for.body8.us ]
  %i.066.us_dup = phi i64 [ 0, %for.body8.lr.ph.us ], [ %inc37.us_dup, %for.body8.us ]
  %add9.us = add nsw i64 %i.066.us, %mul5.us
  %mul10.us = shl nsw i64 %add9.us, 1
  %arrayidx11.us = getelementptr inbounds double* %x, i64 %mul10.us
  %5 = load double* %arrayidx11.us, align 8, !tbaa !4
  %add1464.us = or i64 %mul10.us, 1
  %arrayidx15.us = getelementptr inbounds double* %x, i64 %add1464.us
  %6 = load double* %arrayidx15.us, align 8, !tbaa !4
  %add16.us = fadd double %5, %6
  %arrayidx19.us = getelementptr inbounds double* %scratch, i64 %mul10.us
  %7 = load double* %arrayidx19.us, align 8, !tbaa !4
  %add20.us = fadd double %add16.us, %7
  %arrayidx24.us = getelementptr inbounds double* %scratch, i64 %add1464.us
  %8 = load double* %arrayidx24.us, align 8, !tbaa !4
  %add25.us = fadd double %add20.us, %8
  %arrayidx28.us = getelementptr inbounds double* %u, i64 %mul10.us
  %9 = load double* %arrayidx28.us, align 8, !tbaa !4
  %add29.us = fadd double %add25.us, %9
  %arrayidx33.us = getelementptr inbounds double* %u, i64 %add1464.us
  %10 = load double* %arrayidx33.us, align 8, !tbaa !4
  %add34.us = fadd double %add29.us, %10
  %add35.us = fadd double %tot.267.us, %add34.us
  %inc37.us = add nsw i64 %i.066.us, 1
  %exitcond78 = icmp eq i64 %inc37.us, %0
  %add9.us_dup = add nsw i64 %i.066.us_dup, %mul5.us_dup
  %mul10.us_dup = shl nsw i64 %add9.us_dup, 1
  %arrayidx11.us_dup = getelementptr inbounds double* %x_dup, i64 %mul10.us_dup
  %11 = load double* %arrayidx11.us_dup, align 8, !tbaa !4
  %add1464.us_dup = or i64 %mul10.us_dup, 1
  %arrayidx15.us_dup = getelementptr inbounds double* %x_dup, i64 %add1464.us_dup
  %12 = load double* %arrayidx15.us_dup, align 8, !tbaa !4
  %add16.us_dup = fadd double %11, %12
  %arrayidx19.us_dup = getelementptr inbounds double* %scratch_dup, i64 %mul10.us_dup
  %13 = load double* %arrayidx19.us_dup, align 8, !tbaa !4
  %add20.us_dup = fadd double %add16.us_dup, %13
  %arrayidx24.us_dup = getelementptr inbounds double* %scratch_dup, i64 %add1464.us_dup
  %14 = load double* %arrayidx24.us_dup, align 8, !tbaa !4
  %add25.us_dup = fadd double %add20.us_dup, %14
  %arrayidx28.us_dup = getelementptr inbounds double* %u_dup, i64 %mul10.us_dup
  %15 = load double* %arrayidx28.us_dup, align 8, !tbaa !4
  %add29.us_dup = fadd double %add25.us_dup, %15
  %arrayidx33.us_dup = getelementptr inbounds double* %u_dup, i64 %add1464.us_dup
  %16 = load double* %arrayidx33.us_dup, align 8, !tbaa !4
  %add34.us_dup = fadd double %add29.us_dup, %16
  %add35.us_dup = fadd double %tot.267.us_dup, %add34.us_dup
  %inc37.us_dup = add nsw i64 %i.066.us_dup, 1
  %exitcond78_dup = icmp eq i64 %inc37.us_dup, %1
  %tot.267.us_QED_CHECK_331 = fcmp oeq double %tot.267.us, %tot.267.us_dup
  %i.066.us_QED_CHECK_332 = icmp eq i64 %i.066.us, %i.066.us_dup
  %add9.us_QED_CHECK_333 = icmp eq i64 %add9.us, %add9.us_dup
  %mul10.us_QED_CHECK_334 = icmp eq i64 %mul10.us, %mul10.us_dup
  %add1464.us_QED_CHECK_335 = icmp eq i64 %add1464.us, %add1464.us_dup
  %add16.us_QED_CHECK_336 = fcmp oeq double %add16.us, %add16.us_dup
  %add20.us_QED_CHECK_337 = fcmp oeq double %add20.us, %add20.us_dup
  %add25.us_QED_CHECK_338 = fcmp oeq double %add25.us, %add25.us_dup
  %add29.us_QED_CHECK_339 = fcmp oeq double %add29.us, %add29.us_dup
  %add34.us_QED_CHECK_340 = fcmp oeq double %add34.us, %add34.us_dup
  %add35.us_QED_CHECK_341 = fcmp oeq double %add35.us, %add35.us_dup
  %inc37.us_QED_CHECK_342 = icmp eq i64 %inc37.us, %inc37.us_dup
  %exitcond78_QED_CHECK_343 = icmp eq i1 %exitcond78, %exitcond78_dup
  %17 = and i1 %i.066.us_QED_CHECK_332, %add9.us_QED_CHECK_333
  %18 = and i1 %tot.267.us_QED_CHECK_331, %17
  %19 = and i1 %add1464.us_QED_CHECK_335, %add16.us_QED_CHECK_336
  %20 = and i1 %mul10.us_QED_CHECK_334, %19
  %21 = and i1 %18, %20
  %22 = and i1 %add25.us_QED_CHECK_338, %add29.us_QED_CHECK_339
  %23 = and i1 %add20.us_QED_CHECK_337, %22
  %24 = and i1 %add34.us_QED_CHECK_340, %add35.us_QED_CHECK_341
  %25 = and i1 %inc37.us_QED_CHECK_342, %exitcond78_QED_CHECK_343
  %26 = and i1 %24, %25
  %27 = and i1 %23, %26
  %for.body8.us_error = and i1 %21, %27
  call void @eddi_check_function(i1 %for.body8.us_error)
  br i1 %exitcond78, label %for.inc39.us, label %for.body8.us

for.body8.lr.ph.us:                               ; preds = %for.inc39.us, %for.body3.lr.ph
  %tot.170.us = phi double [ %add35.us, %for.inc39.us ], [ %tot.0.lcssa, %for.body3.lr.ph ]
  %j.169.us = phi i64 [ %inc40.us, %for.inc39.us ], [ %MyFirst, %for.body3.lr.ph ]
  %tot.170.us_dup = phi double [ %add35.us_dup, %for.inc39.us ], [ %tot.0.lcssa_dup, %for.body3.lr.ph ]
  %j.169.us_dup = phi i64 [ %inc40.us_dup, %for.inc39.us ], [ %MyFirst_dup, %for.body3.lr.ph ]
  %mul5.us = mul nsw i64 %add4, %j.169.us
  %mul5.us_dup = mul nsw i64 %add4_dup, %j.169.us_dup
  %tot.170.us_QED_CHECK_328 = fcmp oeq double %tot.170.us, %tot.170.us_dup
  %j.169.us_QED_CHECK_329 = icmp eq i64 %j.169.us, %j.169.us_dup
  %mul5.us_QED_CHECK_330 = icmp eq i64 %mul5.us, %mul5.us_dup
  %28 = and i1 %j.169.us_QED_CHECK_329, %mul5.us_QED_CHECK_330
  %for.body8.lr.ph.us_error = and i1 %tot.170.us_QED_CHECK_328, %28
  call void @eddi_check_function(i1 %for.body8.lr.ph.us_error)
  br label %for.body8.us

for.body:                                         ; preds = %for.body, %entry
  %tot.076 = phi double [ %add, %for.body ], [ 0.000000e+00, %entry ]
  %j.075 = phi i64 [ %inc, %for.body ], [ 0, %entry ]
  %tot.076_dup = phi double [ %add_dup, %for.body ], [ 0.000000e+00, %entry ]
  %j.075_dup = phi i64 [ %inc_dup, %for.body ], [ 0, %entry ]
  %arrayidx = getelementptr inbounds double* %upriv, i64 %j.075
  %29 = load double* %arrayidx, align 8, !tbaa !4
  %add = fadd double %tot.076, %29
  %inc = add nsw i64 %j.075, 1
  %cmp = icmp slt i64 %inc, %mul73
  %arrayidx_dup = getelementptr inbounds double* %upriv_dup, i64 %j.075_dup
  %30 = load double* %arrayidx_dup, align 8, !tbaa !4
  %add_dup = fadd double %tot.076_dup, %30
  %inc_dup = add nsw i64 %j.075_dup, 1
  %cmp_dup = icmp slt i64 %inc_dup, %mul73_dup
  %tot.076_QED_CHECK_319 = fcmp oeq double %tot.076, %tot.076_dup
  %j.075_QED_CHECK_320 = icmp eq i64 %j.075, %j.075_dup
  %add_QED_CHECK_321 = fcmp oeq double %add, %add_dup
  %inc_QED_CHECK_322 = icmp eq i64 %inc, %inc_dup
  %cmp_QED_CHECK_323 = icmp eq i1 %cmp, %cmp_dup
  %31 = and i1 %tot.076_QED_CHECK_319, %j.075_QED_CHECK_320
  %32 = and i1 %inc_QED_CHECK_322, %cmp_QED_CHECK_323
  %33 = and i1 %add_QED_CHECK_321, %32
  %for.body_error = and i1 %31, %33
  call void @eddi_check_function(i1 %for.body_error)
  br i1 %cmp, label %for.body, label %for.cond1.preheader

for.inc39:                                        ; preds = %for.inc39, %for.body3.lr.ph
  %j.169 = phi i64 [ %inc40, %for.inc39 ], [ %MyFirst, %for.body3.lr.ph ]
  %j.169_dup = phi i64 [ %inc40_dup, %for.inc39 ], [ %MyFirst_dup, %for.body3.lr.ph ]
  %inc40 = add nsw i64 %j.169, 1
  %exitcond = icmp eq i64 %inc40, %MyLast
  %inc40_dup = add nsw i64 %j.169_dup, 1
  %exitcond_dup = icmp eq i64 %inc40_dup, %MyLast_dup
  %j.169_QED_CHECK_346 = icmp eq i64 %j.169, %j.169_dup
  %inc40_QED_CHECK_347 = icmp eq i64 %inc40, %inc40_dup
  %exitcond_QED_CHECK_348 = icmp eq i1 %exitcond, %exitcond_dup
  %34 = and i1 %inc40_QED_CHECK_347, %exitcond_QED_CHECK_348
  %for.inc39_error = and i1 %j.169_QED_CHECK_346, %34
  call void @eddi_check_function(i1 %for.inc39_error)
  br i1 %exitcond, label %for.end41, label %for.inc39

for.end41:                                        ; preds = %for.inc39, %for.inc39.us, %for.cond1.preheader
  %tot.1.lcssa = phi double [ %tot.0.lcssa, %for.cond1.preheader ], [ %add35.us, %for.inc39.us ], [ %tot.0.lcssa, %for.inc39 ]
  %tot.1.lcssa_dup = phi double [ %tot.0.lcssa_dup, %for.cond1.preheader ], [ %add35.us_dup, %for.inc39.us ], [ %tot.0.lcssa_dup, %for.inc39 ]
  %tot.1.lcssa_QED_CHECK_349 = fcmp oeq double %tot.1.lcssa, %tot.1.lcssa_dup
  call void @eddi_check_function(i1 %tot.1.lcssa_QED_CHECK_349)
  %35 = alloca <{ double, double }>
  %36 = load <{ double, double }>* %35
  %37 = insertvalue <{ double, double }> %36, double %tot.1.lcssa, 0
  %38 = insertvalue <{ double, double }> %37, double %tot.1.lcssa_dup, 1
  ret <{ double, double }> %38
}

define void @FFT1D(i64 %direction, i64 %direction_dup, i64 %M, i64 %M_dup, i64 %N, i64 %N_dup, double* %x, double* %x_dup, double* %scratch, double* %scratch_dup, double* %upriv, double* %upriv_dup, double* %umain2, double* %umain2_dup, i64 %MyNum, i64 %MyNum_dup, i64* %l_transtime, i64* %l_transtime_dup, i64 %MyFirst, i64 %MyFirst_dup, i64 %MyLast, i64 %MyLast_dup, i64 %pad_length, i64 %pad_length_dup, i64 %test_result, i64 %test_result_dup, i64 %dostats, i64 %dostats_dup) {
entry:
  %div = sdiv i64 %M, 2
  %sh_prom = trunc i64 %div to i32
  %shl = shl i32 1, %sh_prom
  %conv = sext i32 %shl to i64
  %div_dup = sdiv i64 %M_dup, 2
  %sh_prom_dup = trunc i64 %div_dup to i32
  %shl_dup = shl i32 1, %sh_prom_dup
  %conv_dup = sext i32 %shl_dup to i64
  call void @Transpose(i64 %conv, i64 %conv_dup, double* %x, double* %x_dup, double* %scratch, double* %scratch_dup, i64 %MyNum, i64 %MyNum_dup, i64 %MyFirst, i64 %MyFirst_dup, i64 %MyLast, i64 %MyLast_dup, i64 %pad_length, i64 %pad_length_dup)
  %cmp124 = icmp slt i64 %MyFirst, %MyLast
  %cmp124_dup = icmp slt i64 %MyFirst_dup, %MyLast_dup
  %div_QED_CHECK_350 = icmp eq i64 %div, %div_dup
  %sh_prom_QED_CHECK_351 = icmp eq i32 %sh_prom, %sh_prom_dup
  %shl_QED_CHECK_352 = icmp eq i32 %shl, %shl_dup
  %conv_QED_CHECK_353 = icmp eq i64 %conv, %conv_dup
  %cmp124_QED_CHECK_354 = icmp eq i1 %cmp124, %cmp124_dup
  %0 = and i1 %div_QED_CHECK_350, %sh_prom_QED_CHECK_351
  %1 = and i1 %conv_QED_CHECK_353, %cmp124_QED_CHECK_354
  %2 = and i1 %shl_QED_CHECK_352, %1
  %entry_error = and i1 %0, %2
  call void @eddi_check_function(i1 %entry_error)
  br i1 %cmp124, label %for.body.lr.ph, label %for.end.thread

for.end.thread:                                   ; preds = %entry
  call void @Transpose(i64 %conv, i64 %conv_dup, double* %scratch, double* %scratch_dup, double* %x, double* %x_dup, i64 %MyNum, i64 %MyNum_dup, i64 %MyFirst, i64 %MyFirst_dup, i64 %MyLast, i64 %MyLast_dup, i64 %pad_length, i64 %pad_length_dup)
  br label %for.end23

for.body.lr.ph:                                   ; preds = %entry
  %add = add nsw i64 %conv, %pad_length
  %cmp46.i = icmp eq i32 %sh_prom, 31
  %conv.i = sitofp i64 %direction to double
  %add_dup = add nsw i64 %conv_dup, %pad_length_dup
  %cmp46.i_dup = icmp eq i32 %sh_prom_dup, 31
  %conv.i_dup = sitofp i64 %direction_dup to double
  %add_QED_CHECK_355 = icmp eq i64 %add, %add_dup
  %cmp46.i_QED_CHECK_356 = icmp eq i1 %cmp46.i, %cmp46.i_dup
  %conv.i_QED_CHECK_357 = fcmp oeq double %conv.i, %conv.i_dup
  %3 = and i1 %cmp46.i_QED_CHECK_356, %conv.i_QED_CHECK_357
  %for.body.lr.ph_error = and i1 %add_QED_CHECK_355, %3
  call void @eddi_check_function(i1 %for.body.lr.ph_error)
  br label %for.body

for.body:                                         ; preds = %TwiddleOneCol.exit, %for.body.lr.ph
  %j.0125 = phi i64 [ %MyFirst, %for.body.lr.ph ], [ %inc, %TwiddleOneCol.exit ]
  %j.0125_dup = phi i64 [ %MyFirst_dup, %for.body.lr.ph ], [ %inc_dup, %TwiddleOneCol.exit ]
  %mul = shl nsw i64 %j.0125, 1
  %mul2 = mul nsw i64 %mul, %add
  %arrayidx = getelementptr inbounds double* %scratch, i64 %mul2
  %mul_dup = shl nsw i64 %j.0125_dup, 1
  %mul2_dup = mul nsw i64 %mul_dup, %add_dup
  %arrayidx_dup = getelementptr inbounds double* %scratch_dup, i64 %mul2_dup
  call void @FFT1DOnce(i64 %direction, i64 %direction_dup, i64 %div, i64 %div_dup, i64 %conv, i64 %conv_dup, double* %upriv, double* %upriv_dup, double* %arrayidx, double* %arrayidx_dup)
  %j.0125_QED_CHECK_358 = icmp eq i64 %j.0125, %j.0125_dup
  %mul_QED_CHECK_359 = icmp eq i64 %mul, %mul_dup
  %mul2_QED_CHECK_360 = icmp eq i64 %mul2, %mul2_dup
  %4 = and i1 %mul_QED_CHECK_359, %mul2_QED_CHECK_360
  %for.body_error = and i1 %j.0125_QED_CHECK_358, %4
  call void @eddi_check_function(i1 %for.body_error)
  br i1 %cmp46.i, label %TwiddleOneCol.exit, label %for.body.lr.ph.i

for.body.lr.ph.i:                                 ; preds = %for.body
  %mul.i = mul nsw i64 %j.0125, %add
  %mul.i_dup = mul nsw i64 %j.0125_dup, %add_dup
  %mul.i_QED_CHECK_382 = icmp eq i64 %mul.i, %mul.i_dup
  call void @eddi_check_function(i1 %mul.i_QED_CHECK_382)
  br label %for.body.i

for.body.i:                                       ; preds = %for.body.i, %for.body.lr.ph.i
  %i.047.i = phi i64 [ 0, %for.body.lr.ph.i ], [ %inc.i, %for.body.i ]
  %i.047.i_dup = phi i64 [ 0, %for.body.lr.ph.i ], [ %inc.i_dup, %for.body.i ]
  %add1.i = add nsw i64 %i.047.i, %mul.i
  %mul2.i = shl nsw i64 %add1.i, 1
  %arrayidx.i = getelementptr inbounds double* %umain2, i64 %mul2.i
  %5 = load double* %arrayidx.i, align 8, !tbaa !4
  %add744.i = or i64 %mul2.i, 1
  %arrayidx8.i = getelementptr inbounds double* %umain2, i64 %add744.i
  %6 = load double* %arrayidx8.i, align 8, !tbaa !4
  %mul9.i = fmul double %conv.i, %6
  %mul10.i = shl nsw i64 %i.047.i, 1
  %arrayidx.sum = add i64 %mul10.i, %mul2
  %arrayidx11.i = getelementptr inbounds double* %scratch, i64 %arrayidx.sum
  %7 = load double* %arrayidx11.i, align 8, !tbaa !4
  %add1345.i = or i64 %mul10.i, 1
  %arrayidx.sum119 = add i64 %add1345.i, %mul2
  %arrayidx14.i = getelementptr inbounds double* %scratch, i64 %arrayidx.sum119
  %8 = load double* %arrayidx14.i, align 8, !tbaa !4
  %mul15.i = fmul double %5, %7
  %mul16.i = fmul double %mul9.i, %8
  %sub.i = fsub double %mul15.i, %mul16.i
  store double %sub.i, double* %arrayidx11.i, align 8, !tbaa !4
  %mul19.i = fmul double %5, %8
  %mul20.i = fmul double %mul9.i, %7
  %add21.i = fadd double %mul20.i, %mul19.i
  store double %add21.i, double* %arrayidx14.i, align 8, !tbaa !4
  %inc.i = add nsw i64 %i.047.i, 1
  %exitcond.i = icmp eq i64 %inc.i, %conv
  %add1.i_dup = add nsw i64 %i.047.i_dup, %mul.i_dup
  %mul2.i_dup = shl nsw i64 %add1.i_dup, 1
  %arrayidx.i_dup = getelementptr inbounds double* %umain2_dup, i64 %mul2.i_dup
  %9 = load double* %arrayidx.i_dup, align 8, !tbaa !4
  %add744.i_dup = or i64 %mul2.i_dup, 1
  %arrayidx8.i_dup = getelementptr inbounds double* %umain2_dup, i64 %add744.i_dup
  %10 = load double* %arrayidx8.i_dup, align 8, !tbaa !4
  %mul9.i_dup = fmul double %conv.i_dup, %10
  %mul10.i_dup = shl nsw i64 %i.047.i_dup, 1
  %arrayidx.sum_dup = add i64 %mul10.i_dup, %mul2_dup
  %arrayidx11.i_dup = getelementptr inbounds double* %scratch_dup, i64 %arrayidx.sum_dup
  %11 = load double* %arrayidx11.i_dup, align 8, !tbaa !4
  %add1345.i_dup = or i64 %mul10.i_dup, 1
  %arrayidx.sum119_dup = add i64 %add1345.i_dup, %mul2_dup
  %arrayidx14.i_dup = getelementptr inbounds double* %scratch_dup, i64 %arrayidx.sum119_dup
  %12 = load double* %arrayidx14.i_dup, align 8, !tbaa !4
  %mul15.i_dup = fmul double %9, %11
  %mul16.i_dup = fmul double %mul9.i_dup, %12
  %sub.i_dup = fsub double %mul15.i_dup, %mul16.i_dup
  store double %sub.i_dup, double* %arrayidx11.i_dup, align 8, !tbaa !4
  %mul19.i_dup = fmul double %9, %12
  %mul20.i_dup = fmul double %mul9.i_dup, %11
  %add21.i_dup = fadd double %mul20.i_dup, %mul19.i_dup
  store double %add21.i_dup, double* %arrayidx14.i_dup, align 8, !tbaa !4
  %inc.i_dup = add nsw i64 %i.047.i_dup, 1
  %exitcond.i_dup = icmp eq i64 %inc.i_dup, %conv_dup
  %i.047.i_QED_CHECK_383 = icmp eq i64 %i.047.i, %i.047.i_dup
  %add1.i_QED_CHECK_384 = icmp eq i64 %add1.i, %add1.i_dup
  %mul2.i_QED_CHECK_385 = icmp eq i64 %mul2.i, %mul2.i_dup
  %add744.i_QED_CHECK_386 = icmp eq i64 %add744.i, %add744.i_dup
  %mul9.imul9.i = fcmp oeq double %mul9.i, %mul9.i_dup
  %mul10.i_QED_CHECK_388 = icmp eq i64 %mul10.i, %mul10.i_dup
  %arrayidx.sum_QED_CHECK_389 = icmp eq i64 %arrayidx.sum, %arrayidx.sum_dup
  %add1345.i_QED_CHECK_390 = icmp eq i64 %add1345.i, %add1345.i_dup
  %arrayidx.sum119_QED_CHECK_391 = icmp eq i64 %arrayidx.sum119, %arrayidx.sum119_dup
  %mul15.i_QED_CHECK_392 = fcmp oeq double %mul15.i, %mul15.i_dup
  %mul16.i_QED_CHECK_393 = fcmp oeq double %mul16.i, %mul16.i_dup
  %sub.i_QED_CHECK_394 = fcmp oeq double %sub.i, %sub.i_dup
  %mul19.i_QED_CHECK_395 = fcmp oeq double %mul19.i, %mul19.i_dup
  %mul20.i_QED_CHECK_396 = fcmp oeq double %mul20.i, %mul20.i_dup
  %add21.i_QED_CHECK_397 = fcmp oeq double %add21.i, %add21.i_dup
  %inc.i_QED_CHECK_398 = icmp eq i64 %inc.i, %inc.i_dup
  %exitcond.i_QED_CHECK_399 = icmp eq i1 %exitcond.i, %exitcond.i_dup
  %13 = and i1 %i.047.i_QED_CHECK_383, %add1.i_QED_CHECK_384
  %14 = and i1 %mul2.i_QED_CHECK_385, %add744.i_QED_CHECK_386
  %15 = and i1 %13, %14
  %16 = and i1 %mul9.imul9.i, %mul10.i_QED_CHECK_388
  %17 = and i1 %arrayidx.sum_QED_CHECK_389, %add1345.i_QED_CHECK_390
  %18 = and i1 %16, %17
  %19 = and i1 %15, %18
  %20 = and i1 %arrayidx.sum119_QED_CHECK_391, %mul15.i_QED_CHECK_392
  %21 = and i1 %mul16.i_QED_CHECK_393, %sub.i_QED_CHECK_394
  %22 = and i1 %20, %21
  %23 = and i1 %mul19.i_QED_CHECK_395, %mul20.i_QED_CHECK_396
  %24 = and i1 %inc.i_QED_CHECK_398, %exitcond.i_QED_CHECK_399
  %25 = and i1 %add21.i_QED_CHECK_397, %24
  %26 = and i1 %23, %25
  %27 = and i1 %22, %26
  %for.body.i_error = and i1 %19, %27
  call void @eddi_check_function(i1 %for.body.i_error)
  br i1 %exitcond.i, label %TwiddleOneCol.exit, label %for.body.i

TwiddleOneCol.exit:                               ; preds = %for.body.i, %for.body
  %inc = add nsw i64 %j.0125, 1
  %exitcond127 = icmp eq i64 %inc, %MyLast
  %inc_dup = add nsw i64 %j.0125_dup, 1
  %exitcond127_dup = icmp eq i64 %inc_dup, %MyLast_dup
  %inc_QED_CHECK_361 = icmp eq i64 %inc, %inc_dup
  %"exitcond127\00\00\00\00\00\00\00\90\03\00_362" = icmp eq i1 %exitcond127, %exitcond127_dup
  %TwiddleOneCol.exit_error = and i1 %inc_QED_CHECK_361, %"exitcond127\00\00\00\00\00\00\00\90\03\00_362"
  call void @eddi_check_function(i1 %TwiddleOneCol.exit_error)
  br i1 %exitcond127, label %for.end, label %for.body

for.end:                                          ; preds = %TwiddleOneCol.exit
  call void @Transpose(i64 %conv, i64 %conv_dup, double* %scratch, double* %scratch_dup, double* %x, double* %x_dup, i64 %MyNum, i64 %MyNum_dup, i64 %MyFirst, i64 %MyFirst_dup, i64 %MyLast, i64 %MyLast_dup, i64 %pad_length, i64 %pad_length_dup)
  br i1 %cmp124, label %for.body10.lr.ph, label %for.end23

for.body10.lr.ph:                                 ; preds = %for.end
  %add12 = add nsw i64 %conv, %pad_length
  %cmp15 = icmp eq i64 %direction, -1
  %cmp11.i = icmp ne i32 %sh_prom, 31
  %or.cond = and i1 %cmp15, %cmp11.i
  %conv.i109 = sitofp i64 %N to double
  %add12_dup = add nsw i64 %conv_dup, %pad_length_dup
  %cmp15_dup = icmp eq i64 %direction_dup, -1
  %cmp11.i_dup = icmp ne i32 %sh_prom_dup, 31
  %or.cond_dup = and i1 %cmp15_dup, %cmp11.i_dup
  %conv.i109_dup = sitofp i64 %N_dup to double
  %add12_QED_CHECK_363 = icmp eq i64 %add12, %add12_dup
  %cmp15_QED_CHECK_364 = icmp eq i1 %cmp15, %cmp15_dup
  %cmp11.i_QED_CHECK_365 = icmp eq i1 %cmp11.i, %cmp11.i_dup
  %or.cond_QED_CHECK_366 = icmp eq i1 %or.cond, %or.cond_dup
  %"conv.i109\00\00\00\00\00\00\00\907\00_367" = fcmp oeq double %conv.i109, %conv.i109_dup
  %28 = and i1 %add12_QED_CHECK_363, %cmp15_QED_CHECK_364
  %29 = and i1 %or.cond_QED_CHECK_366, %"conv.i109\00\00\00\00\00\00\00\907\00_367"
  %30 = and i1 %cmp11.i_QED_CHECK_365, %29
  %for.body10.lr.ph_error = and i1 %28, %30
  call void @eddi_check_function(i1 %for.body10.lr.ph_error)
  br label %for.body10

for.body10:                                       ; preds = %for.inc21, %for.body10.lr.ph
  %j.1123 = phi i64 [ %MyFirst, %for.body10.lr.ph ], [ %inc22, %for.inc21 ]
  %j.1123_dup = phi i64 [ %MyFirst_dup, %for.body10.lr.ph ], [ %inc22_dup, %for.inc21 ]
  %mul11 = shl nsw i64 %j.1123, 1
  %mul13 = mul nsw i64 %mul11, %add12
  %arrayidx14 = getelementptr inbounds double* %x, i64 %mul13
  %mul11_dup = shl nsw i64 %j.1123_dup, 1
  %mul13_dup = mul nsw i64 %mul11_dup, %add12_dup
  %arrayidx14_dup = getelementptr inbounds double* %x_dup, i64 %mul13_dup
  call void @FFT1DOnce(i64 %direction, i64 %direction_dup, i64 %div, i64 %div_dup, i64 %conv, i64 %conv_dup, double* %upriv, double* %upriv_dup, double* %arrayidx14, double* %arrayidx14_dup)
  %j.1123_QED_CHECK_368 = icmp eq i64 %j.1123, %j.1123_dup
  %mul11_QED_CHECK_369 = icmp eq i64 %mul11, %mul11_dup
  %mul13_QED_CHECK_370 = icmp eq i64 %mul13, %mul13_dup
  %31 = and i1 %mul11_QED_CHECK_369, %mul13_QED_CHECK_370
  %for.body10_error = and i1 %j.1123_QED_CHECK_368, %31
  call void @eddi_check_function(i1 %for.body10_error)
  br i1 %or.cond, label %for.body.i115, label %for.inc21

for.body.i115:                                    ; preds = %for.body.i115, %for.body10
  %i.012.i = phi i64 [ %inc.i113, %for.body.i115 ], [ 0, %for.body10 ]
  %i.012.i_dup = phi i64 [ %inc.i113_dup, %for.body.i115 ], [ 0, %for.body10 ]
  %mul.i111 = shl nsw i64 %i.012.i, 1
  %arrayidx14.sum = add i64 %mul.i111, %mul13
  %arrayidx.i112 = getelementptr inbounds double* %x, i64 %arrayidx14.sum
  %32 = load double* %arrayidx.i112, align 8, !tbaa !4
  %div.i = fdiv double %32, %conv.i109
  store double %div.i, double* %arrayidx.i112, align 8, !tbaa !4
  %add10.i = or i64 %mul.i111, 1
  %arrayidx14.sum118 = add i64 %add10.i, %mul13
  %arrayidx3.i = getelementptr inbounds double* %x, i64 %arrayidx14.sum118
  %33 = load double* %arrayidx3.i, align 8, !tbaa !4
  %div4.i = fdiv double %33, %conv.i109
  store double %div4.i, double* %arrayidx3.i, align 8, !tbaa !4
  %inc.i113 = add nsw i64 %i.012.i, 1
  %exitcond.i114 = icmp eq i64 %inc.i113, %conv
  %mul.i111_dup = shl nsw i64 %i.012.i_dup, 1
  %arrayidx14.sum_dup = add i64 %mul.i111_dup, %mul13_dup
  %arrayidx.i112_dup = getelementptr inbounds double* %x_dup, i64 %arrayidx14.sum_dup
  %34 = load double* %arrayidx.i112_dup, align 8, !tbaa !4
  %div.i_dup = fdiv double %34, %conv.i109_dup
  store double %div.i_dup, double* %arrayidx.i112_dup, align 8, !tbaa !4
  %add10.i_dup = or i64 %mul.i111_dup, 1
  %arrayidx14.sum118_dup = add i64 %add10.i_dup, %mul13_dup
  %arrayidx3.i_dup = getelementptr inbounds double* %x_dup, i64 %arrayidx14.sum118_dup
  %35 = load double* %arrayidx3.i_dup, align 8, !tbaa !4
  %div4.i_dup = fdiv double %35, %conv.i109_dup
  store double %div4.i_dup, double* %arrayidx3.i_dup, align 8, !tbaa !4
  %inc.i113_dup = add nsw i64 %i.012.i_dup, 1
  %exitcond.i114_dup = icmp eq i64 %inc.i113_dup, %conv_dup
  %i.012.i_QED_CHECK_371 = icmp eq i64 %i.012.i, %i.012.i_dup
  %mul.i111_QED_CHECK_372 = icmp eq i64 %mul.i111, %mul.i111_dup
  %arrayidx14.sum_QED_CHECK_373 = icmp eq i64 %arrayidx14.sum, %arrayidx14.sum_dup
  %div.i_QED_CHECK_374 = fcmp oeq double %div.i, %div.i_dup
  %add10.i_QED_CHECK_375 = icmp eq i64 %add10.i, %add10.i_dup
  %arrayidx14.sum118_QED_CHECK_376 = icmp eq i64 %arrayidx14.sum118, %arrayidx14.sum118_dup
  %div4.i_QED_CHECK_377 = fcmp oeq double %div4.i, %div4.i_dup
  %inc.i113_QED_CHECK_378 = icmp eq i64 %inc.i113, %inc.i113_dup
  %exitcond.i114_QED_CHECK_379 = icmp eq i1 %exitcond.i114, %exitcond.i114_dup
  %36 = and i1 %i.012.i_QED_CHECK_371, %mul.i111_QED_CHECK_372
  %37 = and i1 %arrayidx14.sum_QED_CHECK_373, %div.i_QED_CHECK_374
  %38 = and i1 %36, %37
  %39 = and i1 %add10.i_QED_CHECK_375, %arrayidx14.sum118_QED_CHECK_376
  %40 = and i1 %inc.i113_QED_CHECK_378, %exitcond.i114_QED_CHECK_379
  %41 = and i1 %div4.i_QED_CHECK_377, %40
  %42 = and i1 %39, %41
  %for.body.i115_error = and i1 %38, %42
  call void @eddi_check_function(i1 %for.body.i115_error)
  br i1 %exitcond.i114, label %for.inc21, label %for.body.i115

for.inc21:                                        ; preds = %for.body.i115, %for.body10
  %inc22 = add nsw i64 %j.1123, 1
  %exitcond126 = icmp eq i64 %inc22, %MyLast
  %inc22_dup = add nsw i64 %j.1123_dup, 1
  %exitcond126_dup = icmp eq i64 %inc22_dup, %MyLast_dup
  %inc22_QED_CHECK_380 = icmp eq i64 %inc22, %inc22_dup
  %exitcond126_QED_CHECK_381 = icmp eq i1 %exitcond126, %exitcond126_dup
  %for.inc21_error = and i1 %inc22_QED_CHECK_380, %exitcond126_QED_CHECK_381
  call void @eddi_check_function(i1 %for.inc21_error)
  br i1 %exitcond126, label %for.end23, label %for.body10

for.end23:                                        ; preds = %for.inc21, %for.end, %for.end.thread
  call void @Transpose(i64 %conv, i64 %conv_dup, double* %x, double* %x_dup, double* %scratch, double* %scratch_dup, i64 %MyNum, i64 %MyNum_dup, i64 %MyFirst, i64 %MyFirst_dup, i64 %MyLast, i64 %MyLast_dup, i64 %pad_length, i64 %pad_length_dup)
  %43 = load i64* @doprint, align 8, !tbaa !0
  %44 = or i64 %43, %test_result
  %45 = icmp eq i64 %44, 0
  %cmp124.not = xor i1 %cmp124, true
  %brmerge = or i1 %45, %cmp124.not
  %46 = load i64* @doprint_dup, align 8, !tbaa !0
  %47 = or i64 %46, %test_result_dup
  %48 = icmp eq i64 %47, 0
  %cmp124.not_dup = xor i1 %cmp124_dup, true
  %brmerge_dup = or i1 %48, %cmp124.not_dup
  %_QED_CHECK_400 = icmp eq i64 %44, %47
  %_QED_CHECK_401 = icmp eq i1 %45, %48
  %cmp124.not_QED_CHECK_402 = icmp eq i1 %cmp124.not, %cmp124.not_dup
  %brmerge_QED_CHECK_403 = icmp eq i1 %brmerge, %brmerge_dup
  %49 = and i1 %_QED_CHECK_400, %_QED_CHECK_401
  %50 = and i1 %cmp124.not_QED_CHECK_402, %brmerge_QED_CHECK_403
  %for.end23_error = and i1 %49, %50
  call void @eddi_check_function(i1 %for.end23_error)
  br i1 %brmerge, label %if.end41, label %for.body29.lr.ph

for.body29.lr.ph:                                 ; preds = %for.end23
  %add31 = add nsw i64 %conv, %pad_length
  %cmp16.i = icmp eq i32 %sh_prom, 31
  %add31_dup = add nsw i64 %conv_dup, %pad_length_dup
  %cmp16.i_dup = icmp eq i32 %sh_prom_dup, 31
  %add31_QED_CHECK_404 = icmp eq i64 %add31, %add31_dup
  %cmp16.i_QED_CHECK_405 = icmp eq i1 %cmp16.i, %cmp16.i_dup
  %for.body29.lr.ph_error = and i1 %add31_QED_CHECK_404, %cmp16.i_QED_CHECK_405
  call void @eddi_check_function(i1 %for.body29.lr.ph_error)
  br label %for.body29

for.body29:                                       ; preds = %CopyColumn.exit, %for.body29.lr.ph
  %j.2121 = phi i64 [ %MyFirst, %for.body29.lr.ph ], [ %inc39, %CopyColumn.exit ]
  %j.2121_dup = phi i64 [ %MyFirst_dup, %for.body29.lr.ph ], [ %inc39_dup, %CopyColumn.exit ]
  %mul30 = shl nsw i64 %j.2121, 1
  %mul32 = mul nsw i64 %mul30, %add31
  %mul30_dup = shl nsw i64 %j.2121_dup, 1
  %mul32_dup = mul nsw i64 %mul30_dup, %add31_dup
  %j.2121_QED_CHECK_406 = icmp eq i64 %j.2121, %j.2121_dup
  %mul30_QED_CHECK_407 = icmp eq i64 %mul30, %mul30_dup
  %mul32_QED_CHECK_408 = icmp eq i64 %mul32, %mul32_dup
  %51 = and i1 %mul30_QED_CHECK_407, %mul32_QED_CHECK_408
  %for.body29_error = and i1 %j.2121_QED_CHECK_406, %51
  call void @eddi_check_function(i1 %for.body29_error)
  br i1 %cmp16.i, label %CopyColumn.exit, label %for.body.i108

for.body.i108:                                    ; preds = %for.body.i108, %for.body29
  %i.017.i = phi i64 [ %inc.i106, %for.body.i108 ], [ 0, %for.body29 ]
  %i.017.i_dup = phi i64 [ %inc.i106_dup, %for.body.i108 ], [ 0, %for.body29 ]
  %mul.i104 = shl nsw i64 %i.017.i, 1
  %arrayidx33.sum = add i64 %mul.i104, %mul32
  %arrayidx.i105 = getelementptr inbounds double* %scratch, i64 %arrayidx33.sum
  %52 = load double* %arrayidx.i105, align 8, !tbaa !4
  %arrayidx2.i = getelementptr inbounds double* %x, i64 %arrayidx33.sum
  store double %52, double* %arrayidx2.i, align 8, !tbaa !4
  %add15.i = or i64 %mul.i104, 1
  %arrayidx33.sum116 = add i64 %add15.i, %mul32
  %arrayidx4.i = getelementptr inbounds double* %scratch, i64 %arrayidx33.sum116
  %53 = load double* %arrayidx4.i, align 8, !tbaa !4
  %arrayidx7.i = getelementptr inbounds double* %x, i64 %arrayidx33.sum116
  store double %53, double* %arrayidx7.i, align 8, !tbaa !4
  %inc.i106 = add nsw i64 %i.017.i, 1
  %exitcond.i107 = icmp eq i64 %inc.i106, %conv
  %mul.i104_dup = shl nsw i64 %i.017.i_dup, 1
  %arrayidx33.sum_dup = add i64 %mul.i104_dup, %mul32_dup
  %arrayidx.i105_dup = getelementptr inbounds double* %scratch_dup, i64 %arrayidx33.sum_dup
  %54 = load double* %arrayidx.i105_dup, align 8, !tbaa !4
  %arrayidx2.i_dup = getelementptr inbounds double* %x_dup, i64 %arrayidx33.sum_dup
  store double %54, double* %arrayidx2.i_dup, align 8, !tbaa !4
  %add15.i_dup = or i64 %mul.i104_dup, 1
  %arrayidx33.sum116_dup = add i64 %add15.i_dup, %mul32_dup
  %arrayidx4.i_dup = getelementptr inbounds double* %scratch_dup, i64 %arrayidx33.sum116_dup
  %55 = load double* %arrayidx4.i_dup, align 8, !tbaa !4
  %arrayidx7.i_dup = getelementptr inbounds double* %x_dup, i64 %arrayidx33.sum116_dup
  store double %55, double* %arrayidx7.i_dup, align 8, !tbaa !4
  %inc.i106_dup = add nsw i64 %i.017.i_dup, 1
  %exitcond.i107_dup = icmp eq i64 %inc.i106_dup, %conv_dup
  %i.017.i_QED_CHECK_411 = icmp eq i64 %i.017.i, %i.017.i_dup
  %"mul.i104\00\00\00\00\00\00\00\90*\00_412" = icmp eq i64 %mul.i104, %mul.i104_dup
  %arrayidx33.sum_QED_CHECK_413 = icmp eq i64 %arrayidx33.sum, %arrayidx33.sum_dup
  %add15.iadd15.i = icmp eq i64 %add15.i, %add15.i_dup
  %arrayidx33.sum116_QED_CHECK_415 = icmp eq i64 %arrayidx33.sum116, %arrayidx33.sum116_dup
  %inc.i106_QED_CHECK_416 = icmp eq i64 %inc.i106, %inc.i106_dup
  %exitcond.i107_QED_CHECK_417 = icmp eq i1 %exitcond.i107, %exitcond.i107_dup
  %56 = and i1 %"mul.i104\00\00\00\00\00\00\00\90*\00_412", %arrayidx33.sum_QED_CHECK_413
  %57 = and i1 %i.017.i_QED_CHECK_411, %56
  %58 = and i1 %add15.iadd15.i, %arrayidx33.sum116_QED_CHECK_415
  %59 = and i1 %inc.i106_QED_CHECK_416, %exitcond.i107_QED_CHECK_417
  %60 = and i1 %58, %59
  %for.body.i108_error = and i1 %57, %60
  call void @eddi_check_function(i1 %for.body.i108_error)
  br i1 %exitcond.i107, label %CopyColumn.exit, label %for.body.i108

CopyColumn.exit:                                  ; preds = %for.body.i108, %for.body29
  %inc39 = add nsw i64 %j.2121, 1
  %exitcond = icmp eq i64 %inc39, %MyLast
  %inc39_dup = add nsw i64 %j.2121_dup, 1
  %exitcond_dup = icmp eq i64 %inc39_dup, %MyLast_dup
  %inc39_QED_CHECK_409 = icmp eq i64 %inc39, %inc39_dup
  %exitcond_QED_CHECK_410 = icmp eq i1 %exitcond, %exitcond_dup
  %CopyColumn.exit_error = and i1 %inc39_QED_CHECK_409, %exitcond_QED_CHECK_410
  call void @eddi_check_function(i1 %CopyColumn.exit_error)
  br i1 %exitcond, label %if.end41, label %for.body29

if.end41:                                         ; preds = %CopyColumn.exit, %for.end23
  ret void
}

declare void @srand48(i64) #0

declare double @drand48() #0

; Function Attrs: nounwind readnone
declare double @cos(double) #4

; Function Attrs: nounwind readnone
declare double @sin(double) #4

define <{ i64, i64 }> @BitReverse(i64 %M, i64 %M_dup, i64 %k, i64 %k_dup) {
entry:
  %cmp3 = icmp sgt i64 %M, 0
  %cmp3_dup = icmp sgt i64 %M_dup, 0
  %cmp3_QED_CHECK_418 = icmp eq i1 %cmp3, %cmp3_dup
  call void @eddi_check_function(i1 %cmp3_QED_CHECK_418)
  br i1 %cmp3, label %for.body, label %for.end

for.body:                                         ; preds = %for.body, %entry
  %tmp.06 = phi i64 [ %shr, %for.body ], [ %k, %entry ]
  %j.05 = phi i64 [ %add, %for.body ], [ 0, %entry ]
  %i.04 = phi i64 [ %inc, %for.body ], [ 0, %entry ]
  %tmp.06_dup = phi i64 [ %shr_dup, %for.body ], [ %k_dup, %entry ]
  %j.05_dup = phi i64 [ %add_dup, %for.body ], [ 0, %entry ]
  %i.04_dup = phi i64 [ %inc_dup, %for.body ], [ 0, %entry ]
  %mul = shl nsw i64 %j.05, 1
  %and = and i64 %tmp.06, 1
  %add = or i64 %and, %mul
  %shr = ashr i64 %tmp.06, 1
  %inc = add nsw i64 %i.04, 1
  %exitcond = icmp eq i64 %inc, %M
  %mul_dup = shl nsw i64 %j.05_dup, 1
  %and_dup = and i64 %tmp.06_dup, 1
  %add_dup = or i64 %and_dup, %mul_dup
  %shr_dup = ashr i64 %tmp.06_dup, 1
  %inc_dup = add nsw i64 %i.04_dup, 1
  %exitcond_dup = icmp eq i64 %inc_dup, %M_dup
  %tmp.06_QED_CHECK_419 = icmp eq i64 %tmp.06, %tmp.06_dup
  %j.05_QED_CHECK_420 = icmp eq i64 %j.05, %j.05_dup
  %i.04_QED_CHECK_421 = icmp eq i64 %i.04, %i.04_dup
  %mul_QED_CHECK_422 = icmp eq i64 %mul, %mul_dup
  %and_QED_CHECK_423 = icmp eq i64 %and, %and_dup
  %add_QED_CHECK_424 = icmp eq i64 %add, %add_dup
  %shr_QED_CHECK_425 = icmp eq i64 %shr, %shr_dup
  %inc_QED_CHECK_426 = icmp eq i64 %inc, %inc_dup
  %exitcond_QED_CHECK_427 = icmp eq i1 %exitcond, %exitcond_dup
  %0 = and i1 %tmp.06_QED_CHECK_419, %j.05_QED_CHECK_420
  %1 = and i1 %i.04_QED_CHECK_421, %mul_QED_CHECK_422
  %2 = and i1 %0, %1
  %3 = and i1 %and_QED_CHECK_423, %add_QED_CHECK_424
  %4 = and i1 %inc_QED_CHECK_426, %exitcond_QED_CHECK_427
  %5 = and i1 %shr_QED_CHECK_425, %4
  %6 = and i1 %3, %5
  %for.body_error = and i1 %2, %6
  call void @eddi_check_function(i1 %for.body_error)
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body, %entry
  %j.0.lcssa = phi i64 [ 0, %entry ], [ %add, %for.body ]
  %j.0.lcssa_dup = phi i64 [ 0, %entry ], [ %add_dup, %for.body ]
  %j.0.lcssa_QED_CHECK_428 = icmp eq i64 %j.0.lcssa, %j.0.lcssa_dup
  call void @eddi_check_function(i1 %j.0.lcssa_QED_CHECK_428)
  %7 = alloca <{ i64, i64 }>
  %8 = load <{ i64, i64 }>* %7
  %9 = insertvalue <{ i64, i64 }> %8, i64 %j.0.lcssa, 0
  %10 = insertvalue <{ i64, i64 }> %9, i64 %j.0.lcssa_dup, 1
  ret <{ i64, i64 }> %10
}

define void @Transpose(i64 %n1, i64 %n1_dup, double* %src, double* %src_dup, double* %dest, double* %dest_dup, i64 %MyNum, i64 %MyNum_dup, i64 %MyFirst, i64 %MyFirst_dup, i64 %MyLast, i64 %MyLast_dup, i64 %pad_length, i64 %pad_length_dup) {
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
  %sub_dup = sub nsw i64 %MyLast_dup, %MyFirst_dup
  %mul_dup = shl nsw i64 %sub_dup, 1
  %2 = load i64* @num_cache_lines_dup, align 8, !tbaa !0
  %div_dup = sdiv i64 %mul_dup, %2
  %mul1_dup = mul nsw i64 %div_dup, %2
  %not.cmp_dup = icmp ne i64 %mul1_dup, %mul_dup
  %inc_dup = zext i1 %not.cmp_dup to i64
  %div.inc_dup = add i64 %inc_dup, %div_dup
  %div3_dup = sdiv i64 %sub_dup, %div.inc_dup
  %3 = load i64* @P_dup, align 8, !tbaa !0
  %div4_dup = sdiv i64 %n1_dup, %3
  %add_dup = add nsw i64 %pad_length_dup, %n1_dup
  %l.0312_dup = add nsw i64 %MyNum_dup, 1
  %cmp6313_dup = icmp slt i64 %l.0312_dup, %3
  %sub_QED_CHECK_429 = icmp eq i64 %sub, %sub_dup
  %mul_QED_CHECK_430 = icmp eq i64 %mul, %mul_dup
  %div_QED_CHECK_431 = icmp eq i64 %div, %div_dup
  %mul1_QED_CHECK_432 = icmp eq i64 %mul1, %mul1_dup
  %not.cmp_QED_CHECK_433 = icmp eq i1 %not.cmp, %not.cmp_dup
  %inc_QED_CHECK_434 = icmp eq i64 %inc, %inc_dup
  %div.inc_QED_CHECK_435 = icmp eq i64 %div.inc, %div.inc_dup
  %div3div3 = icmp eq i64 %div3, %div3_dup
  %div4_QED_CHECK_437 = icmp eq i64 %div4, %div4_dup
  %add_QED_CHECK_438 = icmp eq i64 %add, %add_dup
  %l.0312l.0312 = icmp eq i64 %l.0312, %l.0312_dup
  %cmp6313_QED_CHECK_440 = icmp eq i1 %cmp6313, %cmp6313_dup
  %4 = and i1 %mul_QED_CHECK_430, %div_QED_CHECK_431
  %5 = and i1 %sub_QED_CHECK_429, %4
  %6 = and i1 %not.cmp_QED_CHECK_433, %inc_QED_CHECK_434
  %7 = and i1 %mul1_QED_CHECK_432, %6
  %8 = and i1 %5, %7
  %9 = and i1 %div3div3, %div4_QED_CHECK_437
  %10 = and i1 %div.inc_QED_CHECK_435, %9
  %11 = and i1 %l.0312l.0312, %cmp6313_QED_CHECK_440
  %12 = and i1 %add_QED_CHECK_438, %11
  %13 = and i1 %10, %12
  %entry_error = and i1 %8, %13
  call void @eddi_check_function(i1 %entry_error)
  br i1 %cmp6313, label %for.body.lr.ph, label %for.cond54.preheader

for.body.lr.ph:                                   ; preds = %entry
  %cmp9308 = icmp sgt i64 %div.inc, 0
  %cmp15302 = icmp sgt i64 %div3, 0
  %cmp9308_dup = icmp sgt i64 %div.inc_dup, 0
  %cmp15302_dup = icmp sgt i64 %div3_dup, 0
  %cmp9308_QED_CHECK_441 = icmp eq i1 %cmp9308, %cmp9308_dup
  %cmp15302_QED_CHECK_442 = icmp eq i1 %cmp15302, %cmp15302_dup
  %for.body.lr.ph_error = and i1 %cmp9308_QED_CHECK_441, %cmp15302_QED_CHECK_442
  call void @eddi_check_function(i1 %for.body.lr.ph_error)
  br label %for.body

for.cond.loopexit:                                ; preds = %for.end46, %for.body
  %l.0 = add nsw i64 %l.0314, 1
  %cmp6 = icmp slt i64 %l.0, %1
  %l.0_dup = add nsw i64 %l.0314_dup, 1
  %cmp6_dup = icmp slt i64 %l.0_dup, %3
  %l.0_QED_CHECK_471 = icmp eq i64 %l.0, %l.0_dup
  %cmp6_QED_CHECK_472 = icmp eq i1 %cmp6, %cmp6_dup
  %for.cond.loopexit_error = and i1 %l.0_QED_CHECK_471, %cmp6_QED_CHECK_472
  call void @eddi_check_function(i1 %for.cond.loopexit_error)
  br i1 %cmp6, label %for.body, label %for.cond54.preheader

for.cond54.preheader:                             ; preds = %for.cond.loopexit, %entry
  %cmp55298 = icmp sgt i64 %MyNum, 0
  %cmp55298_dup = icmp sgt i64 %MyNum_dup, 0
  %cmp55298_QED_CHECK_473 = icmp eq i1 %cmp55298, %cmp55298_dup
  call void @eddi_check_function(i1 %cmp55298_QED_CHECK_473)
  br i1 %cmp55298, label %for.body56.lr.ph, label %for.end106

for.body56.lr.ph:                                 ; preds = %for.cond54.preheader
  %cmp59294 = icmp sgt i64 %div.inc, 0
  %cmp65288 = icmp sgt i64 %div3, 0
  %cmp59294_dup = icmp sgt i64 %div.inc_dup, 0
  %cmp65288_dup = icmp sgt i64 %div3_dup, 0
  %cmp59294_QED_CHECK_474 = icmp eq i1 %cmp59294, %cmp59294_dup
  %cmp65288_QED_CHECK_475 = icmp eq i1 %cmp65288, %cmp65288_dup
  %for.body56.lr.ph_error = and i1 %cmp59294_QED_CHECK_474, %cmp65288_QED_CHECK_475
  call void @eddi_check_function(i1 %for.body56.lr.ph_error)
  br label %for.body56

for.body:                                         ; preds = %for.cond.loopexit, %for.body.lr.ph
  %l.0314 = phi i64 [ %l.0312, %for.body.lr.ph ], [ %l.0, %for.cond.loopexit ]
  %l.0314_dup = phi i64 [ %l.0312_dup, %for.body.lr.ph ], [ %l.0_dup, %for.cond.loopexit ]
  %l.0314_QED_CHECK_443 = icmp eq i64 %l.0314, %l.0314_dup
  call void @eddi_check_function(i1 %l.0314_QED_CHECK_443)
  br i1 %cmp9308, label %for.cond11.preheader.lr.ph, label %for.cond.loopexit

for.cond11.preheader.lr.ph:                       ; preds = %for.body
  %mul7 = mul nsw i64 %l.0314, %div4
  %mul7_dup = mul nsw i64 %l.0314_dup, %div4_dup
  %mul7_QED_CHECK_444 = icmp eq i64 %mul7, %mul7_dup
  call void @eddi_check_function(i1 %mul7_QED_CHECK_444)
  br label %for.cond14.preheader.lr.ph

for.cond14.preheader.lr.ph:                       ; preds = %for.end46, %for.cond11.preheader.lr.ph
  %v_off.0310 = phi i64 [ %mul7, %for.cond11.preheader.lr.ph ], [ %add47, %for.end46 ]
  %k.0309 = phi i64 [ 0, %for.cond11.preheader.lr.ph ], [ %inc49, %for.end46 ]
  %v_off.0310_dup = phi i64 [ %mul7_dup, %for.cond11.preheader.lr.ph ], [ %add47_dup, %for.end46 ]
  %k.0309_dup = phi i64 [ 0, %for.cond11.preheader.lr.ph ], [ %inc49_dup, %for.end46 ]
  %v_off.0310_QED_CHECK_445 = icmp eq i64 %v_off.0310, %v_off.0310_dup
  %k.0309_QED_CHECK_446 = icmp eq i64 %k.0309, %k.0309_dup
  %for.cond14.preheader.lr.ph_error = and i1 %v_off.0310_QED_CHECK_445, %k.0309_QED_CHECK_446
  call void @eddi_check_function(i1 %for.cond14.preheader.lr.ph_error)
  br label %for.cond14.preheader

for.cond14.preheader:                             ; preds = %for.end42, %for.cond14.preheader.lr.ph
  %h_off.0306 = phi i64 [ %MyFirst, %for.cond14.preheader.lr.ph ], [ %add43, %for.end42 ]
  %m.0305 = phi i64 [ 0, %for.cond14.preheader.lr.ph ], [ %inc45, %for.end42 ]
  %h_off.0306_dup = phi i64 [ %MyFirst_dup, %for.cond14.preheader.lr.ph ], [ %add43_dup, %for.end42 ]
  %m.0305_dup = phi i64 [ 0, %for.cond14.preheader.lr.ph ], [ %inc45_dup, %for.end42 ]
  %h_off.0306_QED_CHECK_447 = icmp eq i64 %h_off.0306, %h_off.0306_dup
  %m.0305m.0305 = icmp eq i64 %m.0305, %m.0305_dup
  %for.cond14.preheader_error = and i1 %h_off.0306_QED_CHECK_447, %m.0305m.0305
  call void @eddi_check_function(i1 %for.cond14.preheader_error)
  br i1 %cmp15302, label %for.body20.lr.ph, label %for.end42

for.body20.lr.ph:                                 ; preds = %for.inc40, %for.cond14.preheader
  %i.0303 = phi i64 [ %inc41, %for.inc40 ], [ 0, %for.cond14.preheader ]
  %i.0303_dup = phi i64 [ %inc41_dup, %for.inc40 ], [ 0, %for.cond14.preheader ]
  %add17 = add nsw i64 %i.0303, %v_off.0310
  %mul22 = mul nsw i64 %add17, %add
  %add17_dup = add nsw i64 %i.0303_dup, %v_off.0310_dup
  %mul22_dup = mul nsw i64 %add17_dup, %add_dup
  %i.0303_QED_CHECK_449 = icmp eq i64 %i.0303, %i.0303_dup
  %add17_QED_CHECK_450 = icmp eq i64 %add17, %add17_dup
  %mul22_QED_CHECK_451 = icmp eq i64 %mul22, %mul22_dup
  %14 = and i1 %add17_QED_CHECK_450, %mul22_QED_CHECK_451
  %for.body20.lr.ph_error = and i1 %i.0303_QED_CHECK_449, %14
  call void @eddi_check_function(i1 %for.body20.lr.ph_error)
  br label %for.body20

for.body20:                                       ; preds = %for.body20, %for.body20.lr.ph
  %j.0301 = phi i64 [ 0, %for.body20.lr.ph ], [ %inc39, %for.body20 ]
  %j.0301_dup = phi i64 [ 0, %for.body20.lr.ph ], [ %inc39_dup, %for.body20 ]
  %add21 = add nsw i64 %j.0301, %h_off.0306
  %add23 = add nsw i64 %add21, %mul22
  %mul24 = shl nsw i64 %add23, 1
  %arrayidx = getelementptr inbounds double* %src, i64 %mul24
  %15 = load double* %arrayidx, align 8, !tbaa !4
  %mul25 = mul nsw i64 %add21, %add
  %add26 = add nsw i64 %mul25, %add17
  %mul27 = shl nsw i64 %add26, 1
  %arrayidx28 = getelementptr inbounds double* %dest, i64 %mul27
  store double %15, double* %arrayidx28, align 8, !tbaa !4
  %add32272 = or i64 %mul24, 1
  %arrayidx33 = getelementptr inbounds double* %src, i64 %add32272
  %16 = load double* %arrayidx33, align 8, !tbaa !4
  %add37273 = or i64 %mul27, 1
  %arrayidx38 = getelementptr inbounds double* %dest, i64 %add37273
  store double %16, double* %arrayidx38, align 8, !tbaa !4
  %inc39 = add nsw i64 %j.0301, 1
  %exitcond323 = icmp eq i64 %inc39, %div3
  %add21_dup = add nsw i64 %j.0301_dup, %h_off.0306_dup
  %add23_dup = add nsw i64 %add21_dup, %mul22_dup
  %mul24_dup = shl nsw i64 %add23_dup, 1
  %arrayidx_dup = getelementptr inbounds double* %src_dup, i64 %mul24_dup
  %17 = load double* %arrayidx_dup, align 8, !tbaa !4
  %mul25_dup = mul nsw i64 %add21_dup, %add_dup
  %add26_dup = add nsw i64 %mul25_dup, %add17_dup
  %mul27_dup = shl nsw i64 %add26_dup, 1
  %arrayidx28_dup = getelementptr inbounds double* %dest_dup, i64 %mul27_dup
  store double %17, double* %arrayidx28_dup, align 8, !tbaa !4
  %add32272_dup = or i64 %mul24_dup, 1
  %arrayidx33_dup = getelementptr inbounds double* %src_dup, i64 %add32272_dup
  %18 = load double* %arrayidx33_dup, align 8, !tbaa !4
  %add37273_dup = or i64 %mul27_dup, 1
  %arrayidx38_dup = getelementptr inbounds double* %dest_dup, i64 %add37273_dup
  store double %18, double* %arrayidx38_dup, align 8, !tbaa !4
  %inc39_dup = add nsw i64 %j.0301_dup, 1
  %exitcond323_dup = icmp eq i64 %inc39_dup, %div3_dup
  %j.0301_QED_CHECK_452 = icmp eq i64 %j.0301, %j.0301_dup
  %add21_QED_CHECK_453 = icmp eq i64 %add21, %add21_dup
  %add23_QED_CHECK_454 = icmp eq i64 %add23, %add23_dup
  %mul24_QED_CHECK_455 = icmp eq i64 %mul24, %mul24_dup
  %mul25_QED_CHECK_456 = icmp eq i64 %mul25, %mul25_dup
  %add26_QED_CHECK_457 = icmp eq i64 %add26, %add26_dup
  %mul27mul27 = icmp eq i64 %mul27, %mul27_dup
  %add32272_QED_CHECK_459 = icmp eq i64 %add32272, %add32272_dup
  %add37273_QED_CHECK_460 = icmp eq i64 %add37273, %add37273_dup
  %inc39_QED_CHECK_461 = icmp eq i64 %inc39, %inc39_dup
  %exitcond323_QED_CHECK_462 = icmp eq i1 %exitcond323, %exitcond323_dup
  %19 = and i1 %j.0301_QED_CHECK_452, %add21_QED_CHECK_453
  %20 = and i1 %mul24_QED_CHECK_455, %mul25_QED_CHECK_456
  %21 = and i1 %add23_QED_CHECK_454, %20
  %22 = and i1 %19, %21
  %23 = and i1 %mul27mul27, %add32272_QED_CHECK_459
  %24 = and i1 %add26_QED_CHECK_457, %23
  %25 = and i1 %inc39_QED_CHECK_461, %exitcond323_QED_CHECK_462
  %26 = and i1 %add37273_QED_CHECK_460, %25
  %27 = and i1 %24, %26
  %for.body20_error = and i1 %22, %27
  call void @eddi_check_function(i1 %for.body20_error)
  br i1 %exitcond323, label %for.inc40, label %for.body20

for.inc40:                                        ; preds = %for.body20
  %inc41 = add nsw i64 %i.0303, 1
  %exitcond324 = icmp eq i64 %inc41, %div3
  %inc41_dup = add nsw i64 %i.0303_dup, 1
  %exitcond324_dup = icmp eq i64 %inc41_dup, %div3_dup
  %inc41_QED_CHECK_463 = icmp eq i64 %inc41, %inc41_dup
  %exitcond324_QED_CHECK_464 = icmp eq i1 %exitcond324, %exitcond324_dup
  %for.inc40_error = and i1 %inc41_QED_CHECK_463, %exitcond324_QED_CHECK_464
  call void @eddi_check_function(i1 %for.inc40_error)
  br i1 %exitcond324, label %for.end42, label %for.body20.lr.ph

for.end42:                                        ; preds = %for.inc40, %for.cond14.preheader
  %add43 = add nsw i64 %h_off.0306, %div3
  %inc45 = add nsw i64 %m.0305, 1
  %exitcond325 = icmp eq i64 %inc45, %div.inc
  %add43_dup = add nsw i64 %h_off.0306_dup, %div3_dup
  %inc45_dup = add nsw i64 %m.0305_dup, 1
  %exitcond325_dup = icmp eq i64 %inc45_dup, %div.inc_dup
  %add43_QED_CHECK_465 = icmp eq i64 %add43, %add43_dup
  %inc45inc45 = icmp eq i64 %inc45, %inc45_dup
  %exitcond325_QED_CHECK_467 = icmp eq i1 %exitcond325, %exitcond325_dup
  %28 = and i1 %inc45inc45, %exitcond325_QED_CHECK_467
  %for.end42_error = and i1 %add43_QED_CHECK_465, %28
  call void @eddi_check_function(i1 %for.end42_error)
  br i1 %exitcond325, label %for.end46, label %for.cond14.preheader

for.end46:                                        ; preds = %for.end42
  %add47 = add nsw i64 %v_off.0310, %div3
  %inc49 = add nsw i64 %k.0309, 1
  %exitcond326 = icmp eq i64 %inc49, %div.inc
  %add47_dup = add nsw i64 %v_off.0310_dup, %div3_dup
  %inc49_dup = add nsw i64 %k.0309_dup, 1
  %exitcond326_dup = icmp eq i64 %inc49_dup, %div.inc_dup
  %add47_QED_CHECK_468 = icmp eq i64 %add47, %add47_dup
  %inc49_QED_CHECK_469 = icmp eq i64 %inc49, %inc49_dup
  %exitcond326_QED_CHECK_470 = icmp eq i1 %exitcond326, %exitcond326_dup
  %29 = and i1 %inc49_QED_CHECK_469, %exitcond326_QED_CHECK_470
  %for.end46_error = and i1 %add47_QED_CHECK_468, %29
  call void @eddi_check_function(i1 %for.end46_error)
  br i1 %exitcond326, label %for.cond.loopexit, label %for.cond14.preheader.lr.ph

for.body56:                                       ; preds = %for.inc104, %for.body56.lr.ph
  %l.1299 = phi i64 [ 0, %for.body56.lr.ph ], [ %inc105, %for.inc104 ]
  %l.1299_dup = phi i64 [ 0, %for.body56.lr.ph ], [ %inc105_dup, %for.inc104 ]
  %l.1299_QED_CHECK_476 = icmp eq i64 %l.1299, %l.1299_dup
  call void @eddi_check_function(i1 %l.1299_QED_CHECK_476)
  br i1 %cmp59294, label %for.cond61.preheader.lr.ph, label %for.inc104

for.cond61.preheader.lr.ph:                       ; preds = %for.body56
  %mul57 = mul nsw i64 %l.1299, %div4
  %mul57_dup = mul nsw i64 %l.1299_dup, %div4_dup
  %mul57_QED_CHECK_477 = icmp eq i64 %mul57, %mul57_dup
  call void @eddi_check_function(i1 %mul57_QED_CHECK_477)
  br label %for.cond64.preheader.lr.ph

for.cond64.preheader.lr.ph:                       ; preds = %for.end99, %for.cond61.preheader.lr.ph
  %v_off.1296 = phi i64 [ %mul57, %for.cond61.preheader.lr.ph ], [ %add100, %for.end99 ]
  %k.1295 = phi i64 [ 0, %for.cond61.preheader.lr.ph ], [ %inc102, %for.end99 ]
  %v_off.1296_dup = phi i64 [ %mul57_dup, %for.cond61.preheader.lr.ph ], [ %add100_dup, %for.end99 ]
  %k.1295_dup = phi i64 [ 0, %for.cond61.preheader.lr.ph ], [ %inc102_dup, %for.end99 ]
  %v_off.1296_QED_CHECK_478 = icmp eq i64 %v_off.1296, %v_off.1296_dup
  %k.1295_QED_CHECK_479 = icmp eq i64 %k.1295, %k.1295_dup
  %for.cond64.preheader.lr.ph_error = and i1 %v_off.1296_QED_CHECK_478, %k.1295_QED_CHECK_479
  call void @eddi_check_function(i1 %for.cond64.preheader.lr.ph_error)
  br label %for.cond64.preheader

for.cond64.preheader:                             ; preds = %for.end95, %for.cond64.preheader.lr.ph
  %h_off.1292 = phi i64 [ %MyFirst, %for.cond64.preheader.lr.ph ], [ %add96, %for.end95 ]
  %m.1291 = phi i64 [ 0, %for.cond64.preheader.lr.ph ], [ %inc98, %for.end95 ]
  %h_off.1292_dup = phi i64 [ %MyFirst_dup, %for.cond64.preheader.lr.ph ], [ %add96_dup, %for.end95 ]
  %m.1291_dup = phi i64 [ 0, %for.cond64.preheader.lr.ph ], [ %inc98_dup, %for.end95 ]
  %h_off.1292_QED_CHECK_480 = icmp eq i64 %h_off.1292, %h_off.1292_dup
  %m.1291_QED_CHECK_481 = icmp eq i64 %m.1291, %m.1291_dup
  %for.cond64.preheader_error = and i1 %h_off.1292_QED_CHECK_480, %m.1291_QED_CHECK_481
  call void @eddi_check_function(i1 %for.cond64.preheader_error)
  br i1 %cmp65288, label %for.body70.lr.ph, label %for.end95

for.body70.lr.ph:                                 ; preds = %for.inc93, %for.cond64.preheader
  %i.1289 = phi i64 [ %inc94, %for.inc93 ], [ 0, %for.cond64.preheader ]
  %i.1289_dup = phi i64 [ %inc94_dup, %for.inc93 ], [ 0, %for.cond64.preheader ]
  %add67 = add nsw i64 %i.1289, %v_off.1296
  %mul72 = mul nsw i64 %add67, %add
  %add67_dup = add nsw i64 %i.1289_dup, %v_off.1296_dup
  %mul72_dup = mul nsw i64 %add67_dup, %add_dup
  %i.1289_QED_CHECK_482 = icmp eq i64 %i.1289, %i.1289_dup
  %add67_QED_CHECK_483 = icmp eq i64 %add67, %add67_dup
  %mul72_QED_CHECK_484 = icmp eq i64 %mul72, %mul72_dup
  %30 = and i1 %add67_QED_CHECK_483, %mul72_QED_CHECK_484
  %for.body70.lr.ph_error = and i1 %i.1289_QED_CHECK_482, %30
  call void @eddi_check_function(i1 %for.body70.lr.ph_error)
  br label %for.body70

for.body70:                                       ; preds = %for.body70, %for.body70.lr.ph
  %j.1287 = phi i64 [ 0, %for.body70.lr.ph ], [ %inc91, %for.body70 ]
  %j.1287_dup = phi i64 [ 0, %for.body70.lr.ph ], [ %inc91_dup, %for.body70 ]
  %add71 = add nsw i64 %j.1287, %h_off.1292
  %add73 = add nsw i64 %add71, %mul72
  %mul74 = shl nsw i64 %add73, 1
  %arrayidx75 = getelementptr inbounds double* %src, i64 %mul74
  %31 = load double* %arrayidx75, align 8, !tbaa !4
  %mul76 = mul nsw i64 %add71, %add
  %add77 = add nsw i64 %mul76, %add67
  %mul78 = shl nsw i64 %add77, 1
  %arrayidx79 = getelementptr inbounds double* %dest, i64 %mul78
  store double %31, double* %arrayidx79, align 8, !tbaa !4
  %add83270 = or i64 %mul74, 1
  %arrayidx84 = getelementptr inbounds double* %src, i64 %add83270
  %32 = load double* %arrayidx84, align 8, !tbaa !4
  %add88271 = or i64 %mul78, 1
  %arrayidx89 = getelementptr inbounds double* %dest, i64 %add88271
  store double %32, double* %arrayidx89, align 8, !tbaa !4
  %inc91 = add nsw i64 %j.1287, 1
  %exitcond318 = icmp eq i64 %inc91, %div3
  %add71_dup = add nsw i64 %j.1287_dup, %h_off.1292_dup
  %add73_dup = add nsw i64 %add71_dup, %mul72_dup
  %mul74_dup = shl nsw i64 %add73_dup, 1
  %arrayidx75_dup = getelementptr inbounds double* %src_dup, i64 %mul74_dup
  %33 = load double* %arrayidx75_dup, align 8, !tbaa !4
  %mul76_dup = mul nsw i64 %add71_dup, %add_dup
  %add77_dup = add nsw i64 %mul76_dup, %add67_dup
  %mul78_dup = shl nsw i64 %add77_dup, 1
  %arrayidx79_dup = getelementptr inbounds double* %dest_dup, i64 %mul78_dup
  store double %33, double* %arrayidx79_dup, align 8, !tbaa !4
  %add83270_dup = or i64 %mul74_dup, 1
  %arrayidx84_dup = getelementptr inbounds double* %src_dup, i64 %add83270_dup
  %34 = load double* %arrayidx84_dup, align 8, !tbaa !4
  %add88271_dup = or i64 %mul78_dup, 1
  %arrayidx89_dup = getelementptr inbounds double* %dest_dup, i64 %add88271_dup
  store double %34, double* %arrayidx89_dup, align 8, !tbaa !4
  %inc91_dup = add nsw i64 %j.1287_dup, 1
  %exitcond318_dup = icmp eq i64 %inc91_dup, %div3_dup
  %j.1287_QED_CHECK_485 = icmp eq i64 %j.1287, %j.1287_dup
  %add71_QED_CHECK_486 = icmp eq i64 %add71, %add71_dup
  %add73_QED_CHECK_487 = icmp eq i64 %add73, %add73_dup
  %mul74_QED_CHECK_488 = icmp eq i64 %mul74, %mul74_dup
  %mul76_QED_CHECK_489 = icmp eq i64 %mul76, %mul76_dup
  %add77_QED_CHECK_490 = icmp eq i64 %add77, %add77_dup
  %mul78mul78 = icmp eq i64 %mul78, %mul78_dup
  %add83270_QED_CHECK_492 = icmp eq i64 %add83270, %add83270_dup
  %add88271_QED_CHECK_493 = icmp eq i64 %add88271, %add88271_dup
  %inc91_QED_CHECK_494 = icmp eq i64 %inc91, %inc91_dup
  %exitcond318_QED_CHECK_495 = icmp eq i1 %exitcond318, %exitcond318_dup
  %35 = and i1 %j.1287_QED_CHECK_485, %add71_QED_CHECK_486
  %36 = and i1 %mul74_QED_CHECK_488, %mul76_QED_CHECK_489
  %37 = and i1 %add73_QED_CHECK_487, %36
  %38 = and i1 %35, %37
  %39 = and i1 %mul78mul78, %add83270_QED_CHECK_492
  %40 = and i1 %add77_QED_CHECK_490, %39
  %41 = and i1 %inc91_QED_CHECK_494, %exitcond318_QED_CHECK_495
  %42 = and i1 %add88271_QED_CHECK_493, %41
  %43 = and i1 %40, %42
  %for.body70_error = and i1 %38, %43
  call void @eddi_check_function(i1 %for.body70_error)
  br i1 %exitcond318, label %for.inc93, label %for.body70

for.inc93:                                        ; preds = %for.body70
  %inc94 = add nsw i64 %i.1289, 1
  %exitcond319 = icmp eq i64 %inc94, %div3
  %inc94_dup = add nsw i64 %i.1289_dup, 1
  %exitcond319_dup = icmp eq i64 %inc94_dup, %div3_dup
  %inc94_QED_CHECK_496 = icmp eq i64 %inc94, %inc94_dup
  %exitcond319_QED_CHECK_497 = icmp eq i1 %exitcond319, %exitcond319_dup
  %for.inc93_error = and i1 %inc94_QED_CHECK_496, %exitcond319_QED_CHECK_497
  call void @eddi_check_function(i1 %for.inc93_error)
  br i1 %exitcond319, label %for.end95, label %for.body70.lr.ph

for.end95:                                        ; preds = %for.inc93, %for.cond64.preheader
  %add96 = add nsw i64 %h_off.1292, %div3
  %inc98 = add nsw i64 %m.1291, 1
  %exitcond320 = icmp eq i64 %inc98, %div.inc
  %add96_dup = add nsw i64 %h_off.1292_dup, %div3_dup
  %inc98_dup = add nsw i64 %m.1291_dup, 1
  %exitcond320_dup = icmp eq i64 %inc98_dup, %div.inc_dup
  %add96_QED_CHECK_498 = icmp eq i64 %add96, %add96_dup
  %inc98inc98 = icmp eq i64 %inc98, %inc98_dup
  %exitcond320_QED_CHECK_500 = icmp eq i1 %exitcond320, %exitcond320_dup
  %44 = and i1 %inc98inc98, %exitcond320_QED_CHECK_500
  %for.end95_error = and i1 %add96_QED_CHECK_498, %44
  call void @eddi_check_function(i1 %for.end95_error)
  br i1 %exitcond320, label %for.end99, label %for.cond64.preheader

for.end99:                                        ; preds = %for.end95
  %add100 = add nsw i64 %v_off.1296, %div3
  %inc102 = add nsw i64 %k.1295, 1
  %exitcond321 = icmp eq i64 %inc102, %div.inc
  %add100_dup = add nsw i64 %v_off.1296_dup, %div3_dup
  %inc102_dup = add nsw i64 %k.1295_dup, 1
  %exitcond321_dup = icmp eq i64 %inc102_dup, %div.inc_dup
  %add100_QED_CHECK_501 = icmp eq i64 %add100, %add100_dup
  %inc102_QED_CHECK_502 = icmp eq i64 %inc102, %inc102_dup
  %exitcond321_QED_CHECK_503 = icmp eq i1 %exitcond321, %exitcond321_dup
  %45 = and i1 %inc102_QED_CHECK_502, %exitcond321_QED_CHECK_503
  %for.end99_error = and i1 %add100_QED_CHECK_501, %45
  call void @eddi_check_function(i1 %for.end99_error)
  br i1 %exitcond321, label %for.inc104, label %for.cond64.preheader.lr.ph

for.inc104:                                       ; preds = %for.end99, %for.body56
  %inc105 = add nsw i64 %l.1299, 1
  %exitcond322 = icmp eq i64 %inc105, %MyNum
  %inc105_dup = add nsw i64 %l.1299_dup, 1
  %exitcond322_dup = icmp eq i64 %inc105_dup, %MyNum_dup
  %inc105_QED_CHECK_504 = icmp eq i64 %inc105, %inc105_dup
  %exitcond322_QED_CHECK_505 = icmp eq i1 %exitcond322, %exitcond322_dup
  %for.inc104_error = and i1 %inc105_QED_CHECK_504, %exitcond322_QED_CHECK_505
  call void @eddi_check_function(i1 %for.inc104_error)
  br i1 %exitcond322, label %for.end106, label %for.body56

for.end106:                                       ; preds = %for.inc104, %for.cond54.preheader
  %cmp109282 = icmp sgt i64 %div.inc, 0
  %cmp109282_dup = icmp sgt i64 %div.inc_dup, 0
  %cmp109282_QED_CHECK_506 = icmp eq i1 %cmp109282, %cmp109282_dup
  call void @eddi_check_function(i1 %cmp109282_QED_CHECK_506)
  br i1 %cmp109282, label %for.cond111.preheader.lr.ph, label %for.end153

for.cond111.preheader.lr.ph:                      ; preds = %for.end106
  %mul107 = mul nsw i64 %div4, %MyNum
  %cmp115276 = icmp sgt i64 %div3, 0
  %mul107_dup = mul nsw i64 %div4_dup, %MyNum_dup
  %cmp115276_dup = icmp sgt i64 %div3_dup, 0
  %mul107_QED_CHECK_507 = icmp eq i64 %mul107, %mul107_dup
  %cmp115276_QED_CHECK_508 = icmp eq i1 %cmp115276, %cmp115276_dup
  %for.cond111.preheader.lr.ph_error = and i1 %mul107_QED_CHECK_507, %cmp115276_QED_CHECK_508
  call void @eddi_check_function(i1 %for.cond111.preheader.lr.ph_error)
  br label %for.cond114.preheader.lr.ph

for.cond114.preheader.lr.ph:                      ; preds = %for.end149, %for.cond111.preheader.lr.ph
  %v_off.2284 = phi i64 [ %mul107, %for.cond111.preheader.lr.ph ], [ %add150, %for.end149 ]
  %k.2283 = phi i64 [ 0, %for.cond111.preheader.lr.ph ], [ %inc152, %for.end149 ]
  %v_off.2284_dup = phi i64 [ %mul107_dup, %for.cond111.preheader.lr.ph ], [ %add150_dup, %for.end149 ]
  %k.2283_dup = phi i64 [ 0, %for.cond111.preheader.lr.ph ], [ %inc152_dup, %for.end149 ]
  %v_off.2284_QED_CHECK_509 = icmp eq i64 %v_off.2284, %v_off.2284_dup
  %k.2283_QED_CHECK_510 = icmp eq i64 %k.2283, %k.2283_dup
  %for.cond114.preheader.lr.ph_error = and i1 %v_off.2284_QED_CHECK_509, %k.2283_QED_CHECK_510
  call void @eddi_check_function(i1 %for.cond114.preheader.lr.ph_error)
  br label %for.cond114.preheader

for.cond114.preheader:                            ; preds = %for.end145, %for.cond114.preheader.lr.ph
  %h_off.2280 = phi i64 [ %MyFirst, %for.cond114.preheader.lr.ph ], [ %add146, %for.end145 ]
  %m.2279 = phi i64 [ 0, %for.cond114.preheader.lr.ph ], [ %inc148, %for.end145 ]
  %h_off.2280_dup = phi i64 [ %MyFirst_dup, %for.cond114.preheader.lr.ph ], [ %add146_dup, %for.end145 ]
  %m.2279_dup = phi i64 [ 0, %for.cond114.preheader.lr.ph ], [ %inc148_dup, %for.end145 ]
  %h_off.2280_QED_CHECK_511 = icmp eq i64 %h_off.2280, %h_off.2280_dup
  %m.2279_QED_CHECK_512 = icmp eq i64 %m.2279, %m.2279_dup
  %for.cond114.preheader_error = and i1 %h_off.2280_QED_CHECK_511, %m.2279_QED_CHECK_512
  call void @eddi_check_function(i1 %for.cond114.preheader_error)
  br i1 %cmp115276, label %for.body120.lr.ph, label %for.end145

for.body120.lr.ph:                                ; preds = %for.inc143, %for.cond114.preheader
  %i.2277 = phi i64 [ %inc144, %for.inc143 ], [ 0, %for.cond114.preheader ]
  %i.2277_dup = phi i64 [ %inc144_dup, %for.inc143 ], [ 0, %for.cond114.preheader ]
  %add117 = add nsw i64 %i.2277, %v_off.2284
  %mul122 = mul nsw i64 %add117, %add
  %add117_dup = add nsw i64 %i.2277_dup, %v_off.2284_dup
  %mul122_dup = mul nsw i64 %add117_dup, %add_dup
  %i.2277i.2277 = icmp eq i64 %i.2277, %i.2277_dup
  %add117_QED_CHECK_514 = icmp eq i64 %add117, %add117_dup
  %mul122_QED_CHECK_515 = icmp eq i64 %mul122, %mul122_dup
  %46 = and i1 %add117_QED_CHECK_514, %mul122_QED_CHECK_515
  %for.body120.lr.ph_error = and i1 %i.2277i.2277, %46
  call void @eddi_check_function(i1 %for.body120.lr.ph_error)
  br label %for.body120

for.body120:                                      ; preds = %for.body120, %for.body120.lr.ph
  %j.2275 = phi i64 [ 0, %for.body120.lr.ph ], [ %inc141, %for.body120 ]
  %j.2275_dup = phi i64 [ 0, %for.body120.lr.ph ], [ %inc141_dup, %for.body120 ]
  %add121 = add nsw i64 %j.2275, %h_off.2280
  %add123 = add nsw i64 %add121, %mul122
  %mul124 = shl nsw i64 %add123, 1
  %arrayidx125 = getelementptr inbounds double* %src, i64 %mul124
  %47 = load double* %arrayidx125, align 8, !tbaa !4
  %mul126 = mul nsw i64 %add121, %add
  %add127 = add nsw i64 %mul126, %add117
  %mul128 = shl nsw i64 %add127, 1
  %arrayidx129 = getelementptr inbounds double* %dest, i64 %mul128
  store double %47, double* %arrayidx129, align 8, !tbaa !4
  %add133268 = or i64 %mul124, 1
  %arrayidx134 = getelementptr inbounds double* %src, i64 %add133268
  %48 = load double* %arrayidx134, align 8, !tbaa !4
  %add138269 = or i64 %mul128, 1
  %arrayidx139 = getelementptr inbounds double* %dest, i64 %add138269
  store double %48, double* %arrayidx139, align 8, !tbaa !4
  %inc141 = add nsw i64 %j.2275, 1
  %exitcond = icmp eq i64 %inc141, %div3
  %add121_dup = add nsw i64 %j.2275_dup, %h_off.2280_dup
  %add123_dup = add nsw i64 %add121_dup, %mul122_dup
  %mul124_dup = shl nsw i64 %add123_dup, 1
  %arrayidx125_dup = getelementptr inbounds double* %src_dup, i64 %mul124_dup
  %49 = load double* %arrayidx125_dup, align 8, !tbaa !4
  %mul126_dup = mul nsw i64 %add121_dup, %add_dup
  %add127_dup = add nsw i64 %mul126_dup, %add117_dup
  %mul128_dup = shl nsw i64 %add127_dup, 1
  %arrayidx129_dup = getelementptr inbounds double* %dest_dup, i64 %mul128_dup
  store double %49, double* %arrayidx129_dup, align 8, !tbaa !4
  %add133268_dup = or i64 %mul124_dup, 1
  %arrayidx134_dup = getelementptr inbounds double* %src_dup, i64 %add133268_dup
  %50 = load double* %arrayidx134_dup, align 8, !tbaa !4
  %add138269_dup = or i64 %mul128_dup, 1
  %arrayidx139_dup = getelementptr inbounds double* %dest_dup, i64 %add138269_dup
  store double %50, double* %arrayidx139_dup, align 8, !tbaa !4
  %inc141_dup = add nsw i64 %j.2275_dup, 1
  %exitcond_dup = icmp eq i64 %inc141_dup, %div3_dup
  %j.2275_QED_CHECK_516 = icmp eq i64 %j.2275, %j.2275_dup
  %add121_QED_CHECK_517 = icmp eq i64 %add121, %add121_dup
  %add123_QED_CHECK_518 = icmp eq i64 %add123, %add123_dup
  %mul124_QED_CHECK_519 = icmp eq i64 %mul124, %mul124_dup
  %mul126_QED_CHECK_520 = icmp eq i64 %mul126, %mul126_dup
  %add127_QED_CHECK_521 = icmp eq i64 %add127, %add127_dup
  %mul128mul128 = icmp eq i64 %mul128, %mul128_dup
  %add133268_QED_CHECK_523 = icmp eq i64 %add133268, %add133268_dup
  %"add138269\D8\BD<\0A\FB\07\00\10\02\00_524" = icmp eq i64 %add138269, %add138269_dup
  %inc141_QED_CHECK_525 = icmp eq i64 %inc141, %inc141_dup
  %"exitcond\00\00\00\00\00\00\00\90\05\00_526" = icmp eq i1 %exitcond, %exitcond_dup
  %51 = and i1 %j.2275_QED_CHECK_516, %add121_QED_CHECK_517
  %52 = and i1 %mul124_QED_CHECK_519, %mul126_QED_CHECK_520
  %53 = and i1 %add123_QED_CHECK_518, %52
  %54 = and i1 %51, %53
  %55 = and i1 %mul128mul128, %add133268_QED_CHECK_523
  %56 = and i1 %add127_QED_CHECK_521, %55
  %57 = and i1 %inc141_QED_CHECK_525, %"exitcond\00\00\00\00\00\00\00\90\05\00_526"
  %58 = and i1 %"add138269\D8\BD<\0A\FB\07\00\10\02\00_524", %57
  %59 = and i1 %56, %58
  %for.body120_error = and i1 %54, %59
  call void @eddi_check_function(i1 %for.body120_error)
  br i1 %exitcond, label %for.inc143, label %for.body120

for.inc143:                                       ; preds = %for.body120
  %inc144 = add nsw i64 %i.2277, 1
  %exitcond315 = icmp eq i64 %inc144, %div3
  %inc144_dup = add nsw i64 %i.2277_dup, 1
  %exitcond315_dup = icmp eq i64 %inc144_dup, %div3_dup
  %inc144_QED_CHECK_527 = icmp eq i64 %inc144, %inc144_dup
  %exitcond315_QED_CHECK_528 = icmp eq i1 %exitcond315, %exitcond315_dup
  %for.inc143_error = and i1 %inc144_QED_CHECK_527, %exitcond315_QED_CHECK_528
  call void @eddi_check_function(i1 %for.inc143_error)
  br i1 %exitcond315, label %for.end145, label %for.body120.lr.ph

for.end145:                                       ; preds = %for.inc143, %for.cond114.preheader
  %add146 = add nsw i64 %h_off.2280, %div3
  %inc148 = add nsw i64 %m.2279, 1
  %exitcond316 = icmp eq i64 %inc148, %div.inc
  %add146_dup = add nsw i64 %h_off.2280_dup, %div3_dup
  %inc148_dup = add nsw i64 %m.2279_dup, 1
  %exitcond316_dup = icmp eq i64 %inc148_dup, %div.inc_dup
  %add146_QED_CHECK_529 = icmp eq i64 %add146, %add146_dup
  %inc148_QED_CHECK_530 = icmp eq i64 %inc148, %inc148_dup
  %exitcond316_QED_CHECK_531 = icmp eq i1 %exitcond316, %exitcond316_dup
  %60 = and i1 %inc148_QED_CHECK_530, %exitcond316_QED_CHECK_531
  %for.end145_error = and i1 %add146_QED_CHECK_529, %60
  call void @eddi_check_function(i1 %for.end145_error)
  br i1 %exitcond316, label %for.end149, label %for.cond114.preheader

for.end149:                                       ; preds = %for.end145
  %add150 = add nsw i64 %v_off.2284, %div3
  %inc152 = add nsw i64 %k.2283, 1
  %exitcond317 = icmp eq i64 %inc152, %div.inc
  %add150_dup = add nsw i64 %v_off.2284_dup, %div3_dup
  %inc152_dup = add nsw i64 %k.2283_dup, 1
  %exitcond317_dup = icmp eq i64 %inc152_dup, %div.inc_dup
  %add150_QED_CHECK_532 = icmp eq i64 %add150, %add150_dup
  %inc152_QED_CHECK_533 = icmp eq i64 %inc152, %inc152_dup
  %exitcond317_QED_CHECK_534 = icmp eq i1 %exitcond317, %exitcond317_dup
  %61 = and i1 %inc152_QED_CHECK_533, %exitcond317_QED_CHECK_534
  %for.end149_error = and i1 %add150_QED_CHECK_532, %61
  call void @eddi_check_function(i1 %for.end149_error)
  br i1 %exitcond317, label %for.end153, label %for.cond114.preheader.lr.ph

for.end153:                                       ; preds = %for.end149, %for.end106
  ret void
}

define void @FFT1DOnce(i64 %direction, i64 %direction_dup, i64 %M, i64 %M_dup, i64 %N, i64 %N_dup, double* %u, double* %u_dup, double* %x, double* %x_dup) {
entry:
  %cmp41.i = icmp sgt i64 %N, 0
  %cmp41.i_dup = icmp sgt i64 %N_dup, 0
  %cmp41.i_QED_CHECK_535 = icmp eq i1 %cmp41.i, %cmp41.i_dup
  call void @eddi_check_function(i1 %cmp41.i_QED_CHECK_535)
  br i1 %cmp41.i, label %for.body.lr.ph.i, label %for.cond.preheader

for.body.lr.ph.i:                                 ; preds = %entry
  %cmp3.i.i = icmp sgt i64 %M, 0
  %cmp3.i.i_dup = icmp sgt i64 %M_dup, 0
  %cmp3.i.i_QED_CHECK_536 = icmp eq i1 %cmp3.i.i, %cmp3.i.i_dup
  call void @eddi_check_function(i1 %cmp3.i.i_QED_CHECK_536)
  br label %for.body.i

for.body.i:                                       ; preds = %for.inc.i, %for.body.lr.ph.i
  %k.042.i = phi i64 [ 0, %for.body.lr.ph.i ], [ %inc.i, %for.inc.i ]
  %k.042.i_dup = phi i64 [ 0, %for.body.lr.ph.i ], [ %inc.i_dup, %for.inc.i ]
  %k.042.i_QED_CHECK_537 = icmp eq i64 %k.042.i, %k.042.i_dup
  call void @eddi_check_function(i1 %k.042.i_QED_CHECK_537)
  br i1 %cmp3.i.i, label %for.body.i.i, label %BitReverse.exit.i

for.body.i.i:                                     ; preds = %for.body.i.i, %for.body.i
  %tmp.06.i.i = phi i64 [ %shr.i.i, %for.body.i.i ], [ %k.042.i, %for.body.i ]
  %j.05.i.i = phi i64 [ %add.i.i, %for.body.i.i ], [ 0, %for.body.i ]
  %i.04.i.i = phi i64 [ %inc.i.i, %for.body.i.i ], [ 0, %for.body.i ]
  %tmp.06.i.i_dup = phi i64 [ %shr.i.i_dup, %for.body.i.i ], [ %k.042.i_dup, %for.body.i ]
  %j.05.i.i_dup = phi i64 [ %add.i.i_dup, %for.body.i.i ], [ 0, %for.body.i ]
  %i.04.i.i_dup = phi i64 [ %inc.i.i_dup, %for.body.i.i ], [ 0, %for.body.i ]
  %mul.i.i = shl nsw i64 %j.05.i.i, 1
  %and.i.i = and i64 %tmp.06.i.i, 1
  %add.i.i = or i64 %mul.i.i, %and.i.i
  %shr.i.i = ashr i64 %tmp.06.i.i, 1
  %inc.i.i = add nsw i64 %i.04.i.i, 1
  %exitcond.i.i = icmp eq i64 %inc.i.i, %M
  %mul.i.i_dup = shl nsw i64 %j.05.i.i_dup, 1
  %and.i.i_dup = and i64 %tmp.06.i.i_dup, 1
  %add.i.i_dup = or i64 %mul.i.i_dup, %and.i.i_dup
  %shr.i.i_dup = ashr i64 %tmp.06.i.i_dup, 1
  %inc.i.i_dup = add nsw i64 %i.04.i.i_dup, 1
  %exitcond.i.i_dup = icmp eq i64 %inc.i.i_dup, %M_dup
  %tmp.06.i.i_QED_CHECK_538 = icmp eq i64 %tmp.06.i.i, %tmp.06.i.i_dup
  %j.05.i.i_QED_CHECK_539 = icmp eq i64 %j.05.i.i, %j.05.i.i_dup
  %i.04.i.i_QED_CHECK_540 = icmp eq i64 %i.04.i.i, %i.04.i.i_dup
  %mul.i.i_QED_CHECK_541 = icmp eq i64 %mul.i.i, %mul.i.i_dup
  %and.i.i_QED_CHECK_542 = icmp eq i64 %and.i.i, %and.i.i_dup
  %add.i.i_QED_CHECK_543 = icmp eq i64 %add.i.i, %add.i.i_dup
  %shr.i.i_QED_CHECK_544 = icmp eq i64 %shr.i.i, %shr.i.i_dup
  %inc.i.i_QED_CHECK_545 = icmp eq i64 %inc.i.i, %inc.i.i_dup
  %exitcond.i.i_QED_CHECK_546 = icmp eq i1 %exitcond.i.i, %exitcond.i.i_dup
  %0 = and i1 %tmp.06.i.i_QED_CHECK_538, %j.05.i.i_QED_CHECK_539
  %1 = and i1 %i.04.i.i_QED_CHECK_540, %mul.i.i_QED_CHECK_541
  %2 = and i1 %0, %1
  %3 = and i1 %and.i.i_QED_CHECK_542, %add.i.i_QED_CHECK_543
  %4 = and i1 %inc.i.i_QED_CHECK_545, %exitcond.i.i_QED_CHECK_546
  %5 = and i1 %shr.i.i_QED_CHECK_544, %4
  %6 = and i1 %3, %5
  %for.body.i.i_error = and i1 %2, %6
  call void @eddi_check_function(i1 %for.body.i.i_error)
  br i1 %exitcond.i.i, label %BitReverse.exit.i, label %for.body.i.i

BitReverse.exit.i:                                ; preds = %for.body.i.i, %for.body.i
  %j.0.lcssa.i.i = phi i64 [ 0, %for.body.i ], [ %add.i.i, %for.body.i.i ]
  %j.0.lcssa.i.i_dup = phi i64 [ 0, %for.body.i ], [ %add.i.i_dup, %for.body.i.i ]
  %cmp1.i = icmp sgt i64 %j.0.lcssa.i.i, %k.042.i
  %cmp1.i_dup = icmp sgt i64 %j.0.lcssa.i.i_dup, %k.042.i_dup
  %j.0.lcssa.i.i_QED_CHECK_547 = icmp eq i64 %j.0.lcssa.i.i, %j.0.lcssa.i.i_dup
  %cmp1.i_QED_CHECK_548 = icmp eq i1 %cmp1.i, %cmp1.i_dup
  %BitReverse.exit.i_error = and i1 %j.0.lcssa.i.i_QED_CHECK_547, %cmp1.i_QED_CHECK_548
  call void @eddi_check_function(i1 %BitReverse.exit.i_error)
  br i1 %cmp1.i, label %if.then.i, label %for.inc.i

if.then.i:                                        ; preds = %BitReverse.exit.i
  %mul.i = shl nsw i64 %j.0.lcssa.i.i, 1
  %arrayidx.i = getelementptr inbounds double* %x, i64 %mul.i
  %7 = load double* %arrayidx.i, align 8, !tbaa !4
  %mul2.i = shl nsw i64 %k.042.i, 1
  %arrayidx3.i = getelementptr inbounds double* %x, i64 %mul2.i
  %8 = load double* %arrayidx3.i, align 8, !tbaa !4
  store double %8, double* %arrayidx.i, align 8, !tbaa !4
  store double %7, double* %arrayidx3.i, align 8, !tbaa !4
  %add39.i = or i64 %mul.i, 1
  %arrayidx11.i = getelementptr inbounds double* %x, i64 %add39.i
  %9 = load double* %arrayidx11.i, align 8, !tbaa !4
  %add1340.i = or i64 %mul2.i, 1
  %arrayidx14.i = getelementptr inbounds double* %x, i64 %add1340.i
  %10 = load double* %arrayidx14.i, align 8, !tbaa !4
  store double %10, double* %arrayidx11.i, align 8, !tbaa !4
  store double %9, double* %arrayidx14.i, align 8, !tbaa !4
  %mul.i_dup = shl nsw i64 %j.0.lcssa.i.i_dup, 1
  %arrayidx.i_dup = getelementptr inbounds double* %x_dup, i64 %mul.i_dup
  %11 = load double* %arrayidx.i_dup, align 8, !tbaa !4
  %mul2.i_dup = shl nsw i64 %k.042.i_dup, 1
  %arrayidx3.i_dup = getelementptr inbounds double* %x_dup, i64 %mul2.i_dup
  %12 = load double* %arrayidx3.i_dup, align 8, !tbaa !4
  store double %12, double* %arrayidx.i_dup, align 8, !tbaa !4
  store double %11, double* %arrayidx3.i_dup, align 8, !tbaa !4
  %add39.i_dup = or i64 %mul.i_dup, 1
  %arrayidx11.i_dup = getelementptr inbounds double* %x_dup, i64 %add39.i_dup
  %13 = load double* %arrayidx11.i_dup, align 8, !tbaa !4
  %add1340.i_dup = or i64 %mul2.i_dup, 1
  %arrayidx14.i_dup = getelementptr inbounds double* %x_dup, i64 %add1340.i_dup
  %14 = load double* %arrayidx14.i_dup, align 8, !tbaa !4
  store double %14, double* %arrayidx11.i_dup, align 8, !tbaa !4
  store double %13, double* %arrayidx14.i_dup, align 8, !tbaa !4
  %mul.i_QED_CHECK_549 = icmp eq i64 %mul.i, %mul.i_dup
  %mul2.imul2.i = icmp eq i64 %mul2.i, %mul2.i_dup
  %add39.i_QED_CHECK_551 = icmp eq i64 %add39.i, %add39.i_dup
  %add1340.i_QED_CHECK_552 = icmp eq i64 %add1340.i, %add1340.i_dup
  %15 = and i1 %mul.i_QED_CHECK_549, %mul2.imul2.i
  %16 = and i1 %add39.i_QED_CHECK_551, %add1340.i_QED_CHECK_552
  %if.then.i_error = and i1 %15, %16
  call void @eddi_check_function(i1 %if.then.i_error)
  br label %for.inc.i

for.inc.i:                                        ; preds = %if.then.i, %BitReverse.exit.i
  %inc.i = add nsw i64 %k.042.i, 1
  %exitcond.i = icmp eq i64 %inc.i, %N
  %inc.i_dup = add nsw i64 %k.042.i_dup, 1
  %exitcond.i_dup = icmp eq i64 %inc.i_dup, %N_dup
  %inc.i_QED_CHECK_553 = icmp eq i64 %inc.i, %inc.i_dup
  %exitcond.i_QED_CHECK_554 = icmp eq i1 %exitcond.i, %exitcond.i_dup
  %for.inc.i_error = and i1 %inc.i_QED_CHECK_553, %exitcond.i_QED_CHECK_554
  call void @eddi_check_function(i1 %for.inc.i_error)
  br i1 %exitcond.i, label %for.cond.preheader, label %for.body.i

for.cond.preheader:                               ; preds = %for.inc.i, %entry
  %cmp109 = icmp slt i64 %M, 1
  %cmp109_dup = icmp slt i64 %M_dup, 1
  %cmp109_QED_CHECK_555 = icmp eq i1 %cmp109, %cmp109_dup
  call void @eddi_check_function(i1 %cmp109_QED_CHECK_555)
  br i1 %cmp109, label %for.end58, label %for.body.lr.ph

for.body.lr.ph:                                   ; preds = %for.cond.preheader
  %conv18 = sitofp i64 %direction to double
  %conv18_dup = sitofp i64 %direction_dup to double
  %conv18_QED_CHECK_556 = fcmp oeq double %conv18, %conv18_dup
  call void @eddi_check_function(i1 %conv18_QED_CHECK_556)
  br label %for.body

for.body:                                         ; preds = %for.inc56, %for.body.lr.ph
  %q.0110 = phi i64 [ 1, %for.body.lr.ph ], [ %inc57, %for.inc56 ]
  %q.0110_dup = phi i64 [ 1, %for.body.lr.ph ], [ %inc57_dup, %for.inc56 ]
  %sh_prom = trunc i64 %q.0110 to i32
  %shl = shl i32 1, %sh_prom
  %conv = sext i32 %shl to i64
  %div = sdiv i64 %N, %conv
  %div1 = sdiv i64 %conv, 2
  %sub = shl i64 %div1, 1
  %mul = add i64 %sub, -2
  %cmp3107 = icmp sgt i64 %div, 0
  %sh_prom_dup = trunc i64 %q.0110_dup to i32
  %shl_dup = shl i32 1, %sh_prom_dup
  %conv_dup = sext i32 %shl_dup to i64
  %div_dup = sdiv i64 %N_dup, %conv_dup
  %div1_dup = sdiv i64 %conv_dup, 2
  %sub_dup = shl i64 %div1_dup, 1
  %mul_dup = add i64 %sub_dup, -2
  %cmp3107_dup = icmp sgt i64 %div_dup, 0
  %q.0110_QED_CHECK_557 = icmp eq i64 %q.0110, %q.0110_dup
  %sh_prom_QED_CHECK_558 = icmp eq i32 %sh_prom, %sh_prom_dup
  %shl_QED_CHECK_559 = icmp eq i32 %shl, %shl_dup
  %conv_QED_CHECK_560 = icmp eq i64 %conv, %conv_dup
  %div_QED_CHECK_561 = icmp eq i64 %div, %div_dup
  %div1_QED_CHECK_562 = icmp eq i64 %div1, %div1_dup
  %sub_QED_CHECK_563 = icmp eq i64 %sub, %sub_dup
  %mul_QED_CHECK_564 = icmp eq i64 %mul, %mul_dup
  %cmp3107_QED_CHECK_565 = icmp eq i1 %cmp3107, %cmp3107_dup
  %17 = and i1 %q.0110_QED_CHECK_557, %sh_prom_QED_CHECK_558
  %18 = and i1 %shl_QED_CHECK_559, %conv_QED_CHECK_560
  %19 = and i1 %17, %18
  %20 = and i1 %div_QED_CHECK_561, %div1_QED_CHECK_562
  %21 = and i1 %mul_QED_CHECK_564, %cmp3107_QED_CHECK_565
  %22 = and i1 %sub_QED_CHECK_563, %21
  %23 = and i1 %20, %22
  %for.body_error = and i1 %19, %23
  call void @eddi_check_function(i1 %for.body_error)
  br i1 %cmp3107, label %for.body5.lr.ph, label %for.inc56

for.body5.lr.ph:                                  ; preds = %for.body
  %cmp13105 = icmp sgt i32 %shl, 1
  %cmp13105_dup = icmp sgt i32 %shl_dup, 1
  %"cmp13105\00\00\00\00\00\00\00\90\05\00_566" = icmp eq i1 %cmp13105, %cmp13105_dup
  call void @eddi_check_function(i1 %"cmp13105\00\00\00\00\00\00\00\90\05\00_566")
  br label %for.body5

for.body5:                                        ; preds = %for.inc53, %for.body5.lr.ph
  %k.0108 = phi i64 [ 0, %for.body5.lr.ph ], [ %inc54, %for.inc53 ]
  %k.0108_dup = phi i64 [ 0, %for.body5.lr.ph ], [ %inc54_dup, %for.inc53 ]
  %mul6 = mul nsw i64 %k.0108, %conv
  %mul7 = shl nsw i64 %mul6, 1
  %add = add nsw i64 %mul6, %div1
  %mul10 = shl nsw i64 %add, 1
  %mul6_dup = mul nsw i64 %k.0108_dup, %conv_dup
  %mul7_dup = shl nsw i64 %mul6_dup, 1
  %add_dup = add nsw i64 %mul6_dup, %div1_dup
  %mul10_dup = shl nsw i64 %add_dup, 1
  %k.0108_QED_CHECK_567 = icmp eq i64 %k.0108, %k.0108_dup
  %mul6_QED_CHECK_568 = icmp eq i64 %mul6, %mul6_dup
  %mul7_QED_CHECK_569 = icmp eq i64 %mul7, %mul7_dup
  %add_QED_CHECK_570 = icmp eq i64 %add, %add_dup
  %mul10_QED_CHECK_571 = icmp eq i64 %mul10, %mul10_dup
  %24 = and i1 %k.0108_QED_CHECK_567, %mul6_QED_CHECK_568
  %25 = and i1 %add_QED_CHECK_570, %mul10_QED_CHECK_571
  %26 = and i1 %mul7_QED_CHECK_569, %25
  %for.body5_error = and i1 %24, %26
  call void @eddi_check_function(i1 %for.body5_error)
  br i1 %cmp13105, label %for.body15, label %for.inc53

for.body15:                                       ; preds = %for.body15, %for.body5
  %j.0106 = phi i64 [ %inc, %for.body15 ], [ 0, %for.body5 ]
  %j.0106_dup = phi i64 [ %inc_dup, %for.body15 ], [ 0, %for.body5 ]
  %mul16 = shl nsw i64 %j.0106, 1
  %arrayidx.sum = add i64 %mul16, %mul
  %arrayidx17 = getelementptr inbounds double* %u, i64 %arrayidx.sum
  %27 = load double* %arrayidx17, align 8, !tbaa !4
  %add20101 = or i64 %mul16, 1
  %arrayidx.sum102 = add i64 %add20101, %mul
  %arrayidx21 = getelementptr inbounds double* %u, i64 %arrayidx.sum102
  %28 = load double* %arrayidx21, align 8, !tbaa !4
  %mul22 = fmul double %conv18, %28
  %arrayidx11.sum = add i64 %mul16, %mul10
  %arrayidx24 = getelementptr inbounds double* %x, i64 %arrayidx11.sum
  %29 = load double* %arrayidx24, align 8, !tbaa !4
  %arrayidx11.sum103 = add i64 %add20101, %mul10
  %arrayidx27 = getelementptr inbounds double* %x, i64 %arrayidx11.sum103
  %30 = load double* %arrayidx27, align 8, !tbaa !4
  %mul28 = fmul double %27, %29
  %mul29 = fmul double %mul22, %30
  %sub30 = fsub double %mul28, %mul29
  %mul31 = fmul double %27, %30
  %mul32 = fmul double %mul22, %29
  %add33 = fadd double %mul32, %mul31
  %arrayidx8.sum = add i64 %mul16, %mul7
  %arrayidx35 = getelementptr inbounds double* %x, i64 %arrayidx8.sum
  %31 = load double* %arrayidx35, align 8, !tbaa !4
  %arrayidx8.sum104 = add i64 %add20101, %mul7
  %arrayidx38 = getelementptr inbounds double* %x, i64 %arrayidx8.sum104
  %32 = load double* %arrayidx38, align 8, !tbaa !4
  %sub39 = fsub double %31, %sub30
  store double %sub39, double* %arrayidx24, align 8, !tbaa !4
  %sub42 = fsub double %32, %add33
  store double %sub42, double* %arrayidx27, align 8, !tbaa !4
  %add46 = fadd double %31, %sub30
  store double %add46, double* %arrayidx35, align 8, !tbaa !4
  %add49 = fadd double %32, %add33
  store double %add49, double* %arrayidx38, align 8, !tbaa !4
  %inc = add nsw i64 %j.0106, 1
  %cmp13 = icmp slt i64 %inc, %div1
  %mul16_dup = shl nsw i64 %j.0106_dup, 1
  %arrayidx.sum_dup = add i64 %mul16_dup, %mul_dup
  %arrayidx17_dup = getelementptr inbounds double* %u_dup, i64 %arrayidx.sum_dup
  %33 = load double* %arrayidx17_dup, align 8, !tbaa !4
  %add20101_dup = or i64 %mul16_dup, 1
  %arrayidx.sum102_dup = add i64 %add20101_dup, %mul_dup
  %arrayidx21_dup = getelementptr inbounds double* %u_dup, i64 %arrayidx.sum102_dup
  %34 = load double* %arrayidx21_dup, align 8, !tbaa !4
  %mul22_dup = fmul double %conv18_dup, %34
  %arrayidx11.sum_dup = add i64 %mul16_dup, %mul10_dup
  %arrayidx24_dup = getelementptr inbounds double* %x_dup, i64 %arrayidx11.sum_dup
  %35 = load double* %arrayidx24_dup, align 8, !tbaa !4
  %arrayidx11.sum103_dup = add i64 %add20101_dup, %mul10_dup
  %arrayidx27_dup = getelementptr inbounds double* %x_dup, i64 %arrayidx11.sum103_dup
  %36 = load double* %arrayidx27_dup, align 8, !tbaa !4
  %mul28_dup = fmul double %33, %35
  %mul29_dup = fmul double %mul22_dup, %36
  %sub30_dup = fsub double %mul28_dup, %mul29_dup
  %mul31_dup = fmul double %33, %36
  %mul32_dup = fmul double %mul22_dup, %35
  %add33_dup = fadd double %mul32_dup, %mul31_dup
  %arrayidx8.sum_dup = add i64 %mul16_dup, %mul7_dup
  %arrayidx35_dup = getelementptr inbounds double* %x_dup, i64 %arrayidx8.sum_dup
  %37 = load double* %arrayidx35_dup, align 8, !tbaa !4
  %arrayidx8.sum104_dup = add i64 %add20101_dup, %mul7_dup
  %arrayidx38_dup = getelementptr inbounds double* %x_dup, i64 %arrayidx8.sum104_dup
  %38 = load double* %arrayidx38_dup, align 8, !tbaa !4
  %sub39_dup = fsub double %37, %sub30_dup
  store double %sub39_dup, double* %arrayidx24_dup, align 8, !tbaa !4
  %sub42_dup = fsub double %38, %add33_dup
  store double %sub42_dup, double* %arrayidx27_dup, align 8, !tbaa !4
  %add46_dup = fadd double %37, %sub30_dup
  store double %add46_dup, double* %arrayidx35_dup, align 8, !tbaa !4
  %add49_dup = fadd double %38, %add33_dup
  store double %add49_dup, double* %arrayidx38_dup, align 8, !tbaa !4
  %inc_dup = add nsw i64 %j.0106_dup, 1
  %cmp13_dup = icmp slt i64 %inc_dup, %div1_dup
  %j.0106_QED_CHECK_572 = icmp eq i64 %j.0106, %j.0106_dup
  %mul16_QED_CHECK_573 = icmp eq i64 %mul16, %mul16_dup
  %arrayidx.sum_QED_CHECK_574 = icmp eq i64 %arrayidx.sum, %arrayidx.sum_dup
  %add20101_QED_CHECK_575 = icmp eq i64 %add20101, %add20101_dup
  %arrayidx.sum102_QED_CHECK_576 = icmp eq i64 %arrayidx.sum102, %arrayidx.sum102_dup
  %mul22mul22 = fcmp oeq double %mul22, %mul22_dup
  %"arrayidx11.sum\00\00\00\00\00\00\00\90\03\00_578" = icmp eq i64 %arrayidx11.sum, %arrayidx11.sum_dup
  %arrayidx11.sum103_QED_CHECK_579 = icmp eq i64 %arrayidx11.sum103, %arrayidx11.sum103_dup
  %mul28_QED_CHECK_580 = fcmp oeq double %mul28, %mul28_dup
  %mul29_QED_CHECK_581 = fcmp oeq double %mul29, %mul29_dup
  %sub30_QED_CHECK_582 = fcmp oeq double %sub30, %sub30_dup
  %mul31_QED_CHECK_583 = fcmp oeq double %mul31, %mul31_dup
  %mul32_QED_CHECK_584 = fcmp oeq double %mul32, %mul32_dup
  %add33_QED_CHECK_585 = fcmp oeq double %add33, %add33_dup
  %arrayidx8.sum_QED_CHECK_586 = icmp eq i64 %arrayidx8.sum, %arrayidx8.sum_dup
  %arrayidx8.sum104_QED_CHECK_587 = icmp eq i64 %arrayidx8.sum104, %arrayidx8.sum104_dup
  %sub39_QED_CHECK_588 = fcmp oeq double %sub39, %sub39_dup
  %sub42_QED_CHECK_589 = fcmp oeq double %sub42, %sub42_dup
  %add46_QED_CHECK_590 = fcmp oeq double %add46, %add46_dup
  %add49_QED_CHECK_591 = fcmp oeq double %add49, %add49_dup
  %inc_QED_CHECK_592 = icmp eq i64 %inc, %inc_dup
  %cmp13_QED_CHECK_593 = icmp eq i1 %cmp13, %cmp13_dup
  %39 = and i1 %j.0106_QED_CHECK_572, %mul16_QED_CHECK_573
  %40 = and i1 %add20101_QED_CHECK_575, %arrayidx.sum102_QED_CHECK_576
  %41 = and i1 %arrayidx.sum_QED_CHECK_574, %40
  %42 = and i1 %39, %41
  %43 = and i1 %"arrayidx11.sum\00\00\00\00\00\00\00\90\03\00_578", %arrayidx11.sum103_QED_CHECK_579
  %44 = and i1 %mul22mul22, %43
  %45 = and i1 %mul29_QED_CHECK_581, %sub30_QED_CHECK_582
  %46 = and i1 %mul28_QED_CHECK_580, %45
  %47 = and i1 %44, %46
  %48 = and i1 %42, %47
  %49 = and i1 %mul31_QED_CHECK_583, %mul32_QED_CHECK_584
  %50 = and i1 %arrayidx8.sum_QED_CHECK_586, %arrayidx8.sum104_QED_CHECK_587
  %51 = and i1 %add33_QED_CHECK_585, %50
  %52 = and i1 %49, %51
  %53 = and i1 %sub42_QED_CHECK_589, %add46_QED_CHECK_590
  %54 = and i1 %sub39_QED_CHECK_588, %53
  %55 = and i1 %inc_QED_CHECK_592, %cmp13_QED_CHECK_593
  %56 = and i1 %add49_QED_CHECK_591, %55
  %57 = and i1 %54, %56
  %58 = and i1 %52, %57
  %for.body15_error = and i1 %48, %58
  call void @eddi_check_function(i1 %for.body15_error)
  br i1 %cmp13, label %for.body15, label %for.inc53

for.inc53:                                        ; preds = %for.body15, %for.body5
  %inc54 = add nsw i64 %k.0108, 1
  %exitcond = icmp eq i64 %inc54, %div
  %inc54_dup = add nsw i64 %k.0108_dup, 1
  %exitcond_dup = icmp eq i64 %inc54_dup, %div_dup
  %inc54_QED_CHECK_594 = icmp eq i64 %inc54, %inc54_dup
  %exitcond_QED_CHECK_595 = icmp eq i1 %exitcond, %exitcond_dup
  %for.inc53_error = and i1 %inc54_QED_CHECK_594, %exitcond_QED_CHECK_595
  call void @eddi_check_function(i1 %for.inc53_error)
  br i1 %exitcond, label %for.inc56, label %for.body5

for.inc56:                                        ; preds = %for.inc53, %for.body
  %inc57 = add nsw i64 %q.0110, 1
  %exitcond111 = icmp eq i64 %q.0110, %M
  %inc57_dup = add nsw i64 %q.0110_dup, 1
  %exitcond111_dup = icmp eq i64 %q.0110_dup, %M_dup
  %inc57_QED_CHECK_596 = icmp eq i64 %inc57, %inc57_dup
  %exitcond111_QED_CHECK_597 = icmp eq i1 %exitcond111, %exitcond111_dup
  %for.inc56_error = and i1 %inc57_QED_CHECK_596, %exitcond111_QED_CHECK_597
  call void @eddi_check_function(i1 %for.inc56_error)
  br i1 %exitcond111, label %for.end58, label %for.body

for.end58:                                        ; preds = %for.inc56, %for.cond.preheader
  ret void
}

define void @TwiddleOneCol(i64 %direction, i64 %direction_dup, i64 %n1, i64 %n1_dup, i64 %j, i64 %j_dup, double* %u, double* %u_dup, double* %x, double* %x_dup, i64 %pad_length, i64 %pad_length_dup) {
entry:
  %cmp46 = icmp sgt i64 %n1, 0
  %cmp46_dup = icmp sgt i64 %n1_dup, 0
  %cmp46_QED_CHECK_598 = icmp eq i1 %cmp46, %cmp46_dup
  call void @eddi_check_function(i1 %cmp46_QED_CHECK_598)
  br i1 %cmp46, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %add = add nsw i64 %pad_length, %n1
  %mul = mul nsw i64 %add, %j
  %conv = sitofp i64 %direction to double
  %add_dup = add nsw i64 %pad_length_dup, %n1_dup
  %mul_dup = mul nsw i64 %add_dup, %j_dup
  %conv_dup = sitofp i64 %direction_dup to double
  %add_QED_CHECK_599 = icmp eq i64 %add, %add_dup
  %mul_QED_CHECK_600 = icmp eq i64 %mul, %mul_dup
  %conv_QED_CHECK_601 = fcmp oeq double %conv, %conv_dup
  %0 = and i1 %mul_QED_CHECK_600, %conv_QED_CHECK_601
  %for.body.lr.ph_error = and i1 %add_QED_CHECK_599, %0
  call void @eddi_check_function(i1 %for.body.lr.ph_error)
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %i.047 = phi i64 [ 0, %for.body.lr.ph ], [ %inc, %for.body ]
  %i.047_dup = phi i64 [ 0, %for.body.lr.ph ], [ %inc_dup, %for.body ]
  %add1 = add nsw i64 %i.047, %mul
  %mul2 = shl nsw i64 %add1, 1
  %arrayidx = getelementptr inbounds double* %u, i64 %mul2
  %1 = load double* %arrayidx, align 8, !tbaa !4
  %add744 = or i64 %mul2, 1
  %arrayidx8 = getelementptr inbounds double* %u, i64 %add744
  %2 = load double* %arrayidx8, align 8, !tbaa !4
  %mul9 = fmul double %conv, %2
  %mul10 = shl nsw i64 %i.047, 1
  %arrayidx11 = getelementptr inbounds double* %x, i64 %mul10
  %3 = load double* %arrayidx11, align 8, !tbaa !4
  %add1345 = or i64 %mul10, 1
  %arrayidx14 = getelementptr inbounds double* %x, i64 %add1345
  %4 = load double* %arrayidx14, align 8, !tbaa !4
  %mul15 = fmul double %1, %3
  %mul16 = fmul double %mul9, %4
  %sub = fsub double %mul15, %mul16
  store double %sub, double* %arrayidx11, align 8, !tbaa !4
  %mul19 = fmul double %1, %4
  %mul20 = fmul double %mul9, %3
  %add21 = fadd double %mul20, %mul19
  store double %add21, double* %arrayidx14, align 8, !tbaa !4
  %inc = add nsw i64 %i.047, 1
  %exitcond = icmp eq i64 %inc, %n1
  %add1_dup = add nsw i64 %i.047_dup, %mul_dup
  %mul2_dup = shl nsw i64 %add1_dup, 1
  %arrayidx_dup = getelementptr inbounds double* %u_dup, i64 %mul2_dup
  %5 = load double* %arrayidx_dup, align 8, !tbaa !4
  %add744_dup = or i64 %mul2_dup, 1
  %arrayidx8_dup = getelementptr inbounds double* %u_dup, i64 %add744_dup
  %6 = load double* %arrayidx8_dup, align 8, !tbaa !4
  %mul9_dup = fmul double %conv_dup, %6
  %mul10_dup = shl nsw i64 %i.047_dup, 1
  %arrayidx11_dup = getelementptr inbounds double* %x_dup, i64 %mul10_dup
  %7 = load double* %arrayidx11_dup, align 8, !tbaa !4
  %add1345_dup = or i64 %mul10_dup, 1
  %arrayidx14_dup = getelementptr inbounds double* %x_dup, i64 %add1345_dup
  %8 = load double* %arrayidx14_dup, align 8, !tbaa !4
  %mul15_dup = fmul double %5, %7
  %mul16_dup = fmul double %mul9_dup, %8
  %sub_dup = fsub double %mul15_dup, %mul16_dup
  store double %sub_dup, double* %arrayidx11_dup, align 8, !tbaa !4
  %mul19_dup = fmul double %5, %8
  %mul20_dup = fmul double %mul9_dup, %7
  %add21_dup = fadd double %mul20_dup, %mul19_dup
  store double %add21_dup, double* %arrayidx14_dup, align 8, !tbaa !4
  %inc_dup = add nsw i64 %i.047_dup, 1
  %exitcond_dup = icmp eq i64 %inc_dup, %n1_dup
  %i.047_QED_CHECK_602 = icmp eq i64 %i.047, %i.047_dup
  %add1_QED_CHECK_603 = icmp eq i64 %add1, %add1_dup
  %mul2_QED_CHECK_604 = icmp eq i64 %mul2, %mul2_dup
  %add744_QED_CHECK_605 = icmp eq i64 %add744, %add744_dup
  %mul9mul9 = fcmp oeq double %mul9, %mul9_dup
  %mul10_QED_CHECK_607 = icmp eq i64 %mul10, %mul10_dup
  %add1345_QED_CHECK_608 = icmp eq i64 %add1345, %add1345_dup
  %mul15_QED_CHECK_609 = fcmp oeq double %mul15, %mul15_dup
  %mul16_QED_CHECK_610 = fcmp oeq double %mul16, %mul16_dup
  %sub_QED_CHECK_611 = fcmp oeq double %sub, %sub_dup
  %mul19_QED_CHECK_612 = fcmp oeq double %mul19, %mul19_dup
  %mul20_QED_CHECK_613 = fcmp oeq double %mul20, %mul20_dup
  %add21_QED_CHECK_614 = fcmp oeq double %add21, %add21_dup
  %inc_QED_CHECK_615 = icmp eq i64 %inc, %inc_dup
  %exitcond_QED_CHECK_616 = icmp eq i1 %exitcond, %exitcond_dup
  %9 = and i1 %add1_QED_CHECK_603, %mul2_QED_CHECK_604
  %10 = and i1 %i.047_QED_CHECK_602, %9
  %11 = and i1 %add744_QED_CHECK_605, %mul9mul9
  %12 = and i1 %mul10_QED_CHECK_607, %add1345_QED_CHECK_608
  %13 = and i1 %11, %12
  %14 = and i1 %10, %13
  %15 = and i1 %mul15_QED_CHECK_609, %mul16_QED_CHECK_610
  %16 = and i1 %sub_QED_CHECK_611, %mul19_QED_CHECK_612
  %17 = and i1 %15, %16
  %18 = and i1 %mul20_QED_CHECK_613, %add21_QED_CHECK_614
  %19 = and i1 %inc_QED_CHECK_615, %exitcond_QED_CHECK_616
  %20 = and i1 %18, %19
  %21 = and i1 %17, %20
  %for.body_error = and i1 %14, %21
  call void @eddi_check_function(i1 %for.body_error)
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body, %entry
  ret void
}

define void @Scale(i64 %n1, i64 %n1_dup, i64 %N, i64 %N_dup, double* %x, double* %x_dup) {
entry:
  %cmp11 = icmp sgt i64 %n1, 0
  %cmp11_dup = icmp sgt i64 %n1_dup, 0
  %cmp11_QED_CHECK_617 = icmp eq i1 %cmp11, %cmp11_dup
  call void @eddi_check_function(i1 %cmp11_QED_CHECK_617)
  br i1 %cmp11, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %conv = sitofp i64 %N to double
  %conv_dup = sitofp i64 %N_dup to double
  %conv_QED_CHECK_618 = fcmp oeq double %conv, %conv_dup
  call void @eddi_check_function(i1 %conv_QED_CHECK_618)
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %i.012 = phi i64 [ 0, %for.body.lr.ph ], [ %inc, %for.body ]
  %i.012_dup = phi i64 [ 0, %for.body.lr.ph ], [ %inc_dup, %for.body ]
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
  %mul_dup = shl nsw i64 %i.012_dup, 1
  %arrayidx_dup = getelementptr inbounds double* %x_dup, i64 %mul_dup
  %2 = load double* %arrayidx_dup, align 8, !tbaa !4
  %div_dup = fdiv double %2, %conv_dup
  store double %div_dup, double* %arrayidx_dup, align 8, !tbaa !4
  %add10_dup = or i64 %mul_dup, 1
  %arrayidx3_dup = getelementptr inbounds double* %x_dup, i64 %add10_dup
  %3 = load double* %arrayidx3_dup, align 8, !tbaa !4
  %div4_dup = fdiv double %3, %conv_dup
  store double %div4_dup, double* %arrayidx3_dup, align 8, !tbaa !4
  %inc_dup = add nsw i64 %i.012_dup, 1
  %exitcond_dup = icmp eq i64 %inc_dup, %n1_dup
  %i.012_QED_CHECK_619 = icmp eq i64 %i.012, %i.012_dup
  %mul_QED_CHECK_620 = icmp eq i64 %mul, %mul_dup
  %div_QED_CHECK_621 = fcmp oeq double %div, %div_dup
  %add10_QED_CHECK_622 = icmp eq i64 %add10, %add10_dup
  %div4_QED_CHECK_623 = fcmp oeq double %div4, %div4_dup
  %inc_QED_CHECK_624 = icmp eq i64 %inc, %inc_dup
  %exitcond_QED_CHECK_625 = icmp eq i1 %exitcond, %exitcond_dup
  %4 = and i1 %mul_QED_CHECK_620, %div_QED_CHECK_621
  %5 = and i1 %i.012_QED_CHECK_619, %4
  %6 = and i1 %add10_QED_CHECK_622, %div4_QED_CHECK_623
  %7 = and i1 %inc_QED_CHECK_624, %exitcond_QED_CHECK_625
  %8 = and i1 %6, %7
  %for.body_error = and i1 %5, %8
  call void @eddi_check_function(i1 %for.body_error)
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body, %entry
  ret void
}

define void @CopyColumn(i64 %n1, i64 %n1_dup, double* %src, double* %src_dup, double* %dest, double* %dest_dup) {
entry:
  %cmp16 = icmp sgt i64 %n1, 0
  %cmp16_dup = icmp sgt i64 %n1_dup, 0
  %cmp16_QED_CHECK_626 = icmp eq i1 %cmp16, %cmp16_dup
  call void @eddi_check_function(i1 %cmp16_QED_CHECK_626)
  br i1 %cmp16, label %for.body, label %for.end

for.body:                                         ; preds = %for.body, %entry
  %i.017 = phi i64 [ %inc, %for.body ], [ 0, %entry ]
  %i.017_dup = phi i64 [ %inc_dup, %for.body ], [ 0, %entry ]
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
  %mul_dup = shl nsw i64 %i.017_dup, 1
  %arrayidx_dup = getelementptr inbounds double* %src_dup, i64 %mul_dup
  %2 = load double* %arrayidx_dup, align 8, !tbaa !4
  %arrayidx2_dup = getelementptr inbounds double* %dest_dup, i64 %mul_dup
  store double %2, double* %arrayidx2_dup, align 8, !tbaa !4
  %add15_dup = or i64 %mul_dup, 1
  %arrayidx4_dup = getelementptr inbounds double* %src_dup, i64 %add15_dup
  %3 = load double* %arrayidx4_dup, align 8, !tbaa !4
  %arrayidx7_dup = getelementptr inbounds double* %dest_dup, i64 %add15_dup
  store double %3, double* %arrayidx7_dup, align 8, !tbaa !4
  %inc_dup = add nsw i64 %i.017_dup, 1
  %exitcond_dup = icmp eq i64 %inc_dup, %n1_dup
  %i.017_QED_CHECK_627 = icmp eq i64 %i.017, %i.017_dup
  %mul_QED_CHECK_628 = icmp eq i64 %mul, %mul_dup
  %add15add15 = icmp eq i64 %add15, %add15_dup
  %inc_QED_CHECK_630 = icmp eq i64 %inc, %inc_dup
  %exitcond_QED_CHECK_631 = icmp eq i1 %exitcond, %exitcond_dup
  %4 = and i1 %i.017_QED_CHECK_627, %mul_QED_CHECK_628
  %5 = and i1 %inc_QED_CHECK_630, %exitcond_QED_CHECK_631
  %6 = and i1 %add15add15, %5
  %for.body_error = and i1 %4, %6
  call void @eddi_check_function(i1 %for.body_error)
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body, %entry
  ret void
}

define void @Reverse(i64 %N, i64 %N_dup, i64 %M, i64 %M_dup, double* %x, double* %x_dup) {
entry:
  %cmp41 = icmp sgt i64 %N, 0
  %cmp41_dup = icmp sgt i64 %N_dup, 0
  %cmp41_QED_CHECK_632 = icmp eq i1 %cmp41, %cmp41_dup
  call void @eddi_check_function(i1 %cmp41_QED_CHECK_632)
  br i1 %cmp41, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %cmp3.i = icmp sgt i64 %M, 0
  %cmp3.i_dup = icmp sgt i64 %M_dup, 0
  %cmp3.i_QED_CHECK_633 = icmp eq i1 %cmp3.i, %cmp3.i_dup
  call void @eddi_check_function(i1 %cmp3.i_QED_CHECK_633)
  br label %for.body

for.body:                                         ; preds = %for.inc, %for.body.lr.ph
  %k.042 = phi i64 [ 0, %for.body.lr.ph ], [ %inc, %for.inc ]
  %k.042_dup = phi i64 [ 0, %for.body.lr.ph ], [ %inc_dup, %for.inc ]
  %k.042_QED_CHECK_634 = icmp eq i64 %k.042, %k.042_dup
  call void @eddi_check_function(i1 %k.042_QED_CHECK_634)
  br i1 %cmp3.i, label %for.body.i, label %BitReverse.exit

for.body.i:                                       ; preds = %for.body.i, %for.body
  %tmp.06.i = phi i64 [ %shr.i, %for.body.i ], [ %k.042, %for.body ]
  %j.05.i = phi i64 [ %add.i, %for.body.i ], [ 0, %for.body ]
  %i.04.i = phi i64 [ %inc.i, %for.body.i ], [ 0, %for.body ]
  %tmp.06.i_dup = phi i64 [ %shr.i_dup, %for.body.i ], [ %k.042_dup, %for.body ]
  %j.05.i_dup = phi i64 [ %add.i_dup, %for.body.i ], [ 0, %for.body ]
  %i.04.i_dup = phi i64 [ %inc.i_dup, %for.body.i ], [ 0, %for.body ]
  %mul.i = shl nsw i64 %j.05.i, 1
  %and.i = and i64 %tmp.06.i, 1
  %add.i = or i64 %mul.i, %and.i
  %shr.i = ashr i64 %tmp.06.i, 1
  %inc.i = add nsw i64 %i.04.i, 1
  %exitcond.i = icmp eq i64 %inc.i, %M
  %mul.i_dup = shl nsw i64 %j.05.i_dup, 1
  %and.i_dup = and i64 %tmp.06.i_dup, 1
  %add.i_dup = or i64 %mul.i_dup, %and.i_dup
  %shr.i_dup = ashr i64 %tmp.06.i_dup, 1
  %inc.i_dup = add nsw i64 %i.04.i_dup, 1
  %exitcond.i_dup = icmp eq i64 %inc.i_dup, %M_dup
  %tmp.06.i_QED_CHECK_635 = icmp eq i64 %tmp.06.i, %tmp.06.i_dup
  %j.05.i_QED_CHECK_636 = icmp eq i64 %j.05.i, %j.05.i_dup
  %i.04.i_QED_CHECK_637 = icmp eq i64 %i.04.i, %i.04.i_dup
  %mul.i_QED_CHECK_638 = icmp eq i64 %mul.i, %mul.i_dup
  %and.i_QED_CHECK_639 = icmp eq i64 %and.i, %and.i_dup
  %add.i_QED_CHECK_640 = icmp eq i64 %add.i, %add.i_dup
  %shr.i_QED_CHECK_641 = icmp eq i64 %shr.i, %shr.i_dup
  %inc.i_QED_CHECK_642 = icmp eq i64 %inc.i, %inc.i_dup
  %exitcond.i_QED_CHECK_643 = icmp eq i1 %exitcond.i, %exitcond.i_dup
  %0 = and i1 %tmp.06.i_QED_CHECK_635, %j.05.i_QED_CHECK_636
  %1 = and i1 %i.04.i_QED_CHECK_637, %mul.i_QED_CHECK_638
  %2 = and i1 %0, %1
  %3 = and i1 %and.i_QED_CHECK_639, %add.i_QED_CHECK_640
  %4 = and i1 %inc.i_QED_CHECK_642, %exitcond.i_QED_CHECK_643
  %5 = and i1 %shr.i_QED_CHECK_641, %4
  %6 = and i1 %3, %5
  %for.body.i_error = and i1 %2, %6
  call void @eddi_check_function(i1 %for.body.i_error)
  br i1 %exitcond.i, label %BitReverse.exit, label %for.body.i

BitReverse.exit:                                  ; preds = %for.body.i, %for.body
  %j.0.lcssa.i = phi i64 [ 0, %for.body ], [ %add.i, %for.body.i ]
  %j.0.lcssa.i_dup = phi i64 [ 0, %for.body ], [ %add.i_dup, %for.body.i ]
  %cmp1 = icmp sgt i64 %j.0.lcssa.i, %k.042
  %cmp1_dup = icmp sgt i64 %j.0.lcssa.i_dup, %k.042_dup
  %j.0.lcssa.i_QED_CHECK_644 = icmp eq i64 %j.0.lcssa.i, %j.0.lcssa.i_dup
  %cmp1_QED_CHECK_645 = icmp eq i1 %cmp1, %cmp1_dup
  %BitReverse.exit_error = and i1 %j.0.lcssa.i_QED_CHECK_644, %cmp1_QED_CHECK_645
  call void @eddi_check_function(i1 %BitReverse.exit_error)
  br i1 %cmp1, label %if.then, label %for.inc

if.then:                                          ; preds = %BitReverse.exit
  %mul = shl nsw i64 %j.0.lcssa.i, 1
  %arrayidx = getelementptr inbounds double* %x, i64 %mul
  %7 = load double* %arrayidx, align 8, !tbaa !4
  %mul2 = shl nsw i64 %k.042, 1
  %arrayidx3 = getelementptr inbounds double* %x, i64 %mul2
  %8 = load double* %arrayidx3, align 8, !tbaa !4
  store double %8, double* %arrayidx, align 8, !tbaa !4
  store double %7, double* %arrayidx3, align 8, !tbaa !4
  %add39 = or i64 %mul, 1
  %arrayidx11 = getelementptr inbounds double* %x, i64 %add39
  %9 = load double* %arrayidx11, align 8, !tbaa !4
  %add1340 = or i64 %mul2, 1
  %arrayidx14 = getelementptr inbounds double* %x, i64 %add1340
  %10 = load double* %arrayidx14, align 8, !tbaa !4
  store double %10, double* %arrayidx11, align 8, !tbaa !4
  store double %9, double* %arrayidx14, align 8, !tbaa !4
  %mul_dup = shl nsw i64 %j.0.lcssa.i_dup, 1
  %arrayidx_dup = getelementptr inbounds double* %x_dup, i64 %mul_dup
  %11 = load double* %arrayidx_dup, align 8, !tbaa !4
  %mul2_dup = shl nsw i64 %k.042_dup, 1
  %arrayidx3_dup = getelementptr inbounds double* %x_dup, i64 %mul2_dup
  %12 = load double* %arrayidx3_dup, align 8, !tbaa !4
  store double %12, double* %arrayidx_dup, align 8, !tbaa !4
  store double %11, double* %arrayidx3_dup, align 8, !tbaa !4
  %add39_dup = or i64 %mul_dup, 1
  %arrayidx11_dup = getelementptr inbounds double* %x_dup, i64 %add39_dup
  %13 = load double* %arrayidx11_dup, align 8, !tbaa !4
  %add1340_dup = or i64 %mul2_dup, 1
  %arrayidx14_dup = getelementptr inbounds double* %x_dup, i64 %add1340_dup
  %14 = load double* %arrayidx14_dup, align 8, !tbaa !4
  store double %14, double* %arrayidx11_dup, align 8, !tbaa !4
  store double %13, double* %arrayidx14_dup, align 8, !tbaa !4
  %mul_QED_CHECK_646 = icmp eq i64 %mul, %mul_dup
  %mul2_QED_CHECK_647 = icmp eq i64 %mul2, %mul2_dup
  %add39_QED_CHECK_648 = icmp eq i64 %add39, %add39_dup
  %add1340add1340 = icmp eq i64 %add1340, %add1340_dup
  %15 = and i1 %mul_QED_CHECK_646, %mul2_QED_CHECK_647
  %16 = and i1 %add39_QED_CHECK_648, %add1340add1340
  %if.then_error = and i1 %15, %16
  call void @eddi_check_function(i1 %if.then_error)
  br label %for.inc

for.inc:                                          ; preds = %if.then, %BitReverse.exit
  %inc = add nsw i64 %k.042, 1
  %exitcond = icmp eq i64 %inc, %N
  %inc_dup = add nsw i64 %k.042_dup, 1
  %exitcond_dup = icmp eq i64 %inc_dup, %N_dup
  %inc_QED_CHECK_650 = icmp eq i64 %inc, %inc_dup
  %exitcond_QED_CHECK_651 = icmp eq i1 %exitcond, %exitcond_dup
  %for.inc_error = and i1 %inc_QED_CHECK_650, %exitcond_QED_CHECK_651
  call void @eddi_check_function(i1 %for.inc_error)
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.inc, %entry
  ret void
}

; Function Attrs: nounwind ssp uwtable
define i32 @main(i32 %argc, i8** %argv) #5 {
entry:
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([7 x i8]* @str74, i64 0, i64 0))
  %puts_dup = tail call i32 @puts(i8* getelementptr inbounds ([7 x i8]* @str74_dup, i64 0, i64 0))
  %0 = call <{ i32, i32 }> @fft_compute(i32 %argc, i32 %argc, i8** %argv, i8** %argv)
  %1 = extractvalue <{ i32, i32 }> %0, 0
  %2 = extractvalue <{ i32, i32 }> %0, 1
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @putchar(i32) #6

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture) #6

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) #6

define void @eddi_check_function(i1) {
entry:
  br i1 %0, label %return_block, label %exit_block

return_block:                                     ; preds = %exit_block, %entry
  ret void

exit_block:                                       ; preds = %entry
  %1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @EDDI_error_msg, i32 0, i32 0)) #6
  call void @exit(i32 1) #6
  br label %return_block
}

attributes #0 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind ssp uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }
attributes #8 = { nounwind readnone }

!0 = metadata !{metadata !"long", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA"}
!3 = metadata !{metadata !"any pointer", metadata !1}
!4 = metadata !{metadata !"double", metadata !1}
