## 📝 Conditional Configuration in .irbrc

Different projects often need different IRB tweaks. Use `Dir.pwd` checks or environment variables in your `.irbrc` to load project-specific setups dynamically.

```ruby
# ~/.irbrc
case Dir.pwd
when %r{/my_rails_app}
  require './config/boot'
  IRB.conf[:PROMPT_MODE] = :RAILS
when %r{/another_project}
  IRB.conf[:AUTO_INDENT] = false
else
  IRB.conf[:RETURN_FORMAT] ||= proc {|value| value.inspect }
end
```