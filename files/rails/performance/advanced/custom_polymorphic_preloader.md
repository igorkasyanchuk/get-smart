## 🔄 Custom Polymorphic Association Preloader

ActiveRecord’s default preloader doesn’t always handle polymorphic associations optimally. You can use `ActiveRecord::Associations::Preloader` directly to group records by type and perform batched queries, eliminating N+1 queries in complex setups.

```ruby
class PolymorphicLoader
  def self.preload(records, association)
    groups = records.group_by { |r| r.send(association).class }
    groups.each do |model, subset|
      ActiveRecord::Associations::Preloader.new.preload(subset, association)
    end
  end
end

# Usage
posts = Comment.where(active: true).to_a
PolymorphicLoader.preload(posts, :commentable)
```