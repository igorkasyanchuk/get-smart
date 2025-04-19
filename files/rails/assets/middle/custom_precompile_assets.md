## ⚙️ Add Custom Asset Types to `config.assets.precompile`
By default Rails precompiles JS, CSS, and non-JS/CSS in `app/assets`. To include fonts or custom file types, extend the precompile array. This ensures your `.svg`, `.woff2`, or other files are available in `public/assets`.

```ruby
# config/application.rb
module MyApp
  class Application < Rails::Application
    # Precompile additional assets
    config.assets.precompile += %w( *.svg *.eot *.woff *.woff2 )
  end
end
```
