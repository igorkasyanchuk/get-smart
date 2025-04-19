## 🧐 Pattern Matching with Guards and Pin Operator

Leverage Ruby 3's pattern matching in combination with guard clauses and the pin (`^`) operator to write highly declarative data validations. You can pin existing variables into patterns and apply conditional logic in a single `case in` expression for complex checks.

```ruby
def process_event(event)
  id = /\A\d+\z/
  case event
  in { type: "user_signup", payload: { user_id: ^id, age: Integer => age } } if age >= 18
    puts "Adult signup: #{event[:payload][:user_id]}"
  in { type: "user_signup", payload: { user_id: ^id } }
    puts "Minor signup, needs approval"
  else
    puts "Unhandled event: #{event.inspect}"
  end
end
```