## 🚀 Start the Rails Development Server
After creating or cloning a Rails app, use `rails server` (or `rails s`) to boot up a local web server. By default, it listens on port 3000, but you can override the host or port with flags.

```bash
# Start the server on port 4000 and bind to all interfaces
rails server -p 4000 -b 0.0.0.0
```  
Navigate to `http://localhost:4000` in your browser to see your application in action and verify your routes and views are rendering correctly.