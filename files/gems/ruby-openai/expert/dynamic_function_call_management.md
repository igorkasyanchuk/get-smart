## ⚙️ Master Dynamic Function Calling with Complex Schemas

For expert-level function calling, dynamically generate and handle multiple functions with nested JSON schemas. Leverage Ruby’s metaprogramming to register handlers and coerce incoming arguments into rich domain objects. This approach keeps your codebase DRY and easily testable when managing dozens of functions.

```ruby
require 'openai'

class FunctionRegistry
  def initialize(client)
    @client = client
    @functions = {}
  end

  def register(name, schema, &block)
    @functions[name] = { schema: schema, handler: block }
  end

  def call(user_prompt)
    response = @client.chat.completions(
      model: 'gpt-4o',
      messages: [{ role: 'user', content: user_prompt }],
      functions: @functions.transform_values { |f| f[:schema] },
      function_call: { name: 'auto' }
    )
    data = JSON.parse(response.dig('choices',0,'message','function_call','arguments'))
    func = response.dig('choices',0,'message','function_call','name')
    @functions[func][:handler].call(**data.symbolize_keys)
  end
end

client = OpenAI::Client.new
registry = FunctionRegistry.new(client)

registry.register('create_user', {
  name: 'create_user',
  description: 'Creates a new user in the system',
  parameters: { type: 'object', properties: { username: { type: 'string' }, age: { type: 'integer' } }, required: ['username'] }
}) do |username:, age: nil|
  User.create!(username: username, age: age)
end

# Invoke with automatic dispatch
registry.call("Please register a user named \"alice\" aged 30.")
```
