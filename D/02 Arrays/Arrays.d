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

	int[10] t1copy = t1;
	t1copy[2] = 2;
	writeln("t1:     ", t1);
	writeln("t1copy: ", t1copy);

	int[5] t7 = 7; // Can initialize with a single value
	writeln("t7:     ", t7);

	// Dynamic array
	int[] t2;
	t2 = [1, 2];
	t2 ~= [3, 4];
	t2 ~= 5;
	t2.length = 10;
	writeln("t2:     ", t2);

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

	char cend;
	write("(Pause)");
	readf("%c", &cend);
	return 0;
}
