## 🧩 Composable Layouts with ViewComponent
Use the ViewComponent gem to encapsulate layout logic as components, making them testable and reusable. This approach separates layout structure from controllers and views.

Define a layout component in `app/components/layout_component.rb`:

```ruby
class LayoutComponent < ViewComponent::Base
  def initialize(title:, user:)
    @title = title
    @user  = user
  end

  def call
    tag.html do
      tag.head do
        tag.title @title
      end +
      tag.body(class: @user.admin? ? 'admin' : 'guest') do
        safe_join([render(NavComponent.new(user: @user)), content])
      end
    end
  end
end
```

Wrap your page content in a controller or view:

```ruby
# In controller
def show
  @article = Article.find(params[:id])
  render LayoutComponent.new(title: @article.title, user: current_user) do
    render ArticleComponent.new(article: @article)
  end
end
```