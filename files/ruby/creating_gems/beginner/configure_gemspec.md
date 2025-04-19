## 📝 Configure Your Gemspec
The `.gemspec` file defines metadata and dependencies for your gem. Edit fields like `summary`, `homepage`, and `add_dependency` so users know what your gem does and what it needs.

```ruby
# my_gem.gemspec
gem.summary       = "A brief description of my_gem"
gem.description   = "A more detailed description of what my_gem does and why."
gem.homepage      = "https://github.com/your_username/my_gem"

gem.add_dependency "nokogiri", ">= 1.10"
```  
After saving, run `bundle install` to ensure dependencies are resolved.