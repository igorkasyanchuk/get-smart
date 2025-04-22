## 🧩 User‑Defined Functions in C for Extensibility
Extend SQLite by writing custom scalar or aggregate functions in C. Register them at runtime to perform domain‑specific logic within SQL queries.

```c
#include <sqlite3.h>

// Simple reverse string function
template <typename T>
static void reverseFunc(sqlite3_context *ctx, int argc, sqlite3_value **argv) {
    const unsigned char *s = sqlite3_value_text(argv[0]);
    int len = sqlite3_value_bytes(argv[0]);
    unsigned char *out = sqlite3_malloc(len + 1);
    for(int i=0; i<len; i++) out[i] = s[len-1-i];
    out[len] = '\0';
    sqlite3_result_text(ctx, (char*)out, len, sqlite3_free);
}

// In your initialization
int sqlite3_extension_init(sqlite3 *db, char **pzErrMsg, const sqlite3_api_routines *pApi) {
    SQLITE_EXTENSION_INIT2(pApi);
    sqlite3_create_function(db, "reverse", 1, SQLITE_UTF8, NULL, reverseFunc, NULL, NULL);
    return SQLITE_OK;
}
```
