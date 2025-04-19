## 🛠 Understand the Rails Asset Pipeline

The Rails Asset Pipeline combines, minifies, and serves your JavaScript, CSS, and image assets efficiently. By default it looks in `app/assets`, `lib/assets`, and `vendor/assets`. You can add `require` statements to bundle files together and keep your code organized.

```javascript
// app/assets/javascripts/application.js
//= require rails-ujs
//= require turbolinks
//= require_tree .
```

```css
/* app/assets/stylesheets/application.css
 *= require_self
 *= require_tree .
 */
```
