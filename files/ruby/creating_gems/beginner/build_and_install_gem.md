## 🚀 Build and Install Your Gem Locally
Before publishing, you can build and install your gem locally to test it in another project.

```bash
# From your gem's root directory
$ gem build my_gem.gemspec
# This produces my_gem-0.1.0.gem
$ gem install ./my_gem-0.1.0.gem
```  
In a separate Ruby project, add:

```ruby
# example.rb
require 'my_gem'

puts MyGem::VERSION  # => "0.1.0"
```  
This confirms your gem loads correctly.