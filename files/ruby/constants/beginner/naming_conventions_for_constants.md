## 🏷️ Naming Conventions and Warnings

Ruby constants should start with an uppercase letter and use `ALL_CAPS` with underscores for readability. If you reassign a constant, Ruby emits a warning, helping you catch unintended changes.

```ruby
# Good: all caps, underscores
MAX_CONNECTIONS = 10
DEFAULT_PATH    = '/usr/bin'

# Bad: lowercase or mixed case
# maxConnections = 10   # Not a constant, treated as a local variable
# DefaultPath    = '/usr/bin'  # Allowed, but not idiomatic

# Warning on reassignment
default_users = ['alice']
DEFAULT_USERS = ['alice']
DEFAULT_USERS = ['bob']
# => warning: already initialized constant DEFAULT_USERS
# => warning: previous definition of DEFAULT_USERS was here
```