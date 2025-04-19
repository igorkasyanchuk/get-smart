## 🚀 Nested Hash Destructuring with Pattern Matching

Extract deeply nested hash values in place without manual traversals. The pattern matching `in` clause can destructure nested keys and bind them to local variables in one go.

```ruby
def handle_payload(payload)
  case payload
  in { user: { id:, profile: { role: "admin" } }, metadata: { ip: } }
    puts "Admin user #{id} from #{ip}"
  in { user: { id: }, metadata: {} }
    puts "Regular user #{id}"
  else
    puts "Unknown payload"
  end
end
```