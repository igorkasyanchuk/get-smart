## 🚀 Tip: Stream View Rendering with `ActionController::Live`
Use Rails streaming to push parts of your view immediately, improving perceived performance for heavy templates. Combine `response.stream.write` with partial rendering.

Example:

```ruby
class ArticlesController < ApplicationController
  include ActionController::Live

  def show
    response.headers['Content-Type'] = 'text/html; charset=utf-8'
    render layout: false

    response.stream.write render_to_string(partial: 'header', locals: { article: @article })
    @article.sections.each do |section|
      response.stream.write render_to_string(partial: 'section', locals: { section: section })
    end
  ensure
    response.stream.close
  end
end
```