#include <stdio.h>
// int temp = 2;
// int array[100];
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
// printf("%d", a);
// void init()
// {
//     for(int i=0;i<10;i++, temp++, temp%=10)
//         printf("%d\n", array[temp]);
// }
int add(int a, int b)
{
    int res;
    res = a + b;
    return res;
}
int subtract(int a, int b)
{
    int res;
    res = a - b;
    return res;
}
int main()
{
    // printf("hello world\n");
//     printf("%d\n", func(100, 20).y);
//     int array[10];
//     array[5] = 20;
// init();
    int a = 100;
    int b = 200;
    int c = 0;
    if(a>b)
        c = add(a,b);
    else
        c= subtract(a,b);
    printf("%d\n", c);
    
    return c;
}
