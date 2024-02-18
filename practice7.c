#include <stdio.h>
#include <stdbool.h>
// 2
bool hasNext(char* word) {
    return *word;
}
// 3
int length(char* word) {
    int len = 0;
    while (hasNext(word)) {
        word++; len++;
    }
    return len;
}
// 4
int vowels(char* word) {
    int count = 0;
    while (*word) {
        if (*word == 'a' || *word == 'e' || *word == 'i' || *word == 'o' || *word == 'u' || *word == 'A' || *word == 'E' || *word == 'I' || *word == 'O' || *word == 'U') {
            count++;
        }
        word++;
    }
    return count;
}
// 5
void reverse(char* word) {
    char* start = word;
    char* end = word + length(word) - 1;
    while (start < end) {
        char temp = *start;
        *start = *end;
        *end = temp;
        start++; end--;
    }
}
// 6
char* longer(char* word1, char* word2) {
    if (length(word1) > length(word2)) {
        return word1;
    }
    return word2;
}
// 7
int letters(char* word) {
    int l[256] = {0}; int count = 0;
    while (*word) {
        if (!l[*word]) {
            count++;
        }
        l[*word]++; // ez tetszik
        word++;
    }
    return count;
}
// 8
void replace(char* word, char c1, char c2) {
    while (*word) {
        if (*word == c1) {
            *word = c2;
        }
        word++;
    }
}
// 9
bool prefix(char* word, char* pref) {
    while (*pref) {
        if (*word != *pref) {
            return false;
        }
        word++; pref++;
    }
    return true;
}
// 10
bool postfix(char* word, char* post) {
    reverse(word); reverse(post);
    return prefix(word, post);
}
// 11
bool isSubstring(char* word, char* sub) {
    while (*word) {
        char* temp = word;
        while (*sub && *word == *sub) {
            word++; sub++;
        }
        if (!*sub) {
            return true;
        }
        sub = temp;
        word++;
    }
    return false;
}
// 12
char* split(char* word, int n) {
    if (n > length(word)) {
        return "ERROR";
    }
    static char result[100]; // eh
    char* temp = result;
    while (n--) {
        *temp = *word;
        temp++; word++;
    }
    *temp = '\0';
    return result;
}
// 13
// ?

int main() {
    // 1
    char f1[69]; printf("word: "); scanf("%s", f1);
    char f2[30] = "sd";

    reverse(f1);

    printf("%s\n", f1);

    return 0;
}
