#include <stdio.h>

int myfunc(int a, int b, int c, int d, int e, int f)
{
	int r = a + b * 2 + d * 3 + e * 4 + f * 5;
	return r;
}

double CombineC(int a, int b, int c, int d, int e, double f)
{
	return (a + b + c + d + e) / (f + 1.5);
}

extern "C" double CombineA(int a, int b, int c, int d, int e, double f);


int main()
{
	int res = myfunc(1, 2, 3, 4, 5, 6);
	printf("%d\n", res);

	printf("CombineC: %f\n", CombineC(1, 2, 3, 4, 5, 6.1));
	printf("CombineA: %f\n", CombineA(1, 2, 3, 4, 5, 6.1));

	return 0;
}
