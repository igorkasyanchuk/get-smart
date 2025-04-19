## 📦 Pin Turbo with Importmap

If you’re using Importmap instead of Webpacker, pin Turbo in `config/importmap.rb` so it’s available in your front-end code.

```ruby
# config/importmap.rb
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
```  
Then import it in `app/javascript/application.js`:

```javascript
import "@hotwired/turbo-rails"
```