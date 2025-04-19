## 📊 Instrumenting Controllers with ActiveSupport::Notifications

Embed custom instrumentation within actions to measure performance or log domain events. Tag notifications under the `process_action.action_controller` namespace to integrate with existing subscribers or APM tools.

```ruby
class PaymentsController < ApplicationController
  def create
    ActiveSupport::Notifications.instrument('payment.process', order_id: params[:order_id]) do
      PaymentService.new(params[:order_id]).call
    end
    render json: { status: 'ok' }
  end
end

# config/initializers/notifications.rb
ActiveSupport::Notifications.subscribe('payment.process') do |*args|
  event = ActiveSupport::Notifications::Event.new(*args)
  Rails.logger.info "[Payment] #{event.payload[:order_id]} processed in #{event.duration}ms"
end
```