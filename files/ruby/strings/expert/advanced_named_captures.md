## 🧩 Compose parsers with Regexp named captures

Ruby’s named captures (`?<name>`) let you extract complex data in one pattern. You can nest or chain patterns and then retrieve results via `MatchData#named_captures` for clean, self‑documenting code. This works wonders in DSL interpreters or log parsing.

```ruby
pattern = /
  \A(?<date>\d{4}-\d{2}-\d{2})\s+
  \[(?<level>INFO|ERROR)\]\s+
  (?<msg>.+)
\z/x
line = "2024-07-01 [ERROR] Disk full"
md = pattern.match(line)
puts md.named_captures
# => {"date"=>"2024-07-01", "level"=>"ERROR", "msg"=>"Disk full"}
```