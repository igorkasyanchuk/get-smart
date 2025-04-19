## 🎨 Dynamic content_tag with Blocks

Combine `content_tag` and blocks to construct nested HTML components. This approach encapsulates complex markup within a helper while yielding to a block for custom content insertion. It simplifies view code and promotes reusable UI components.

```ruby
# app/helpers/posts_helper.rb
module PostsHelper
  def card_for(post, &block)
    content_tag :div, class: 'card' do
      concat content_tag(:div, image_tag(post.image_url), class: 'card-img-top')
      concat(
        content_tag(:div, class: 'card-body') do
          concat content_tag(:h5, post.title, class: 'card-title')
          concat capture(&block) if block_given?
        end
      )
    end
  end
end
```
