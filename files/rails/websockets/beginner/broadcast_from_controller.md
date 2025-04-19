## 🔄 Broadcasting Messages from a Controller

You can push data manually from your controllers after creating resources. This is useful for simple chat or notification features without additional setup.

```ruby
# app/controllers/messages_controller.rb
class MessagesController < ApplicationController
  def create
    @message = Message.create!(message_params)
    ActionCable.server.broadcast("chat_channel", {
      content: @message.content,
      user: @message.user.name
    })
    head :ok
  end

  private

  def message_params
    params.require(:message).permit(:content, :user_id)
  end
end
```
