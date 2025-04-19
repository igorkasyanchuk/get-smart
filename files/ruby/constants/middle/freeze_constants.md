## 🛡️ Freeze Complex Constants to Prevent Mutation

For constants that refer to collections or hashes, freezing ensures they remain immutable and protects against accidental modification. This pattern improves reliability, especially when constants represent lookup tables or default option sets.

```ruby
# config/status_codes.rb
module StatusCodes
  CODES = {
    pending:   100,
    processing:200,
    completed: 201,
    failed:    500
  }.freeze
end
```

```ruby
# attempt to modify will raise a RuntimeError
StatusCodes::CODES[:new_status] = 300
# => RuntimeError: can't modify frozen Hash
```
