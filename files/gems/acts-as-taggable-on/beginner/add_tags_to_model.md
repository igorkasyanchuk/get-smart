## ✏️ Add tagging to your model

Use the `acts_as_taggable_on` method in your model to enable tags. You can specify one or more contexts (e.g., `:tags`, `:skills`) and then use the `tag_list` attribute to assign tags in controllers or forms.

```ruby
# app/models/article.rb
class Article < ApplicationRecord
  acts_as_taggable_on :tags
end

# app/controllers/articles_controller.rb
def create
  @article = Article.new(article_params)
  @article.tag_list = params[:article][:tag_list] # comma-separated tags
  @article.save
end
```