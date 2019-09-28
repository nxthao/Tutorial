#Note: if want print * 3 times: print("* " *3)
# draw picture as below:    
"""
The first picture:
*
*   *
*   *   *
*   *   *   *
*   *   *   *   *

The second picture:

                *
            *   *
        *   *   *
    *   *   *   *   
*   *   *   *   *

The third picture:

     *
    * *
   * * *
  * * * *
 * * * * *
"""

n = 5
print ("The first picture")
for i in range (0, n + 1):
    print('* '*i)

print ("The second picture")
n = 5
for i in range (0, n + 1):
    print('  ' *(n - i), '* ' *i)

print ("The third picture")
n = 5
for i in range(0, n + 1):
    print (' ' *(n - i), '* ' *i)


    