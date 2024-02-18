#include <stdio.h>
#include <math.h>

int main() {
    //1
    printf("#1\n");
    for (int f = -20; f < 210; f += 10) {
        int c = (f - 32) / 1.8; printf("%dF, %dC\n", f, c);}
    //2
    int rdo(int n, int r) {
        if (n == 0) {return r;}
        int d = n - (n / 10) * 10;
        return rdo(n / 10, r * 10 + d);}
    //a szam elejen es vegen levo 0-kat elhagyja
    int n2; printf("#2\nn2: "); scanf("%d", &n2);
    int f2 = rdo(n2, 0);
    printf("%d :2n\n", f2);
    //3
    int f3; printf("#3\nn3: "); scanf("%d", &f3);
    for (int i = 1; i <= f3 / 2; i++) {if (f3 % i == 0) {printf("%d, ", i);}}
    printf("%d\n#4\n", f3);
    //4
    int gcd(int x, int y) {
        int temp;
        while (x != 0) {temp = x; x = y % x; y = temp;}
        return y;}
    int n41; int n42; printf("n41: "); scanf("%d", &n41); printf("n42: "); scanf("%d", &n42);
    int f4 = gcd(n41, n42);
    printf("gcd: %d\n#5\n", f4);
    //5
    printf("0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0\n#6\n");
    //:*
    //6
    int pldr(int n6) {int rev = rdo(n6, 0); return n6 == rev;}
    int n6; printf("n6: "); scanf("%d", &n6);
    if (pldr(n6)) {printf("true");}
    else {printf("false");}
    //7
    int dsum(int x) {int dsum = 0; for (int i = 1; i <= x / 2; i++) {if (x % i == 0) {dsum += i;}} return dsum;}
    int n71; int n72; printf("\n#7\nn71: "); scanf("%d", &n71); printf("n72: "); scanf("%d", &n72);
    int f71 = dsum(n71); int f72 = dsum(n72);
    if (f71 == n72 && f72 == n71) {printf("true");}
    else {printf("false");}
    //8
    int prime(int x) {for (int i = 2; i <= x / 2; i++) {if (x % i == 0) {return 1;}} return 0;}
    int n8; printf("\n#8\nn8: "); scanf("%d", &n8);
    int f8 = prime(n8);
    if (f8 == 0) {printf("true\n");} else {printf("false\n");}
    int primeroprimo = 1;
    for (int i = 2; i < 1001; i++) {if (prime(i) == 0) if (primeroprimo) {printf("%d", i); primeroprimo = 0;} else {printf(", %d", i);}}
    //9
    void qrf(double a, double b, double c) {
        double dscr = b * b - 4 * a * c;
        if (dscr > 0) {
            double f91 = (-b + sqrt(dscr)) / (2 * a);
            double f92 = (-b - sqrt(dscr)) / (2 * a);
            printf("%lf, %lf", f91, f92);}
        else if (dscr == 0) {double f90 = -b / (2 * a); printf("%lf", f90);}
        else {printf("\ndscr < 0");}}
    double n91, n92, n93; printf("\n#9\na: "); scanf("%lf", &n91); printf("b: "); scanf("%lf", &n92); printf("c: "); scanf("%lf", &n93);
    qrf(n91, n92, n93);
    return 0;
}