// Vietnamese puzzle Java
// Solver for a problem published in the Guardian
// http://www.theguardian.com/science/alexs-adventures-in-numberland/2015/may/20/can-you-do-the-maths-puzzle-for-vietnamese-eight-year-olds-that-has-stumped-parents-and-teachers
// All you need to do is place the digits from 1 to 9 in the grid.
//
// 2015-05-22    PV     Java version

/* Output (on HIGGS):
1.0, 2.0, 6.0, 4.0, 7.0, 8.0, 3.0, 5.0, 9.0, 
1.0, 2.0, 6.0, 4.0, 7.0, 8.0, 5.0, 3.0, 9.0, 
1.0, 3.0, 2.0, 4.0, 5.0, 8.0, 7.0, 9.0, 6.0, 
1.0, 3.0, 2.0, 4.0, 5.0, 8.0, 9.0, 7.0, 6.0, 

...
9.0, 8.0, 6.0, 2.0, 4.0, 1.0, 5.0, 7.0, 3.0, 
9.0, 8.0, 6.0, 2.0, 4.0, 1.0, 7.0, 5.0, 3.0, 
128  solution(s) found
362880 permutations analyzed in 0.18s
*/
import java.util.Arrays;
import java.util.List;


public class VP {

    public static void main(String[] args) {
     // For Vietnamese puzzle we have to use the digits from 1 to 9
        List<Double> t = Arrays.asList(1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0 );
        int np = 0;                  // Number of permutations
        int ns = 0;                  // Number of solutions
        long start = System.currentTimeMillis();
        for (List<Double> x: new Permutator<Double>(t))
        {
            np++;
            if (x.get(0) + 13.0 * x.get(1) / x.get(2) + x.get(3) + 12.0 * x.get(4) - x.get(5) - 11.0 + x.get(6) * x.get(7) / x.get(8) - 10.0 == 66.0)
            {
                // Found a solution!
                for (Double d: x)
                {
                    System.out.print(d);
                    System.out.print(", ");
                }
                System.out.println();
                ns++;
            }
        }
        long duration = System.currentTimeMillis()-start;
        System.out.printf("%d  solution(s) found\n", ns);
        System.out.printf("%d permutations analyzed in %1.2fs\n", np, duration/1000.0);

        // Just check that the number of permutations is equal to 9!
        if (np != fact(t.size()))
            System.out.println("We have a problem!");
    }
    
    // Quick and dirty factorial
    static long fact(long n)
    {
        return n <= 2 ? n : n * fact(n - 1);
    }
}