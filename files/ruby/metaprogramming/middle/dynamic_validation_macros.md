## ✅ Custom Validation Macros

Create dynamic validation methods using metaprogramming. This is useful for DSLs in form objects or service layers.

```ruby
module Validatable
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def validates_format_of(attr, regex)
      define_method("validate_#{attr}") do
        value = send(attr)
        unless value =~ regex
          errors[attr] ||= []
          errors[attr] << "is invalid"
        end
      end
    end
  end

  def errors
    @errors ||= {}
  end

  def valid?
    methods.grep(/^validate_/).each { |m| send(m) }
    errors.empty?
  end
end

class UserForm
  include Validatable
  attr_accessor :email
  validates_format_of :email, /@/
end

f = UserForm.new
e.try = 'invalid'
f.valid?  # => false
p f.errors # => {:email=>["is invalid"]}
```