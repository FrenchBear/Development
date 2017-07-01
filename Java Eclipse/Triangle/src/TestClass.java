
public class TestClass {

	static int stprop;
	static final int p2;
	
	final int infi;			// Can only be set in constructor
	
	static
	{
		stprop=1;
		p2 = 7;
	}
	
	// Constructor
	TestClass()
	{
		stprop = 5;
		//p2 = 8;
		infi = 5;
	}
	
	void Method(int... ti)
	{
		int sum=0;
		for(int i=0 ; i<ti.length ; i++)
			sum+=ti[i];
		stprop = 3;
		//p2 = 12;
		//infi = 6;
		
		int j=ti[0];
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		

	}

}
