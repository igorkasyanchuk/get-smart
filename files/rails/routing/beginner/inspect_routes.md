## 🔍 Inspect routes using the `rails routes` command

To see all defined routes, their HTTP verbs, URL patterns, and helper names, run the built‑in `rails routes` (or `rake routes`) command. This helps you confirm names and paths at a glance.

```bash
$ rails routes

      Prefix Verb   URI Pattern               Controller#Action
        root GET    /                         home#index
     articles GET    /articles(.:format)       articles#index
              POST   /articles(.:format)       articles#create
 new_article GET    /articles/new(.:format)   articles#new
...
```

Use the listed Prefix column as your path and URL helpers (e.g., `new_article_path`).