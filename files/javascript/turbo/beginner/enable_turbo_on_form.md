## 📄 Enable Turbo on Forms
Turbo automatically intercepts form submissions and performs AJAX-like requests. To ensure a form uses Turbo, simply include it without extra configuration.

```html
<form action="/comments" method="post">
  <input name="comment[text]" />
  <button type="submit">Submit</button>
</form>
```

Turbo will replace the page or update frames if returned from the server with the proper response.