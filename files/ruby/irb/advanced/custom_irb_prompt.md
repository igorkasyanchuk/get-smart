## 🔧 Customizing Your IRB Prompt

Customize your IRB prompt to include contextual information like the current working directory or Git branch. This helps you maintain orientation when working in multiple projects or nested folders. You can hook into IRB’s prompt modes in your `.irbrc` to define completely new prompt strings.

```ruby
# ~/.irbrc
require 'irb'
module IRB
  def self.custom_prompt
    cwd = Dir.pwd.split('/').last
    branch = `git rev-parse --abbrev-ref HEAD`.chomp rescue 'no-git'
    "[#{cwd}:(#{branch})] %03n> "
  end
  IRB.conf[:PROMPT][:CUSTOM] = {
    PROMPT_I: custom_prompt,
    PROMPT_S: custom_prompt,
    PROMPT_C: custom_prompt,
    RETURN: "=> %s\n"
  }
  IRB.conf[:PROMPT_MODE] = :CUSTOM
end