## 🔒 Secure Dynamic Symbol Handling

Converting untrusted user input to symbols can open symbol table injection vulnerabilities (symbols never get freed before Ruby 2.2). Always whitelist or memoize allowed values to prevent an attacker from exhausting memory with unique symbols.

```ruby
ALLOWED_EVENTS = %i[create update destroy].freeze

def safe_event_to_sym(event)
  sym = event.to_s.strip.downcase.to_sym
  raise "Invalid event" unless ALLOWED_EVENTS.include?(sym)
  sym
end

# Usage
user_input = params[:event]
event = safe_event_to_sym(user_input)
handle_#{event}(resource)
```

For dynamic sets, use a reusable symbol pool (Hash mapping strings to symbols) with a maximum size, evicting old entries to keep the symbol table bounded.