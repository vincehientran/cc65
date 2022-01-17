#include <stdio.h>
#include <stdlib.h>
#include <conio.h>

#define N 25

unsigned long int fib(int n) {
    if (n <= 2) {
        return 1;
    } 
    else {
        return fib(n-1) + fib(n-2);
    }
}

int main() {
    printf("%lu\n", fib(N));
    return 0;
}