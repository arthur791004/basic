# C

## C/C++ 語言新手十三誡 -- Ver. 2016

### 不可以使用尚未給予適當初值的變數
* 錯誤例子：
```c
int accumulate(int max)    /* 從 1 累加到 max，傳回結果 */
{
  int sum;    /* 未給予初值的區域變數，其內容值是垃圾 */
  for (int num = 1; num <= max; num++) {  sum += num;  }
  return sum;
}
```

* 正確例子：
```c
int accumulate(int max)
{
  int sum = 0;    /* 正確的賦予適當的初值 */
  for (int num = 1; num <= max; num++) {  sum += num;  }
    return sum;
}
```

### 不能存取超過陣列既定範圍的空間
* 宣告陣列時，所給的陣列元素個數值如果是 N, 那麼我們在後面透過 [索引值] 存取其元素時，所能使用的索引值範圍是從 0 到 N-1
* 錯誤例子：
```c
int str[5];
for (int i = 0 ; i <= 5 ; i++) str[i] = i;
```
* 正確例子：
```c
int str[5];
for (int i = 0; i < 5; i++) str[i] = i;
```

### 不可以提取不知指向何方的指標
* 指標變數必需先指向某個可以合法操作的空間，才能進行操作。
* 使用者記得要檢查 malloc 回傳是否為 NULL， 礙於篇幅本文假定使用上皆合法，也有正確歸還記憶體
* 錯誤例子：
```c
char *pc1;         /* 未給予初值，不知指向何方 */
char *pc2 = NULL;  /* pc2 起始化為 null pointer */
*pc1 = 'a';        /* 將 'a' 寫到不知何方，錯誤 */
*pc2 = 'b';        /* 將 'b' 寫到「位址0」，錯誤 */
```
* 正確例子：
```c
char c;          /* c 的內容尚未起始化 */
char *pc1 = &c;  /* pc1 指向字元變數 c */
*pc1 = 'a';      /* c 的內容變為 'a' */

/* 動態分配 10 個 char(其值未定),並將第一個char的位址賦值給 pc2 */
char *pc2 = (char *) malloc(10);
pc2[0] = 'b';    /* 動態配置來的第 0 個字元，內容變為 'b' */
free(pc2);
```

* 錯誤例子：
```c
char *name;   /* name 尚未指向有效的空間 */
printf("Your name, please: ");
fgets(name,20,stdin);   /* 您確定要寫入的那塊空間合法嗎??? */
printf("Hello, %s\n", name);
```
* 正確例子：
```c
/* 如果編譯期就能決定字串的最大空間，那就不要宣告成 char* 改用 char[] */

char name[21];   /* 可讀入字串最長 20 個字元，保留一格空間放 '\0' */
printf("Your name, please: ");
fgets(name,20,stdin);
printf("Hello, %s\n", name);
```

* 正確例子(2)，若是在執行時期才能決定字串的最大空間，C提供兩種作法：
  * 利用 malloc() 函式來動態分配空間，用malloc宣告的陣列會被存在heap。須注意：若是宣告較大陣列，要確認malloc的回傳值是否為NULL
  ```c
  size_t length;
  printf("請輸入字串的最大長度(含null字元): ");
  scanf("%u", &length);

  name = (char *)malloc(length);
  if (name) {         // name != NULL
    printf("您輸入的是 %u\n", length);
  } else {            // name == NULL
    puts("輸入值太大或系統已無足夠空間");
  }
  /* 最後記得 free() 掉 malloc() 所分配的空間 */
  free(name);
  name = NULL;  //(註1)
  ```

  * C99開始可使用variable-length array (VLA)，須注意：
    * 因為VLA是被存放在stack裡，使用前要確認array size不能太大
    * 不是每個compiler都支援VLA(註2)
    * C++ Standard不支援(雖然有些compiler支援)
  ```c
  float read_and_process(int n)
  {
    float vals[n];
    for (int i = 0; i < n; i++)
      vals[i] = read_val();
    return process(vals, n);
  }
  ```
