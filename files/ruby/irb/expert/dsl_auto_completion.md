## 🧩 Custom DSL Auto-Completion
Add domain-specific auto-completion for your DSL classes or methods by extending the IRB completer. This dramatically speeds exploratory coding.

```ruby
require 'irb/completion'
module IRB
  module Completion
    def self.custom_completions
      %w[find_by_name find_by_email find_by_id]
    end
    alias original_complete complete
    def complete(line)
      if line =~ /^User\.find_by_/
        custom_completions.grep(/^#{Regexp.escape(line.split('.').last)}/)
      else
        original_complete(line)
      end
    end
  end
end
```

Now typing `User.find_by_` in IRB will suggest your custom methods.