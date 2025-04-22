## 🏗️ Extend MySQL with User-Defined Functions (UDFs)

When built-in functions aren’t enough, UDFs let you add C/C++ routines to MySQL’s plugin API. Write, compile, and install a shared library to implement custom string manipulations, math functions, or data transforms at the server level.

```c
// example: my_reverse.c
typedef char *(*fn_reverse)(char *);
my_bool reverse_init(UDF_INIT *initid, UDF_ARGS *args, char *message) {
  if (args->arg_count != 1) {
    strcpy(message, "Wrong number of arguments");
    return 1;
  }
  return 0;
}

char *reverse(UDF_INIT *initid, UDF_ARGS *args, char *result,
              unsigned long *length, char *is_null, char *error) {
  char *s = args->args[0];
  size_t len = strlen(s);
  for (size_t i = 0; i < len; ++i) result[i] = s[len - i - 1];
  *length = len;
  return result;
}
```

```sql
-- Install UDF
CREATE FUNCTION reverse RETURNS STRING SONAME 'my_reverse.so';
SELECT reverse('MySQL');  -- 'LSQyM'
```
