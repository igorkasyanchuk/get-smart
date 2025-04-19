## 🚀 Running Rails in Different Environments

Rails ships with three default environments: development, test, and production. Each environment has its own configuration file under `config/environments/` where you can tweak settings like caching, logging, and asset compilation. To start your server in a specific environment, use the `-e` flag or set the `RAILS_ENV` variable.

```bash
# Start server in production environment
bin/rails server -e production

# Or using RAILS_ENV variable
RAILS_ENV=development bin/rails server
```

This ensures your app picks up the correct settings and behaves as expected when you switch between development and production modes.