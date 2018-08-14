import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

/**
 * Dump all command-line arguments to standard output.
 * @author Pierre Violent
 */

public class DumpArgs {

	/** 
	 * Application Entry Point
	 * 
	 * @param args array of command-line arguments passed to this method
	 * @throws IOException
	 */
	public static void main(String[] args) throws IOException {
		System.out.println("Passed arguments:");
		for (int i = 0; i < args.length; i++)
			System.out.println(args[i]);
		double r = Math.sqrt(2.0);
		System.out.print("√2 = ");		// Unicode character
		System.out.println(r);
		//System.out.print("(pause)");
		//System.in.read();
		
		Date d = null;
		Calendar cal = GregorianCalendar.getInstance();
		cal.set(1965, 2, 26);
		d = cal.getTime();
		System.out.println(d);
		
		int j = 30000+25000;
		Object o = j;
		int k = (int) o;
		short sh = (short) j;			// No warning
		
		int[] t1 = new int[10];
		int t2[] = new int[10];
		
		int[][] t4 = new int[2][];
		t4[0] = new int[3];
		t4[1] = new int[5];
		//t4[2] = new int[7];
		
		int[] ages = { 48, 57 };
		
		String myString = "The quick brown fox";
		
        char c = '♫';
        String s1 = "📺";					// TV U+1F4FA as a direct character
        String s2 = "\uD83D\uDCFA";			// TV U+1F4FA with UTF-16 surrogates
        System.out.println(s1.length());
        System.out.println(s1==s2);			// True
	}
	
	public static int $€π()
	{
		int σύμφωνο = 1;
		int συμβίωσης = 2;
		int is = 3;
		int as = 4;
		int of = 5;
		int go = 6;
		double π = Math.PI;
		
		return σύμφωνο+συμβίωσης+is+as+of+go;
	}
}
