## ✅ Validation Helpers Generator

Automate custom validation methods in your classes by defining a helper generator that creates multiple validation rules with minimal repetition.

```ruby
module Validations
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def validates_presence_of(*attrs)
      attrs.each do |attr|
        define_method("validate_#{attr}_present") do
          value = send(attr)
          raise "#{attr} can't be blank" if value.nil? || value.to_s.strip.empty?
        end
        validations << "validate_#{attr}_present"
      end
    end

    def validations
      @validations ||= []
    end
  end

  def validate!
    self.class.validations.each { |v| send(v) }
  end
end

class User
  include Validations
  attr_accessor :email, :name
  validates_presence_of :email, :name
end

user = User.new
user.name = ""
user.validate!  # => RuntimeError: email can't be blank
```

This snippet dynamically defines presence-checking methods and aggregates them, keeping your validation logic consistent and DRY.