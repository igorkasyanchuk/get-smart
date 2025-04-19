## 🤝 Combine StimulusReflex with Hotwire for Ultra‑Fast Interactivity

Use StimulusReflex actions to drive minimal server‑round trips, then fall back to Turbo Streams for partial DOM updates. This hybrid approach maximizes interactivity with stateful reflexes.

```rb
# app/reflexes/item_reflex.rb
def increase_quantity(item_id)
  item = Item.find(item_id)
  item.increment!(:quantity)
  morph "#item_#{item_id}", render(partial: "items/item", locals: { item: item })
end
```
```js
// controllers/item_controller.js
import { Controller } from "@hotwired/stimulus";
import StimulusReflex from "stimulus_reflex";

export default class extends Controller {
  connect() {
    StimulusReflex.register(this);
  }

  increase() {
    this.stimulate("ItemReflex#increase_quantity", this.data.get("id"));
  }
}
```