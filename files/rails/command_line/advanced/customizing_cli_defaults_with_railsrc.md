## 🤖 Customizing Your Rails CLI Defaults with `.railsrc`

Create a `~/.railsrc` file to persist your preferred flags across all `rails new` or `bin/rails generate` commands. This saves time by skipping unneeded features or setting your default database. You can still override flags per invocation.

Example `~/.railsrc`:

```bash
# ~/.railsrc
--database=postgresql
--skip-turbolinks
--skip-test
--webpack=stimulus
--api
```

Now when you run:

```bash
rails new my_app
```

Rails will automatically apply those flags. To override, simply pass the opposite flag:

```bash
rails new my_app --skip-api=false --database=mysql
```