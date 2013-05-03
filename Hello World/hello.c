#include <stdio.h>
// struct node
// {
//     int x;
//     int y;
//     int z;
// };
// struct node func(int a, int b)
// {
//     struct node temp;
//     temp.x=a;
//     temp.y=b;
//     return temp;
// }
int add(int a, int b)
{
    int c = a+b;
    return c;
}
// int subtract(int a, int b)
// {
//     return a-b;
// }
int main()
{
    // printf("hello world\n");
//     printf("%d\n", func(100, 20).y);
//     int array[10];
//     array[5] = 20;
    int a = 100;
    int b = 200;
    int c = add(a,b);
    // int c = add(a, b);
//     int c = 0;
//     if(a>b)
//         c = add(a,b);
//     else
//         c= subtract(a,b);
    printf("%d\n", c);
    return a+b;
}
