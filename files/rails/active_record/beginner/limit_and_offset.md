## 📋 Paginate with `limit` and `offset`

Implement simple pagination by combining `limit` and `offset`. `limit` caps the number of records returned, while `offset` skips a given number. This works well for basic page navigation without extra gems.

```ruby
# First page (10 per page)
page1 = Article.limit(10).offset(0)

# Second page
take = 10
page2 = Article.limit(take).offset(take)
```  
