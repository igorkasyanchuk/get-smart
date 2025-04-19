## 🚀 Integrating Pundit with GraphQL Resolvers
For GraphQL APIs, use Pundit inside your field resolvers to enforce field‑level and query‑level authorization. You can `authorize` before returning data and rescue errors for uniform error handling.

Example using `graphql-ruby`:

```ruby
module Types
  class QueryType < Types::BaseObject
    field :posts, [PostType], null: false do
      argument :published, Boolean, required: false
    end

    def posts(published: nil)
      # Filter via policy scope
      posts = Pundit.policy_scope!(context[:current_user], Post)
      posts = posts.where(published: published) unless published.nil?

      # Authorize the entire collection
      Pundit.authorize(context[:current_user], posts, :index?)
      posts
    end
  end
end

class GraphqlController < ApplicationController
  rescue_from Pundit::NotAuthorizedError, with: :render_unauthorized

  private

  def render_unauthorized(exception)
    render json: { errors: [message: exception.message] }, status: :forbidden
  end
end
```

This ensures only permitted objects are returned and GraphQL errors are handled gracefully.