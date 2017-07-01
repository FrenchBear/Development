/****************************************************************************
 -- PC Week Labs Float Divide Verification Test Suite (c)PC Week, 1994
 -- Program FDV.EXE
 --
 -- This program attempts to verify IBM's reported Pentium error rates
 -- in floating-point divisions using ratios of small decimal values
 --
 -- Program exhaustively tests all n.m cases not requiring a division by zero
 -- and not (trivially) using a zero in a numerator
 --
 -- Test designed by Peter Coffee, PC Week Labs
 -- Translated to C from the original Ada by Eamonn Sullivan, PC Week Labs
 --
 -- Suite may be freely distributed but may not be sold
 -- Attributions may not be removed from source code or output
 
------------------------------------------------------------------------------
Compatibility Notes
 
When using the Visual C++ 1.51 compiler under Windows 3.x, you must add the
/Op ("improve float consistency" in the Project settings) option when
compiling the "release" version.  VC++ appears to silently reduce precision
when "Full Optimization" is turned on.
 
The Watcom C/C++ compiler was also tested with all optimizations disabled
due to similar observed effects with its default optimizations. PC Week Labs has attempted to determine the best possible combination of optimizations that
does not suppress some known errors.
 
We have tested this code with the following compilers and operating systems:
 
 -- GNU C++ under SunOS 4.1.3 (on a Sparcstation) and under Linux
 -- Watcom C386 9.0 and Microsoft Visual C++ 1.50 and 1.51 under DOS 6.2
 -- Hewlett-Packard's C compiler under HP/UX (on a PA720 processor)
 -- Watcom C/C++ 10.0 under OS/2 2.1
 
------------------------------------------------------------------------------
*/
 
 
#include <stdio.h>
#include <math.h>
 
/* variables to test well-known ratio revealing Pentium bug */
 
double TestNum, TestDen, TestVal;
 
/* variables to test financial problem in IBM Pentium Study */
 
double YearsPerMonth, TaxRate, Tax, TakeHome, JobYears, PerAnnum;
 
/* variables to generate and test small decimal quotients */
 
double Num1, Num2, Den1, Quo1, Den2, Quo2, Dif;
unsigned long Trials = 0;
unsigned long Errors = 0;
 
/* loop counters for quotient components */
 
int i, j, k, l;
 
/* declaration for error threshold (added in C, not needed in Ada) */
 
double LSBError;
 
/****************************************************************************/
 
void main()
 
{
 
printf("PC Week Labs Float Divide Verification Suite (c)PC Week, 1994\n\n");
 
/*
 -----------------------------------------------------------------------------
 
  -- Brief verification that we're on a buggy chip:
  -- Set up for well-known calculation that shows an error in the
  -- fifteenth bit of the binary result
 
 -----------------------------------------------------------------------------
*/
 
TestNum= (double) 4195835.0;
TestDen= (double) 3145727.0;
 
printf("On accurate machines, the following is 0:           %g\n\n",
                                 ((TestNum/TestDen)*TestDen - TestNum));
 
/*
 -----------------------------------------------------------------------------
 
  -- Set up to verify IBM example:
  -- The next six values verify the IBM report's example
  -- of non-trivial errors in a realistic financial calculation
 
 -----------------------------------------------------------------------------
*/
 
YearsPerMonth = 0.083333333;
TaxRate       = 0.1466667;
Tax           = 96000.0 * TaxRate;
TakeHome      = 96000.0 - Tax;
JobYears      = 22.5 * YearsPerMonth;
PerAnnum      = TakeHome / JobYears;
 
printf("On accurate machines, the following is 43,690.6651: %.4f\n\n",
                                                           PerAnnum);
 
/* define tolerable least-significant-bit error */
 
LSBError = pow(2,-46);
 
printf("Suppressing errors of magnitude not greater than %8.5e\n\n",LSBError);
printf("Testing quotients of form (a/b)/(c/d): a,b,c,d in [0.1,9.9] by 0.1\n\n");
printf("Value of \"a\" is printed when incremented as progress check\n\n");
printf("Output format is \"error: a, b, c, d\"\n\n");
 
for(i = 1; i < 100; i++)
 
  {
    Num1 = (double) (i/10.0);
    printf("%.1f\n", Num1);              /* this tracks error-free regions */
 
    for (j=1; j < 100; j++)
      {
        Den1 = (double) (j / 10.0);
        Quo1 = (double) Num1 / Den1;
 
        for(k=1; k < 100; k++)
          {
            Num2 = (double) (k / 10.0);
 
            for(l=1; l < 100; l++)
              {
                Den2 = (double) (l / 10.0);
                Quo2 = (double) Num2/Den2;
 
                Trials++;
 
                Dif = ((Quo1 / Quo2) * Quo2) - Quo1;
 
                if (fabs(Dif) > LSBError)
                  {
                    Errors++;
                    printf("Error is %8.5e: %3.1f, %3.1f, %3.1f, %3.1f\n",
                                      Dif,   Num1,  Den1,  Num2,  Den2);
                  }
              }
          }
      }
  }
 
printf("%lu errors in %lu trials.\n", Errors, Trials);
 
}
 
