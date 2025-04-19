## 🔍 Filtering Rails Routes

When your Rails application has dozens or hundreds of routes, finding the one you need can be tedious. Use the `-g`/`--grep` flag on `rails routes` to filter by controller name, action, or path pattern, so you only see relevant routes.

```bash
# Show only routes related to sessions
rails routes -g sessions

# Filter by controller name
rails routes -g users

# Combine with grep for more complex patterns
rails routes | grep "api/v1"
```