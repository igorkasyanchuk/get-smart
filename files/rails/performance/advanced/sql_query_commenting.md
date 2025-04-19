## 💾 Annotate SQL Queries for APM Tracing

Adding comments to your SQL helps APM tools tag and filter queries by feature. Use the built‑in `comment` method on relations to inject `/* ... */` hints without altering SQL logic.

```ruby
# Annotate a complex query
users = User
  .where(active: true)
  .comment("FeatureX:bulk_user_fetch")
  .to_a
```

# In your APM (e.g., NewRelic), filter or group by `FeatureX:bulk_user_fetch` to diagnose slow endpoints.