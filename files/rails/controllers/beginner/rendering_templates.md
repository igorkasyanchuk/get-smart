## 🎨 Rendering Templates

By default, Rails renders a template matching the action name. You can override this with `render` and specify another template or layout. This is useful for sharing views or customizing the layout per action.

```ruby
class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    render 'shared/list', layout: 'admin'
  end
end
```