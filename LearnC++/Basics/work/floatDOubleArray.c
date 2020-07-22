#include <stdio.h>

void testFloatArray
(
    const float* floatArray,
    size_t floatSize
)
{
    for (size_t i = 0; i < floatSize; i++)
    {
        printf("The element %zu of array: %f \n", i, floatArray[i]);
    }
}

void testDoubleArray
(
    const double* doubleArray,
    size_t doubleSize
)
{
    for (size_t i = 0; i < doubleSize; i++)
    {
        printf("The element %zu of double array: %lf\n", i, doubleArray[i]);
    }
}

int main()
{
    float floatData[] = {0.2, 0.4, 0.6, 0.8, 1.0};
    double doubleData[] = {0.2, 0.4, 0.6, 0.8, 1.0};
    printf("Hello World from TN\n");
    testFloatArray(floatData, 5);
    testDoubleArray(doubleData, 5);

    return 0;
}


