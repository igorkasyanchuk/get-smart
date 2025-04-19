## 🚧 Leverage Route Constraints for Dynamic Matching
Constraint lambdas give you programmatic control over whether a route matches. Use them to guard routes by subdomains, request params, or any custom logic.

```ruby
# config/routes.rb
Rails.application.routes.draw do
  constraints(lambda { |req| req.params[:preview] == "true" }) do
    get 'articles/preview/:id', to: 'articles#preview'
  end
end
```

Here, the `preview` route only matches when `?preview=true` is present. You can also define a custom constraint class for more complex checks.