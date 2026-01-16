#include <stdio.h>
#include <stdlib.h>

int calculate_qin(int* a,int length,int x0)
{
	for (int i = 0; i < length; i++)
	{
		printf("%d ", a[i]);
	}
	printf("\n");
	printf("  ");
	int* v = (int* )malloc(length * sizeof(int));
	v[0] = a[0];
	for (int i = 1; i < length; i++)
	{
		printf("%d ",v[i-1]*x0);
		v[i] = v[i-1] * x0 + a[i];
	}
	printf("\n");
	for (int j = 0; j < length; j++)
	{
		printf("%d ", v[j]);
	}
	printf("\n");
	int result = v[length-1];
	free(v);
	return result;
}


int main()
{
	int a[4] = { 1,0,-3,-1 };
	int x0 = 2;
	int result = calculate_qin(a, sizeof(a)/sizeof(a[0]),x0);
	printf("The result is %d", result);
}





