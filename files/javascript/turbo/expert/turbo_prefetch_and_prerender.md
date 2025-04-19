## 🔮 Turbo Frame Prefetch and Prerender Strategies
Speed up subsequent frame loads by prefetching or prerendering their content based on user intent. Use `data-turbo-frame` and `data-turbo-prefetch` attributes to hint the browser.

```erb
<a href="/profiles/123" data-turbo-frame="profile-frame" data-turbo-prefetch="render">
  View Profile
</a>

<turbo-frame id="profile-frame"></turbo-frame>
```

Prefetch fetches HTML in the background, while prerender injects the full frame content hidden. This reduces perceived latency for the user.