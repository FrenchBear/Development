// Hello world in D
// Plus some type info
// First D program
// 2020-08-22	PV

import std.stdio;

int main()
{
	writeln("Hello D World!\n");

	writeln("Type           : ", bool.stringof);
	writeln("Length (bytes) : ", bool.sizeof);
	writeln("Min value      : ", bool.min);
	writeln("Max value      : ", bool.max);
	writeln("Initial value  : ", bool.init);
	writeln();

	writeln("Type           : ", byte.stringof);
	writeln("Length (bytes) : ", byte.sizeof);
	writeln("Min value      : ", byte.min);
	writeln("Max value      : ", byte.max);
	writeln("Initial value  : ", byte.init);
	writeln();

	writeln("Type           : ", ubyte.stringof);
	writeln("Length (bytes) : ", ubyte.sizeof);
	writeln("Min value      : ", ubyte.min);
	writeln("Max value      : ", ubyte.max);
	writeln("Initial value  : ", ubyte.init);
	writeln();

	writeln("Type           : ", short.stringof);
	writeln("Length (bytes) : ", short.sizeof);
	writeln("Min value      : ", short.min);
	writeln("Max value      : ", short.max);
	writeln("Initial value  : ", short.init);
	writeln();

	writeln("Type           : ", ushort.stringof);
	writeln("Length (bytes) : ", ushort.sizeof);
	writeln("Min value      : ", ushort.min);
	writeln("Max value      : ", ushort.max);
	writeln("Initial value  : ", ushort.init);
	writeln();

	writeln("Type           : ", int.stringof);
	writeln("Length (bytes) : ", int.sizeof);
	writeln("Min value      : ", int.min);
	writeln("Max value      : ", int.max);
	writeln("Initial value  : ", int.init);
	writeln();

	writeln("Type           : ", uint.stringof);
	writeln("Length (bytes) : ", uint.sizeof);
	writeln("Min value      : ", uint.min);
	writeln("Max value      : ", uint.max);
	writeln("Initial value  : ", uint.init);
	writeln();

	writeln("Type           : ", long.stringof);
	writeln("Length (bytes) : ", long.sizeof);
	writeln("Min value      : ", long.min);
	writeln("Max value      : ", long.max);
	writeln("Initial value  : ", long.init);
	writeln();

	writeln("Type           : ", ulong.stringof);
	writeln("Length (bytes) : ", ulong.sizeof);
	writeln("Min value      : ", ulong.min);
	writeln("Max value      : ", ulong.max);
	writeln("Initial value  : ", ulong.init);
	writeln();

	writeln("Type           : ", float.stringof);
	writeln("Length (bytes) : ", float.sizeof);
	writeln("Min value      : ", float.min_normal);
	writeln("Max value      : ", float.max);
	writeln("Digits         : ", float.dig);
	writeln("Initial value  : ", float.init);
	writeln();

	writeln("Type           : ", double.stringof);
	writeln("Length (bytes) : ", double.sizeof);
	writeln("Min value      : ", double.min_normal);
	writeln("Max value      : ", double.max);
	writeln("Digits         : ", double.dig);
	writeln("Initial value  : ", double.init);
	writeln();

	writeln("Type           : ", real.stringof);
	writeln("Length (bytes) : ", real.sizeof);
	writeln("Min value      : ", real.min_normal);
	writeln("Max value      : ", real.max);
	writeln("Digits         : ", real.dig);
	writeln("Initial value  : ", real.init);
	writeln();

	writeln("Type           : ", cdouble.stringof);
	writeln("Length (bytes) : ", cdouble.sizeof);
	writeln("Min value      : ", cdouble.min_normal);
	writeln("Max value      : ", cdouble.max);
	writeln("Digits         : ", cdouble.dig);
	writeln("Initial value  : ", cdouble.init);
	writeln();

	writeln("Type           : ", char.stringof);
	writeln("Length (bytes) : ", char.sizeof);
	writeln("Min value      : ", char.min);
	writeln("Max value      : ", char.max);
	writeln("Initial value  : ", char.init);
	writeln();

	writeln("Type           : ", wchar.stringof);
	writeln("Length (bytes) : ", wchar.sizeof);
	writeln("Min value      : ", wchar.min);
	writeln("Max value      : ", wchar.max);
	writeln("Initial value  : ", wchar.init);
	writeln();

	writeln("Type           : ", dchar.stringof);
	writeln("Length (bytes) : ", dchar.sizeof);
	writeln("Min value      : ", dchar.min);
	writeln("Max value      : ", dchar.max);
	writeln("Initial value  : ", dchar.init);
	writeln();


	char c;
	write("(Pause)");
	readf("%c", &c);
	return 0;
}
