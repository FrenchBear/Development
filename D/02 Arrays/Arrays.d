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

	int[10] t1copy = t1; // Copy for fixed arrays, not for slices!
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
	int[] s6 = t6[1 .. 4];
	writeln("s6:     ", s6);
	writeln("s6 last:", s6[$ - 1]);
	writeln("s6.capa:", s6.capacity); // zero since the slice cannot be extended without breaking sharing
	s6 = t6; // Points to t6 array
	s6[0] = 166;
	writeln("t6:     ", t6);
	writeln("s6.capa=", s6.capacity);
	writeln("s6.leng=", s6.length);

	s6 ~= 144; // Can add 1 element without breaking slice since cap=7 and len=6
	s6[0] = 5; // Since slice is still referencing t6, t6 is also updated
	writeln("s6 A:   ", s6);
	writeln("t6 A:   ", t6);

	s6 ~= 200; // Slice is extended again, breaking link (sharing) with t6
	s6[0] = -7; // s6 is updated but not t6
	writeln("s6 B:   ", s6);
	writeln("t6 B:   ", t6);

	s6 = t6.dup; // get a copy
	s6[0] = 7; // does not update t6
	writeln("s6 C:   ", s6);
	writeln("t6 C:   ", t6);

	s6.length += 5; // Can change length
	writeln("s6 D1:  ", s6);
	s6.length = 3;
	writeln("s6 D2:  ", s6);

	s6.reserve(20); // Reserve for 20 extra elements
	writeln("s6.capa=", s6.capacity);
	writeln("s6.leng=", s6.length);
	s6.length = 16; // Without this, next line causes core.exception.RangeError@Arrays.d(88): Range violation
	s6[10 .. 16] = -1; // Fill a slice
	writeln("s6 E:   ", s6);
	writeln();

	int[] ta = [1, 2, 3, 4, 5];
	int[] tb = [2, 3, 5, 7, 11];
	int[5] tc = ta[] + tb[]; // int[] tc not allowed (array op without destination memory not allowed)
	int[5] ta3 = 3 * ta[];
	writeln("ta:     ", ta);
	writeln("tb:     ", tb);
	writeln("ta+tb:  ", tc);
	writeln("3*ta:   ", ta3);
	ta3[] = 7; // Can assign a value to all elements, including static arrays
	writeln("ta7:    ", ta3);
	tb = ta; // tb access ta elements
	tb[1] = 1965;
	writeln("tb:     ", tb);
	writeln("ta:     ", ta);
	tb[] = tc; // tb gets a copy of tc elements
	tb[1] = 1965;
	writeln("tb:     ", tb);
	writeln("tc:     ", tc);
	writeln();

	int[3][2] ma = [[1, 2, 3], [4, 5, 6]];
	writeln("ma:     ", ma);
	int[][] mb = [[1,2],[3,4,5],[6,7,8,9]];
	writeln("mb:     ", mb);
	int[][][] mc = new int[][][](2,3,4);
	writeln("mc:     ", mc);

	writeln();

	char cend;
	write("(Pause)");
	readf("%c", &cend);
	return 0;
}
