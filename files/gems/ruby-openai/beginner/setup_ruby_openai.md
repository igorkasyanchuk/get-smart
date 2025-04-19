## 💎 Install and Require the Gem

Add the `ruby-openai` gem to your project and configure your API key using an environment variable. This ensures your key stays secure and you can easily initialize the client.

```ruby
# Gemfile
gem "ruby-openai"
```

```ruby
# example.rb
require "openai"

client = OpenAI::Client.new(access_token: ENV["OPENAI_API_KEY"])
```
