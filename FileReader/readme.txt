This program is one on which EDDI fails. It does so because file reading routines aren't
copied, so the checks on duplicate instructions don't work. This isn't really something
we want to worry about, but it's still an interesting example. Specifically, even if it were
fixed, there are lots of other ways EDDI could go wrong, by calling some other sort of
instruction that isn't duplicated in increasingly more complicated programs.

It still works fine for CFCSS and CFTSS, however.
