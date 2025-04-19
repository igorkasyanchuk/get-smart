## 🎨 Customize Devise Views
To tailor Devise’s default views (sign in, sign up, password reset) to your application’s style, generate the view files into your app and modify them. This gives you full control over the HTML and layout.

```bash
rails generate devise:views
```

For example, edit `app/views/devise/sessions/new.html.erb`:

```erb
<h2>Log in to Your Account</h2>
<%= form_for(resource, as: resource_name, url: session_path(resource_name)) do |f| %>
  <div><%= f.email_field :email, autofocus: true, placeholder: 'Email' %></div>
  <div><%= f.password_field :password, placeholder: 'Password' %></div>
  <div><%= f.submit 'Log in', class: 'btn btn-primary' %></div>
<% end %>
```

Reload your sign-in page to see your custom layout in action.