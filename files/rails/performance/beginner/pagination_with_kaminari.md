## 📄 Paginate Large Result Sets
Displaying thousands of records on one page is slow. Pagination gems like Kaminari help you fetch only a subset of records per request, improving response times and UX.

```ruby
# Gemfile
gem 'kaminari'

# Controller
def index
  @products = Product.page(params[:page]).per(20)
end

# View (ERB)
<%= paginate @products %>
```