## ⚙️ Install Hotwire in Rails

Begin by adding Hotwire to your Rails application. Hotwire is split into Turbo and Stimulus, and you can install both with a single command.

```bash
gem 'turbo-rails'
```  
```bash
bundle install
rails turbo:install
```  
This will add the necessary gems, JavaScript packages, and update your application layout to include Turbo.