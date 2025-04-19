## 📂 Organize Your Locale Files

Keep your translation files organized by feature or namespace under `config/locales`. This helps you quickly locate and update translations as your app grows.

```yaml
# config/locales/en/users.en.yml
en:
  users:
    title: "Users"
    profile:
      name: "Name"
      email: "Email"

# config/locales/en/products.en.yml
en:
  products:
    title: "Products"
    price: "Price"
```