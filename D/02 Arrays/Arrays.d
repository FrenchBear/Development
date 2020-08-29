// Arrays.d
// Learning D
// Arrays and slices
// 2020-08-27	PV

module arrays;

import std.stdio;
import std.algorithm;

int main()
{
	// Static array
	int[10] t1; // = [1,2,3];	Error: mismatched array lengths, 10 and 3
	writeln("t1: ", t1);

	int[10] t1copy = t1;	// Copy for fixed arrays, not for slices!
	t1copy[2] = 2;
	writeln("t1:     ", t1);
	writeln("t1copy: ", t1copy);

	int[5] t7 = 7; // Can initialize with a single value
	writeln("t7:     ", t7);
	writeln();

	// Dynamic array
	int[] t2;
	t2 = [1, 2];
	t2 ~= [3, 4];
	t2 ~= 5;
	t2.length = 10;
	writeln("t2:     ", t2);
	writeln();

	//while(true) {
	//    t2 ~= t2;
	//    writeln("t2.length: ", t2.length);
	//}
	//    t2.length: 20
	//    t2.length: 40
	///   ...
	//    t2.length: 83886080
	//    t2.length: 167772160

	// Sorting and reversing
	int[] t6 = [8, -2, 4, 0, 6, 2];
	writeln("t6:     ", t6);
	sort(t6);
	writeln("t6 s:   ", t6);
	reverse(t6);
	writeln("t6 s,r: ", t6);
	writeln();

	// Slices
	int[] s6 = t6[1..4];
	writeln("s6:     ", s6);
	writeln("s6 last:", s6[$-1]);
	s6 = t6;		// Points to t6 array
	s6[0] = 166;
	writeln("t6:     ", t6);
	writeln("s6.capacity=", s6.capacity, "  s6.length=", s6.length);
	s6 ~= 144;
	s6[0] = 5;
	writeln("s6:     ", s6);
	writeln("t6:     ", t6);

	writeln();



	char cend;
	write("(Pause)");
	readf("%c", &cend);
	return 0;
}
