## 🛠️ Customizing Webpacker Configuration
When Rails’ default Webpacker setup isn’t enough, you can extend its config by editing `config/webpack/environment.js`. For example, add a new loader for Markdown files and set up an alias:

```js
// config/webpack/environment.js
const { environment } = require('@rails/webpacker')
const markdownLoader = {
  test: /\.md$/,
  use: [
    {
      loader: 'html-loader'
    },
    {
      loader: 'markdown-loader',
      options: { /* custom options */ }
    }
  ]
}
environment.loaders.append('markdown', markdownLoader)
environment.config.set('resolve.alias.Documents',
  path.resolve(__dirname, '..', '..', 'app/javascript/docs')
)
module.exports = environment
```

Now you can `import Doc from 'Documents/readme.md'` and the files process through your pipeline.