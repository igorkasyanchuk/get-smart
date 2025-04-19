## 🏗️ Create a Mountable Rails Engine

Rails engines let you package functionality into a mini Rails application. To scaffold a new mountable engine, run the `rails plugin new` generator with `--mountable`. This creates a clear directory structure (`app/`, `lib/`, `config/`) and isolates your engine’s namespace.

```bash
$ rails plugin new blog_engine --mountable
```   

Once generated, explore `blog_engine/app/controllers/blog_engine/` and `blog_engine/config/routes.rb` to start adding your engine’s behavior.
