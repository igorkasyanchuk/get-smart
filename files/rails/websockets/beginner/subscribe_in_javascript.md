## 💻 Subscribing to a Channel in JavaScript

To receive streamed data on the client, subscribe to the channel using the generated consumer. Handle incoming data in the `received` callback to update your UI in real time.

```javascript
// app/javascript/channels/chat_channel.js
import consumer from "./consumer"

consumer.subscriptions.create("ChatChannel", {
  connected() {
    console.log("Connected to ChatChannel");
  },

  received(data) {
    const messages = document.getElementById("messages");
    messages.insertAdjacentHTML("beforeend", `<p><strong>${data.user}:</strong> ${data.content}</p>`);
  }
});
```
