## 🗄️ Read / Write Splitting with Multiple Databases

Rails 6+ lets you route read and write queries to different database roles for better scalability. Define separate configurations for your `primary` and `replica`, then wrap read-only operations in a `connected_to` block to offload them to replicas and reduce load on your primary.

```ruby
# config/database.yml
primary:
  adapter: postgresql
  database: myapp_primary
  pool: 10
replica:
  adapter: postgresql
  database: myapp_replica
  replica: true
  pool: 5

# Usage in application code
ActiveRecord::Base.connected_to(role: :reading) do
  users = User.where(active: true).to_a
end
```