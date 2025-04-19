## 🕹️ Create a Basic Stimulus Controller

Generate a new controller and connect it to your HTML elements.

```bash
rails generate stimulus hello
```  
```javascript
// app/javascript/controllers/hello_controller.js
import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
  connect() {
    console.log("Hello, Stimulus!")
  }
}
```  
```erb
<div data-controller="hello"></div>
```