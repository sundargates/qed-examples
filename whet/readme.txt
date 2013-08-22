This file, whets.c, is a benchmark program that fails when EDDI is run on it, though CFCSS
is fine. As far as I understand, this happens for two reasons: first, a function call that
modifies a struct is not copied (which is normal behavior, as most function calls aren't
copied). However, even if this instruction is cloned by hand, the program still fails. I
suspect this is because the program calls getrusage(), which gives information on the
resource usage of a program, which changes quickly enough to cause the two called values
to differ.

For a related example, there is also timer.c, which also fails with EDDI. However, in this
case, once the function call to gettimeofday() is duplicated in the LLVM IR, it works as
intended.

Since there are many such edge cases and tricks hidden in system calls and library functions,
this example shouldn't be taken as an error we need to fix, but just as an example of
what we aren't as worried about.

Following are the relevant lines of whets.c and the LLVM assembly. The call that generates
the error is on line 901 of whets.c, and corresponds to line 4632 of the assembly.

895 struct rusage rusage;
896 
897 SPDP dtime()
898 {
899  SPDP q;
900 
901  getrusage(RUSAGE_SELF,&rusage);
902 
903  q = (SPDP)(rusage.ru_utime.tv_sec);
904  q = q + (SPDP)(rusage.ru_utime.tv_usec) * 1.0e-06;
905 
906  return q;
907 }

The assembly seen here (especially the specific line numbers) was compiled at -O3 and with
QED-Mode=ALL. This was compiled with my version of CFCSS, which adds checks at function
boundaries, so if these line numbers don't correspond to yours, look for a function called
@dtime().

The error occurs on line 4632, which is not duplicated (and duplicating it doesn't fix the
error). Then, at line 4669, @eddi_check_function is invoked and raises failure.

4623   %retval = alloca float
4624   %retval_dup = alloca float4625   %24 = alloca float
4626   %25 = alloca float4627   %q = alloca float
4628   %q_dup = alloca float
4629   %"alloca point" = bitcast i32 0 to i32
4630   %"alloca point_dup" = bitcast i32 0 to i32
4631   store i32 104, i32* @LAST_GLOBAL_CFTSS_ID
4632   %26 = call i32 @getrusage(i32 0, %struct.rusage* @rusage) #1
4633   %27 = load i64* getelementptr inbounds (%struct.rusage* @rusage, i64 0, i
		     32 0, i32 0), align 8
4634   %28 = load i64* getelementptr inbounds (%struct.rusage* @rusage_dup, i64 
		     0, i32 0, i32 0), align 8

...

4663   %51 = load float* %24, align 4
4664   %52 = load float* %25, align 4
4665   store float %51, float* %retval, align 4
4666   store float %52, float* %retval_dup, align 4
4667   %entry_error = or i1 %43, %46
4668   store i32 104, i32* @LAST_GLOBAL_CFTSS_ID
4669   call void @eddi_check_function(i1 %entry_error)
4670   br label %return

