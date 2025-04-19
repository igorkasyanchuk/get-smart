## 🛠️ Creating Custom Turbo Stream Actions
Extend Turbo Streams with your own actions by adding to `Turbo.StreamActions`. This lets you encapsulate complex DOM manipulations server-side in a declarative way.

```javascript
// config/initializers/turbo_stream_actions.rb
turbo = Turbo::Streams::TagBuilder

Turbo::Streams::ActionContainer.register(:highlight) do |stream, target, content, attributes|
  turbo.replace(target, %(<div class="highlight">#{content}</div>))
end
```

```html
<turbo-stream action="highlight" target="comment_42">
  <template>Updated content with highlight</template>
</turbo-stream>
```
