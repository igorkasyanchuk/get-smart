## 📦 Initialize a New Gem Skeleton
Bundler provides a built‑in generator to scaffold a gem with the correct directory layout, Rake tasks, and a test folder. This gives you a consistent starting point.

```bash
# Replace my_gem with your desired gem name
t$ bundle gem my_gem
```  
This will create folders like `lib/my_gem`, `spec` (or `test`), and files like `my_gem.gemspec`. Navigate into `my_gem` and inspect the structure to see how everything ties together.