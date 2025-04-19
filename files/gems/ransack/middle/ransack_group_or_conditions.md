## 🔀 Grouping Conditions and Using OR Predicates

Ransack allows you to group multiple conditions and combine them with OR logic using `_any` or by manually constructing groups. This is ideal for advanced filters where you want records matching any of several criteria.

```erb
<%= search_form_for @q do |f| %>
  <%= f.label :combinator, "Match" %>
  <%= f.select :combinator, [["All (AND)", "and"], ["Any (OR)", "or"]] %>

  <div>
    <%= f.label :name_cont, "Name contains" %>
    <%= f.text_field :name_cont %>
  </div>
  <div>
    <%= f.label :email_cont, "Email contains" %>
    <%= f.text_field :email_cont %>
  </div>

  <%= f.submit "Search" %>
<% end %>
```

```ruby
# In model (e.g., User)
def self.ransackable_attributes(auth_object = nil)
  super + %w[combinator]
end

def self.ransackable_scopes(auth_object = nil)
  %i[combined_search]
end

def self.combined_search(combinator, name_cont, email_cont)
  scope = all
  matcher = combinator == 'or' ? :or : :and
  conditions = []
  conditions << where('name ILIKE ?', "%#{name_cont}%") if name_cont.present?
  conditions << where('email ILIKE ?', "%#{email_cont}%") if email_cont.present?

  conditions.reduce { |acc, cond| acc.public_send(matcher, cond) }
end
```

```ruby
# In controller
@q = User.ransack(params[:q]).result.extending(User)
@users = @q.combined_search(
  params.dig(:q, :combinator),
  params.dig(:q, :name_cont),
  params.dig(:q, :email_cont)
)
```

With this setup you let users switch between AND/OR logic dynamically and build complex grouped searches.