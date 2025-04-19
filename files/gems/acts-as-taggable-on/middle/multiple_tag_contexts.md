## 🏷️ Using Multiple Tag Contexts

With `acts-as-taggable-on` you can define separate tag lists (contexts) on the same model. This helps you organize tags by purpose, like `skills` vs `interests`.

```ruby
# app/models/user.rb
class User < ApplicationRecord
  acts_as_taggable_on :skills, :interests
end

# In console or controller:
user = User.new(name: 'Alice')
user.skill_list.add('Ruby', 'JavaScript')
user.interest_list.add('Cooking', 'Hiking')
user.save
```

Now you can query or display tags per context:

```ruby
user.skill_list    #=> ["Ruby", "JavaScript"]
user.interest_list #=> ["Cooking", "Hiking"]
```