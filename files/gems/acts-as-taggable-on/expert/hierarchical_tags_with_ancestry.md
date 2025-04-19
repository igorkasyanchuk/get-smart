## 🌳 Building a Hierarchical Taxonomy with Ancestry
Extend ActsAsTaggableOn’s flat tag structure into a full hierarchy using the `ancestry` gem. This enables parent-child relationships and more granular tag queries.

```ruby
# Add ancestry to tags
class AddAncestryToTags < ActiveRecord::Migration[6.0]
  def change
    add_column :tags, :ancestry, :string
    add_index :tags, :ancestry
  end
end

class Tag < ApplicationRecord
  has_ancestry
  has_many :taggings, dependent: :destroy
end

# Querying articles by subtree
parent = Tag.find_by(name: 'Programming')
subtree_ids = parent.subtree.pluck(:id)
Article.joins(:taggings)
       .where(taggings: { tag_id: subtree_ids })
       .distinct
```

With this setup, you can present nested tag trees in your UI and allow users to drill down by categories. Combine this with `acts_as_ordered_taggable_on` for custom ordering within each branch.