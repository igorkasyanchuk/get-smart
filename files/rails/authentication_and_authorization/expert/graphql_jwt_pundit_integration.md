## 🔑 Secure GraphQL Resolvers with JWT Authentication and Pundit

For API-first Rails apps, authenticating and authorizing GraphQL resolvers at the same time maintains a unified permission model. Decode the JWT in your GraphQL controller, set `current_user`, and pass a Pundit context into the schema. Use `authorize!` in resolvers to guard individual fields or mutations.

```ruby
# app/controllers/graphql_controller.rb
class GraphqlController < ApplicationController
  def execute
    token = request.headers['Authorization']&.split(' ')&.last
    context = { current_user: authenticate_jwt(token) }
    result = MySchema.execute(
      params[:query], variables: params[:variables], context: context
    )
    render json: result
  end

  private

  def authenticate_jwt(token)
    payload = JWT.decode(token, Rails.application.secrets.jwt_secret)[0]
    User.find(payload['sub'])
  rescue JWT::DecodeError
    nil
  end
end
```

```ruby
# app/graphql/types/query_type.rb
field :project, Types::ProjectType, null: false do
  argument :id, ID, required: true
end
def project(id:)
  project = Project.find(id)
  Pundit.authorize(context[:current_user], project, :show?)
  project
end
```

This pattern ensures every GraphQL field is wrapped in Pundit’s authorization checks while centralizing token decoding logic.