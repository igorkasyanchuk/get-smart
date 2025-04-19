## 🔢 Iterate Over Collections with `each`

Use Ruby’s `each` method in ERB to loop through collections and render items dynamically. Combine with partials for cleaner code.

```erb
<% @products.each do |product| %>
  <div class="product">
    <h4><%= product.name %></h4>
    <p>Price: <%= number_to_currency(product.price) %></p>
  </div>
<% end %>
```