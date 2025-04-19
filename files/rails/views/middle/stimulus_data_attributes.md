## 🎯 Stimulus Controllers via Data Attributes
Integrate Stimulus controllers directly in ERB by adding `data` attributes. This keeps your markup declarative and tied to behavior in a straightforward way.

```erb
<div data-controller="like"
     data-like-post-id-value="<%= @post.id %>">
  <button data-action="click->like#toggle">❤ Like</button>
</div>
```