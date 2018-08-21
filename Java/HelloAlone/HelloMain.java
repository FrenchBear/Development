// Example of simple 2-file configuration that works with Visual Studio Code 

import java.io.*;

public class HelloMain {

	private static void UTF8Mode() throws Exception
	{
		// UTF-8 support
		System.setOut(new PrintStream(new FileOutputStream(FileDescriptor.out), true, "UTF-8"));
		ProcessBuilder pb = new ProcessBuilder("cmd.exe", "/c", "chcp", "65001").inheritIO();
		Process p = pb.start();
		p.waitFor();
	}

	public static void main(String[] args) throws Exception {
		UTF8Mode();

		Squarer sq = new Squarer();
		double s = sq.Square(3);
		System.out.printf("Hello♫♫ 3²=%f\n", s);
	}
}
