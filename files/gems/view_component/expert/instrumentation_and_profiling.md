## 📊 Instrumentation & Profiling for Performance Insights
Embed `ActiveSupport::Notifications` around heavy component logic to surface render durations in logs or external APM. Combine with `rack-mini-profiler` or Skylight to pinpoint slow partials.

```ruby
# app/components/chart_component.rb
class ChartComponent < ViewComponent::Base
  def call
    ActiveSupport::Notifications.instrument("render.chart_component") do
      content_tag :div, class: "chart-wrapper" do
        render_chart_svg
      end
    end
  end

  private

  def render_chart_svg
    # expensive d3-svg generation or service call
  end
end

# config/initializers/notifications.rb
ActiveSupport::Notifications.subscribe("render.chart_component") do |name, start, finish, id, payload|
  Rails.logger.info("[Component] #{name} took ") +
    "#{(finish - start) * 1000}ms to render ChartComponent"
end
```
