## 🌐 Internationalization and Accessibility in Forms
Combine Rails I18n with ARIA attributes to produce localized labels, placeholders, and error messages accessible to screen readers. Use `t` helpers with interpolation and add `aria-describedby` linking inputs to error or hint elements.

```erb
<%= unified_form_with model: @order do |f| %>
  <label for="order_quantity"><%= t('orders.quantity') %></label>
  <%= f.number_field :quantity,
        placeholder: t('orders.quantity_hint'),
        aria: { describedby: 'quantity_hint quantity_error' } %>

  <small id="quantity_hint" class="form-text text-muted">
    <%= t('orders.quantity_hint') %>
  </small>
  <% if @order.errors[:quantity].present? %>
    <div id="quantity_error" class="invalid-feedback">
      <%= @order.errors[:quantity].join(', ') %>
    </div>
  <% end %>

  <%= f.submit t('orders.submit') %>
<% end %>
```