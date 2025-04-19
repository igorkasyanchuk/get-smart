## 📁 Organize Spec Files for Clarity
Keep your `spec/` directory structured similarly to `lib/` or `app/` directories. This helps you locate tests quickly and ensures each class or module has corresponding specs.

```
my_project/
├── app/
│   └── models/
│       └── user.rb
└── spec/
    └── models/
        └── user_spec.rb
```

In `user_spec.rb`, reference the file under test:

```ruby
require_relative '../../app/models/user'
describe User do
  # your tests...
end
```