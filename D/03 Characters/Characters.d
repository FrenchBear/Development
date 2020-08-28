module Characters;

import std.stdio, std.process, std.uni;
import std.range.primitives : walkLength;

int main()
{
	// Does not work for windows terminal...
	auto result = ["cmd",  "/c", "chcp", "65001"].execute;

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
	writeln();
	auto gs2 = s2.byGrapheme;
	writeln("gs2.wl:", gs2.walkLength);
	writeln();

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
	writeln('\n');

	// Simple corners
	static wstring[] cornersS = [
		" ", // ----
		"│", // U--- = UD
		"─", // -R-- = RL
		"└", // UR--
		"│", // --D- = UD
		"│", // U-D-
		"┌", // -RD-
		"├", // URD-
		"─", // ---L = RL
		"┘", // U--L
		"─", // -R-L
		"┴", // UR-L
		"┐", // --DL
		"┤", // U-DL
		"┬", // -RDL
		"┼", // URDL
		"█"  // Solution
	];
	for(int i=0 ; i<cornersS.length; i++)
		write(cornersS[i]);
	writeln('\n');
	
	writeln("toUpper('é'): ", toUpper('é'));
	wstring ns1 = "Où ça? Là!";			// NFC normalized string
	wstring ns2 = normalize!NFD(ns1);
	writeln("NFC len:", ns1.length, "  NFD len:", ns2.length);
	writeln(ns1);
	writeln(ns2);
	wstring ns3 = normalize(ns2);		// By default normalize!NFC
	assert(ns1 == ns3);
	writeln('\n');

	writeln("icmp école École:", icmp("école", "École"));
	writeln("icmp école ecole:", icmp("école", "ecole"));
	writeln('\n');

	// Emoji
	// 🐗  Boar, U+1F417, UTF-8: 0xF0 0x9F 0x90 0x97, UTF-16: 0xD83D 0xDC17, UTF-32: 0x0001F417
	// 🧔  Bearded Person, U+1F9D4
	// 🧔🏻  Bearded Person+Light Skin Tone, U+1F9D4 U+1F3FB
	// 🧝  Elf, U+1F9DD
	// 🧝‍♂️  Man Elf, U+1F9DD(🧝) U+200D(ZWJ) U+2642(♂) U+FE0F(VS-16)
	// 🧝‍♀️  Woman Elf =  U+1F9DD(🧝) U+200D(ZWJ) U+2640(♀) U+FE0F(VS-16)
	// 🧝🏽	 Elf: Medium Skin Tone, U+1F9DD (🧝) U+1F3FD (🏽) 
	// 🧝🏽‍♂️  Man Elf: Medium Skin Tone, U+1F9DD (🧝) U+1F3FD (🏽) U+200D(ZWJ) U+2642(♂) U+FE0F(VS-16)
	// 🧝🏽‍♀️  Woman Elf: Medium Skin Tone U+1F9DD (🧝) U+1F3FD (🏽) U+200D(ZWJ) U+2640(♀) U+FE0F(VS-16)
	dstring em = "🐗🧔🧔🏻🧝🧝‍♂️🧝‍♀️🧝🏽🧝🏽‍♂️🧝🏽‍♀️";
	auto ems = em.byGrapheme;
	writeln("em.wl:", em.walkLength, "  ems.wl:", ems.walkLength);		//em.wl=25 (ok), ems.wl=17 (??)
	foreach (dchar c; em) {
		printf("%08x ", uint(c));
	}
	writeln('\n');

	char cend;
	write("(Pause)");
	readf("%c", &cend);
	return 0;
}
