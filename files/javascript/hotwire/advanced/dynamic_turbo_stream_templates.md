## 🎨 Customizing Turbo Stream Templates on the Fly
Inject dynamic templates into Turbo Streams at runtime before sending to the client. Useful for A/B testing UI within streams.

```ruby
# inside controller
template = render_to_string(partial: 'grandma_message')
stream = turbo_stream.replace('message', template)
stream.action = params[:variant] == 'A' ? 'replace' : 'append'
render turbo_stream: stream
```

Client‑side you need no changes—Turbo picks up your mutated stream.