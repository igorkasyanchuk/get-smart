## 🏷️ Implementing Polymorphic Tagging Across Models with a Single Context
ActsAsTaggableOn supports tagging multiple ActiveRecord models under the same context by leveraging polymorphic associations. This allows you to, for example, tag both `Article` and `Video` with a single `:topics` context and query them uniformly.

First, ensure your models use the same tag context and polymorphic interface:

```ruby
class Article < ApplicationRecord
  acts_as_taggable_on :topics
end

class Video < ApplicationRecord
  acts_as_taggable_on :topics
end
```

You can now tag records:

```ruby
article = Article.create(title: 'Rails Tips')
video   = Video.create(title: 'Rails Caching')

article.topic_list.add('ruby', 'rails')
video.topic_list.add('performance', 'caching')

article.save
video.save
```

Query across both models using a single join on `Tagging`:

```ruby
Tagging.joins(:tag)
       .where(context: 'topics', tags: { name: 'rails' })
       .includes(:taggable)
       .map(&:taggable) # returns both Articles and Videos tagged 'rails'
```