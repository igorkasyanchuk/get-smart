## 🔍 Leverage Built‑In Assertion Matchers
Minitest provides specialized assertions like `assert_in_delta`, `assert_empty`, and their refute counterparts to write more expressive tests. They give clearer failure messages than generic `assert` or `refute`.

```ruby
def test_calculation_precision
  result = calculate_discount(100.0)
  # allow a small floating‑point error
  assert_in_delta 90.0, result, 0.001
end

def test_empty_collection
  items = Item.where(active: false)
  assert_empty items
end

def test_value_not_nil
  value = fetch_setting(:timeout)
  refute_nil value, "Expected timeout setting to be present"
end
```

Using these matchers makes your intent clear and improves test diagnostics.