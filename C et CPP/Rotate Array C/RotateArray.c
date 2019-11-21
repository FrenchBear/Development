// RotareArray.c
// Comparison of various array left rotation methods in C
//
// 2016-08-08	PV
// 2019-11-21	PV		Elimination of method 3 (in Z/IZ, stupid and totally inefficient)

/*
On Graviton, N=100'000'000

Debug x64
Method Triple-reverse     : Duration: 2.225 s
Method Intermediate buffer: Duration: 0.573 s

Debug x86
Method Triple-reverse     : Duration: 1.997 s
Method Intermediate buffer: Duration: 0.600 s

Release x64
Method Triple-reverse     : Duration: 0.765 s
Method Intermediate buffer: Duration: 0.580 s

Release x86
Method Triple-reverse     : Duration: 0.870 s
Method Intermediate buffer: Duration: 0.583 s

*/


#define _CRT_SECURE_DEPRECATE_MEMORY
#define _CRT_SECURE_NO_WARNINGS

#include <stdio.h>
#include <time.h>
#include <malloc.h>
#include <memory.h>

#define N 100'000'000
int ti[N];		// ~ 1 GB


// Helper for RotateArray1
// Reverse sequence between i1 and i2 (included)
void Reverse(int i1, int i2) {
	int n = (i2 - i1) >> 1;
	for (int i = 0; i <= n; i++) {
		int t = ti[i1 + i];
		ti[i1 + i] = ti[i2 - i];
		ti[i2 - i] = t;
	}
}

// Use the trick of a triple-reverse
// If array is represented AB with A a sequence of I elements, the goal is to transform AB into BA.
// And we have reverse((reverse(A), reverse(B)) = BA...
void RotateArray1(int I) {
	Reverse(0, I - 1);
	Reverse(I, N - 1);
	Reverse(0, N - 1);
}


// Implementation with a temp buffer for I elements.
// Use memmove instead memcpy since the two areas overlap, and memcpy behavior is undefined in this case
void RotateArray2(int I) {
	int *temparray = malloc(I * sizeof(int));
	if (temparray == NULL)
		__debugbreak();

	memcpy(temparray, ti, I * sizeof(int));
	memmove(ti, ti + I, ((size_t)(N) - (size_t)(I)) * sizeof(int));
	memcpy(ti + N - I, temparray, I * sizeof(int));

	free(temparray);
}


// Helper for debugging
void PrintArray() {
	for (int i = 0; i < N; i++)
		printf("%d ", ti[i]);
	printf("\n");
}


// Synthetic test on a given implementation
// Performs a sequence of rotations that ultimately restore initial sequence
// Checks that at the end initial order has been restored
// Measures and displays execution time
void TestRotate(char *strmethod, void implem(int p)) {
	struct timespec tstart, tend;
	(void)timespec_get(&tstart, TIME_UTC);

	// Total of rotations = N
	implem(120000);
	implem(80000);
	implem(30000);
	implem(18994);
	implem(3);
	implem(2);
	implem(1);
	implem(N-249000);

	(void)timespec_get(&tend, TIME_UTC);

	// Check result
	for (int i = 0; i < N; i++)
		if (ti[i] != i)
			__debugbreak();

	long ms = (long)((tend.tv_sec - tstart.tv_sec) * 1000L + (tend.tv_nsec - tstart.tv_nsec) / 1000000L);
	printf("Method %s: Duration: %ld.%03ld s\n", strmethod, ms / 1000, ms % 1000);
}

int main() {
	// Initialize array
	for (int i = 0; i < N; i++)
		ti[i] = i;
	//PrintArray();

	TestRotate("Triple-reverse     ", RotateArray1);
	TestRotate("Intermediate buffer", RotateArray2);

	printf("\n(pause)");
	(void)getchar();
	return 0;
}
