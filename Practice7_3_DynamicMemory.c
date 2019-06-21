#include <stdio.h>
// int n;

struct People
{
	char name[10];
	int age;
};

void main()
{
	struct People* p;
	p = (struct People*)malloc(sizeof(struct People));
	if (p == NULL)
	{
		printf("ERROR => The memory is not allocated\n");
		exit(0);
	}
	strcpy(p->name, "TN");
	printf("Input age:\n");
	scanf_s("%d", &p->age);

	printf("name is %s\n", p-> name);
	printf("Age is %d\n", p->age);
}
