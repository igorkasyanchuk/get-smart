## 🆕 Create a New Rails Application
When starting a Rails project, the `rails new` command scaffolds your directory structure, gems, and configuration files automatically. You can customize your app by passing flags such as `-d` to switch the database or `--skip-test` to omit the default test suite.

```bash
# Create a new Rails app named "blog" using PostgreSQL without the default Test::Unit suite
docker-compose run web rails new blog -d postgresql --skip-test
```  
This sets up your `Gemfile`, folder layout, and initial configuration so you can jump right into development.