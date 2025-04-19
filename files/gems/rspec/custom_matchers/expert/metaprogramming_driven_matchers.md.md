## 🧩 DRY Metaprogramming for Family of Matchers

When you have repetitive matcher patterns (e.g., attribute validations), generate them dynamically through metaprogramming to avoid boilerplate. This advanced technique loops over a configuration and defines multiple matchers in a single block, promoting maintainability and consistency across your suite.

```ruby
# spec/support/matchers/attribute_validators.rb
VALIDATION_MATCHERS = {
  validate_presence_of:   ->(attr) { "#{attr} must be present" },
  validate_numericality_of: ->(attr) { "#{attr} must be a number" }
}

VALIDATION_MATCHERS.each do |matcher_name, message_proc|
  RSpec::Matchers.define matcher_name do |attribute|
    match do |model_instance|
      model_instance.valid?
      model_instance.errors[attribute].include?(message_proc.call(attribute))
    end

    failure_message do |model_instance|
      "expected #{model_instance.class} to #{matcher_name} :#{attribute}, but got: \
       #{model_instance.errors[attribute].inspect}"
    end
  end
end

# Usage in a spec:
expect(Post.new).to validate_presence_of(:title)
expect(Post.new(word_count: 'five')).to validate_numericality_of(:word_count)
```