## 🔍 FTS5 with Custom Tokenizer
Enhance full‑text search by plugging in custom tokenizers or using built‑in ones like `porter` for stemming. Load your tokenizer extension at runtime and bind it to your FTS5 virtual table.

```sql
-- Load the custom tokenizer extension (assumes fts5_tokenizer.c compiled)
SELECT load_extension('fts5_tokenizer');

-- Create FTS5 table using the custom tokenizer
CREATE VIRTUAL TABLE docs USING fts5(
  content,
  tokenize = 'porter'
);
```
