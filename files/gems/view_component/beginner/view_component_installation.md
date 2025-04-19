## 🚀 Installing and Generating a ViewComponent

ViewComponent helps you extract reusable UI elements into standalone components. To start, add the gem to your Gemfile and run the installer. Then, use the built‑in generator to scaffold a new component with its template and test files.

```ruby
gem 'view_component'
```

```bash
# Install the gem and its migrations (if any)
bundle install
yarn install
# Generate a new component named HelloWorldComponent
rails generate component HelloWorld greeting:string
```

This will create `app/components/hello_world_component.rb`, `app/components/hello_world_component.html.erb`, and a corresponding test file.