* 正確例子(3)，C++的使用者也有兩種作法：
  * std::vector (不管你的陣列大小會不會變都可用)
  ```c
  std::vector<int> v1;
  v1.resize(10);               // 重新設定vector size
  ```
  * C++11以後，若是確定陣列大小不會變，可以用std::array。須注意：一般使用下(存在stack)一樣要確認array size不能太大
  ```c
  std::array<int, 5> a = { 1, 2, 3 }; // a[0]~a[2] = 1,2,3; a[3]之後為0;
  a[a.size() - 1] = 5;                // a[4] = 0;
  ```
* 備註
  1. C++的使用者，C++03或之前請用0代替NULL，C++11開始請改用nullptr
  2. gcc和clang支援VLA，Visual C++不支援

### 不要試圖用 char* 去更改一個"字串常數"
* 試圖去更改字串常數(string literal)的結果會是undefined behavior。
* 錯誤例子：
```c
char* pc = "john";   /* pc 現在指著一個字串常數 */
*pc = 'J';           /* undefined behaviour，結果無法預測*/
pc = "jane";         /* 合法，pc指到在別的位址的另一個字串常數*/
                     /* 但是"john"這個字串還是存在原來的地方不會消失*/

因為char* pc = "john"這個動作會新增一個內含元素為"john\0"的static char[5]，
然後pc會指向這個static char的位址(通常是唯讀)。

若是試圖存取這個static char[]，Standard並沒有定義結果為何。

pc = "jane" 這個動作會把 pc 指到另一個沒在用的位址然後新增一個
內含元素為"jane\0"的static char[5]。
可是之前那個字串 "john\n" 還是留在原地沒有消失。

通常編譯器的作法是把字串常數放在一塊read only(.rdata)的區域內，
此區域大小是有限的，所以如果你重複把pc指給不同的字串常數，
是有可能會出問題的。
```
* 正確例子：
```c
char pc[] = "john";  /* pc 現在是個合法的陣列，裡面住著字串 john */
                     /* 也就是 pc[0]='j', pc[1]='o', pc[2]='h',
                                          pc[3]='n', pc[4]='\0'  */
*pc = 'J';
pc[2] = 'H';

說明：字串常數的內容應該要是"唯讀"的。您有使用權，但是沒有更改的權利。
若您希望使用可以更改的字串，那您應該將其放在合法空間
```
* 錯誤例子：
```c
char *s1 = "Hello, ";
char *s2 = "world!";
/* strcat() 不會另行配置空間，只會將資料附加到 s1 所指唯讀字串的後面，
   造成寫入到程式無權碰觸的記憶體空間 */
strcat(s1, s2);
```
* 正確例子(2)：
```c
/* s1 宣告成陣列，並保留足夠空間存放後續要附加的內容 */
char s1[20] = "Hello, ";
char *s2 = "world!";
/* 因為 strcat() 的返回值等於第一個參數值，所以 s3 就不需要了 */
strcat(s1, s2);
```
* C++對於字串常數的嚴格定義為const char* 或 const char[]。
* 但是由於要相容C，char* 也是允許的寫法(不建議就是)。
* 不過，在C++試圖更改字串常數(要先const_cast)一樣是undefined behavior。
```c
const char* pc = "Hello";
char* p = const_cast<char*>(pc);
p[0] = 'M'; // undefined behaviour
```

### 不能在函式中回傳一個指向區域性自動變數的指標
```c
```

### 不可以只做 malloc(), 而不做相應的 free()
```c
```

### 在數值運算、賦值或比較中不可以隨意混用不同型別的數值
```c
```

### ++i/i++/--i/i--/f(&i)哪個先執行跟順序有關
```c
```

### 慎用Macro
```c
```

### 不要在 stack 設置過大的變數以避免堆疊溢位(stack overflow)
```c
```

### 使用浮點數精確度造成的誤差問題
```c
```

### 不要猜想二維陣列可以用 pointer to pointer 來傳遞
```c
```

### 函式內 new 出來的空間記得要讓主程式的指標接住
```c
```

## Reference
* ptt - C/CPP
