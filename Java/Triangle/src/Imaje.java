// Image class
// Learn Java for Android development p. 65
// 2014-03-26	PV


public class Imaje 
{
	Imaje()
	{
		System.out.println("Imaje() called");
	}
	
	Imaje(String filename)
	{
		this(filename, null);
		System.out.printf("Imaje(\"%s\") called\n", filename);
	}
	
	Imaje(String filename, String imajeType)
	{
		System.out.printf("Imaje(\"%s\", \"%s\") called\n", filename, imajeType);
		if (filename != null)
		{
			System.out.println("Reading " + filename);
			if (imajeType != null)
				System.out.println("Interpreting " + filename + " as storing a " +
						imajeType + " Imaje");
		}
	}
	
	
	// For tests
	public static void main(String[] args) {
		System.out.println("Main of Imaje\n");
		
		Imaje im;
		im = new Imaje();
		System.out.println();
		im = new Imaje("image.png");
		System.out.println();
		im = new Imaje("image.png", "PNG");
	}
}
