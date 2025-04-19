## 🚀 Installing Stimulus

Stimulus can be added easily to your Rails app using Importmap. It provides a lightweight way to organize JavaScript without a full bundler setup. Here's how to pin and import Stimulus in your project.

```bash
# Pin Stimulus via importmap
bin/importmap pin stimulus
```

Then in `app/javascript/application.js`, import and start it:

```javascript
import { Application } from "@hotwired/stimulus"
import { definitionsFromContext } from "@hotwired/stimulus-loading"

const application = Application.start()
const context = require.context("controllers", true, /\.js$/)
application.load(definitionsFromContext(context))
```