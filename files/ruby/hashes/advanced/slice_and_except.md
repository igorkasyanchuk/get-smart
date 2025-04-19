## 🗂️ `slice` and `except` for Subset Isolation

Select or reject key subsets efficiently. ActiveSupport adds `slice`/`slice!` and `except`/`except!`, making it easy to restrict a Hash to only desired keys or drop sensitive ones.

```ruby
params = {id: 1, name: 'Jane', password: 'secret', role: 'admin'}

public_params = params.slice(:id, :name, :role)
# => {:id=>1, :name=>"Jane", :role=>"admin"}

safe = params.except(:password)
# => {:id=>1, :name=>"Jane", :role=>"admin"}
```