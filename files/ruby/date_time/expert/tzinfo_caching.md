## ⌛ TZInfo Caching for High-Throughput Time Zone Conversions

Repeatedly resolving time zones can be expensive under heavy load. By caching the `Timezone` object and its transition periods, you minimize lookups and GC overhead in hot paths.

Example: thread‑local caching of a TZInfo period:

```ruby
require 'tzinfo'
module FastTZ
  def self.local_time(zone_name, utc_time)
    tz = Thread.current[:tz_cache] ||= {}
    tz[zone_name] ||= TZInfo::Timezone.get(zone_name)
    period = tz[zone_name].period_for_utc(utc_time)
    period.to_local(utc_time)
  end
end

utc = Time.now.utc
ny = FastTZ.local_time('America/New_York', utc)
puts ny.strftime('%Y-%m-%d %H:%M:%S %Z')
```

By reusing `Timezone` instances per thread and caching periods, you drastically reduce overhead when converting millions of timestamps.