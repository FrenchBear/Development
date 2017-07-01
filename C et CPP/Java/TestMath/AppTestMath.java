//
//
// AppTestMath
//
//
public class AppTestMath 
{
	public static void main(String args[])
	{
		double	inf = 1/0.0;
		double	nan = Math.sqrt(-1.0);
		double	x = inf * 0;

		System.out.println(inf);
		System.out.println(nan);
		System.out.println(x);
	}

}

