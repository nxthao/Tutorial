#include <stdio.h>
#include <string.h>

// Generated function for FUNCTION CommunicationPrint
void printer_PrintArray
(
    const int* inArrayPtr,
    int inArraySize,
    int* outArrayPtr,
    int* outArraySize
)
{
    if (outArrayPtr)
    {
        if (inArraySize <= *outArraySize)
        {
            memcpy(outArrayPtr, inArrayPtr, inArraySize*sizeof(int));
            *outArraySize = inArraySize;
        }
        else
        {
            memcpy(outArrayPtr, inArrayPtr, (*outArraySize)*sizeof(int));
        }
    }
    printf("outArraySize at server: %d \n", *outArraySize);
    int i;
    for (i = 0; i < inArraySize; i++)
    {
        printf("element: %d, value: %d \n", i, outArrayPtr[i]);
    }
}

static void TestArray
(
    void
)
{
    int inArray[5] = {2, 4, 6, 8, 10};
    int outArray[32];
    int outArraySize = 32;
    int i;
/*
    for (i = 0; i < 32; i++)
    {
        inArray[i] = i;
    }*/
    //inArray[5] = {2, 4, 6, 8, 10};


    printf("Send data to server: \n");
    printer_PrintArray(inArray, 5, outArray, &outArraySize);

    printf("outArraySize: %d \n", outArraySize);
    printf("Server says: \n");
    for (i = 0; i < outArraySize; i++)
    {
        printf("%d", outArray[i]);
    }
}


int main()
{
    printf("Hello, World!\n");
    
    TestArray();

    return 0;
}
