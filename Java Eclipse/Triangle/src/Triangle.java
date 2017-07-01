
public class Triangle {

	static
	{
		System.out.println("static initializer");
	}
	
	{
		System.out.println("instance initializer");
	}
	
	Triangle()
	{
		System.out.println("constructor");
		
		char gradeLetters[] = { 'A', 'B', 'C', 'D', 'F' };
		char[] gradeLetters2 = { 'A', 'B', 'C', 'D', 'F' };
		
		double[][] temperatures = new double[3][2];
		
		double[][] t1 = new double[3][];
		for (int row = 0; row < t1.length; row++)
			t1[row] = new double[2+row];
		
		String[ ] letters = new String[] { "A", "B" };
	}
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		int n=10;	// number of lines
		for(int i=0 ; i<n ; i++)
		{
			for (int j=i;j<n;j++)
				System.out.print(' ');
			for (int j=i;j<3*i+1;j++)
				System.out.print('*');
			System.out.println();
		}
		
		System.out.println();
		Triangle t = new Triangle();
	}

}


		