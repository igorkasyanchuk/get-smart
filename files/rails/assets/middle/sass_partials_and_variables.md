## 🎨 Organize SCSS with Partials and Shared Variables
Keep your styles maintainable by splitting SCSS into partials (underscore prefix) and centralizing variables. Import them in your main manifest to ensure proper load order.

```scss
// app/assets/stylesheets/_variables.scss
$primary-color: #3498db;
$font-stack: 'Helvetica Neue', Helvetica, Arial, sans-serif;

// app/assets/stylesheets/application.scss
@import 'variables';
@import 'components/buttons';
@import 'layouts/header';
``` 

Create each partial (e.g., `_buttons.scss`) in the same folder. Rails’ asset pipeline will compile them into one CSS bundle.