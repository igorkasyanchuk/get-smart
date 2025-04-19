## ❌ Customize Failure Messages
Providing clear failure messages makes debugging easier when a spec fails. Define `failure_message` (and `failure_message_when_negated`) for custom output.

```ruby
# spec/support/matchers/have_multiple_of.rb
RSpec::Matchers.define :have_multiple_of do |divisor|
  match do |actual|
    actual % divisor == 0
  end

  failure_message do |actual|
    "expected \"#{actual}\" to be a multiple of \\