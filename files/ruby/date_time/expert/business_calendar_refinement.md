## 📆 Refinement-based Business Calendar

To avoid polluting the global `Date` class while adding domain‑specific logic (e.g., business days excluding weekends and holidays), use a `Module` with refinements. You get scoped extensions and can easily switch calendars per context.

Example: define and use a refined business calendar:

```ruby
module BusinessCalendar
  refine Date do
    HOLIDAYS = [Date.new(2024, 1, 1), Date.new(2024, 12, 25)]

    def business_day?
      !(saturday? || sunday? || HOLIDAYS.include?(self))
    end

    def advance_business(days)
      date = self
      days.abs.times do
        date += days.positive? ? 1 : -1
        redo unless date.business_day?
      end
      date
    end
  end
end

using BusinessCalendar
puts Date.today.advance_business(10)  # skips weekends & holidays
```

This pattern gives you full control over core refinements and keeps your calendar logic isolated.