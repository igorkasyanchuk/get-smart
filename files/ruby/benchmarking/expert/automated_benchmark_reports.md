## 🛠 Automate Benchmark Suites with Interactive HTML Reports

Integrate your benchmark harness into CI to generate versioned HTML dashboards. Use ERB and Chart.js to produce interactive reports for trend analysis and track regressions over time.

```ruby
require 'benchmark'
require 'erb'
require 'json'

# Step 1: run benchmarks
results = Benchmark.bmbm do |x|
  x.report('alpha') { alpha_task }
  x.report('beta')  { beta_task  }
end

# Step 2: prepare data for chart
chart_data = results.map { |r| { name: r.label, time: r.real } }

# Step 3: render HTML
template = ERB.new(File.read('report_template.html.erb'))
File.write('bench_report.html', template.result_with_hash(data: chart_data.to_json))
```

Then, in your GitHub Actions pipeline, upload `bench_report.html` as an artifact or deploy to GitHub Pages for continuous visibility.