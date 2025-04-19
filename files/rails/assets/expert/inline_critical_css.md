## 🎨 Inline Critical CSS on Precompile

Extract and inline above-the-fold CSS during the `assets:precompile` task to reduce render-blocking requests. This example uses the `critical` gem in a custom Rake task to analyze HTML and embed necessary styles.

```ruby
# lib/tasks/critical_css.rake
namespace :assets do
  desc 'Inline critical CSS into application layout'
  task inline_critical: :environment do
    require 'critical'
    css = File.read(Rails.root.join('public','assets','application.css'))
    critical = Critical.process(html: File.read('app/views/layouts/application.html.erb'),
                                css: css, width: 1300, height: 900)
    layout = Rails.root.join('app','views','layouts','application.html.erb')
    content = File.read(layout).sub('<!-- inline-critical-css -->', "<style>#{critical.css}</style>")
    File.write(layout, content)
    puts 'Critical CSS inlined!'
  end
end
```