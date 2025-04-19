## 🛠️ Use Hybrid JSON Session Serializer for Safe Migration
Switching your session serializer from `:marshal` to `:json` hardens against remote code injection but may break existing sessions. Using the `:hybrid` mode lets Rails read old Marshal blobs and write new JSON payloads, easing a zero-downtime rollout.

```ruby
# config/initializers/session_serializer.rb
Rails.application.config.action_dispatch.cookies_serializer = :hybrid
# Now Rails will:
# 1. Read both Marshal and JSON sessions
# 2. Always write JSON for new sessions

# Example of storing complex data:
class Cart
  attr_accessor :items
  def initialize(items = [])
    @items = items
  end
  def as_json(*)
    { items: items }
  end
end

# In a controller:
def add_to_cart
  session[:cart] ||= Cart.new
  session[:cart].items << params[:item_id]
end

def show_cart
  @cart = session[:cart] # Rails auto-deserializes JSON back to Hash
end
```