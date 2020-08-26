module Characters;

import std.stdio;

int main()
{
	string s1 = "Aé♫山𝄞🐗";
	writeln(s1);
	writeln("s1.l=", s1.length);
	foreach (char c; s1) {
		printf("%02x ", ubyte(c));
	}
	writeln('\n');

	wstring s2 = "Aé♫山𝄞🐗";
	writeln(s2);
	writeln("s2.l=", s2.length);
	foreach (wchar c; s1) {
		printf("%04x ", ushort(c));
	}
	writeln('\n');

	dstring s3 = "Aé♫山𝄞🐗";
	writeln(s3);
	writeln("s3.l=", s3.length);
	foreach (dchar c; s1) {
		printf("%08x ", uint(c));
	}
	writeln('\n');

	char a1 = 'A';
	char a2 = 65;
	char a3 = '\x41';

	wchar e1 = '€';
	wchar e2 = 0x20AC;
	wchar e3 = '\u20ac';
	wchar e4 = '\&euro;';

	dchar k1 = '𝄞';
	dchar k2 = 0x1d11e;
	dchar k3 = '\U0001d11e';

	writeln(a1,a2,a3);
	writeln(e1,e2,e3,e4);
	writeln(k1,k2,k3);
	writeln('\n');

	writeln("\x1b[31mColor\x1b[37m");
	writeln("\x1b[30;42mColor\x1b[37;40m");

	//char cend;
	//write("(Pause)");
	//readf("%c", &cend);
	return 0;
}
