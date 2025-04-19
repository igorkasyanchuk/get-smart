## 📈 GraphQL Subscriptions via Action Cable
Leverage `graphql-ruby`’s built-in Action Cable integration for real-time GraphQL subscriptions. This decouples your subscription logic from channels and uses your schema’s pub/sub.

```ruby
# app/channels/graphql_channel.rb
class GraphqlChannel < ApplicationCable::Channel
  def subscribed
    @subscriptions = []
  end

  def execute(data)
    result = MySchema.execute(
      query: data['query'],
      variables: data['variables'],
      context: { current_user: current_user, channel: self },
      operation_name: data['operationName']
    )
    payload = { result: result.to_h, more: result.context[:subscription] }
    transmit(payload)
    @subscriptions << result.context[:subscription_id] if result.context[:subscription]
  end

  def unsubscribed
    @subscriptions.each { |sid| MySchema.subscriptions.delete_subscription(sid) }
  end
end
```

```ruby
# config/schema.rb
class MySchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)
  subscription(Types::SubscriptionType)
  use GraphQL::Subscriptions::ActionCableSubscriptions
end
```