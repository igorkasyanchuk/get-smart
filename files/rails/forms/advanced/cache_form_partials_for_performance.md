## 🗂️ Cache Form Partials for Performance

Use fragment caching to speed up forms with expensive lookups (e.g., large select lists). Wrap the partials in cache blocks keyed by data that changes infrequently.

```erb
<!-- app/views/orders/_billing_address_fields.html.erb -->
<% cache ['billing_fields', current_user.country] do %>
  <%= f.select :state, States.for_country(current_user.country), prompt: 'Choose state' %>
<% end %>
```

```ruby
# app/models/states.rb
class States
  def self.for_country(country)
    Rails.cache.fetch([country, 'states'], expires_in: 12.hours) do
      Country.find_by(code: country).states.pluck(:name, :id)
    end
  end
end
```