## 🛠️ Memoize and Cache Heavy Helper Outputs
For compute‑intensive or database‑heavy view logic, combine per‑request memoization with `Rails.cache` for cross‑request speedups. This pattern ensures you never recalc within a single request and leverages the cache store for recurring views.

```ruby
# app/helpers/navigation_helper.rb
module NavigationHelper
  def navigation_menu
    @navigation_menu ||= Rails.cache.fetch("nav_menu_#{current_user.id}", expires_in: 1.hour) do
      build_menu_items_from_db(current_user)
    end
  end

  private

  def build_menu_items_from_db(user)
    MenuItem.where(user: user).order(:position).map do |item|
      link_to(item.title, item.url)
    end.join.html_safe
  end
end
```

In your layout: `<%= navigation_menu %>`