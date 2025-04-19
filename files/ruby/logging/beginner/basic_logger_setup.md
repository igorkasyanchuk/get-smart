## 🐣 Basic Logger Setup

Ruby’s built‑in Logger class provides a simple way to write logs to stdout or files. To get started, require the Logger library and create a logger instance pointing at STDOUT or a file. You can then call methods like `info`, `debug`, or `error` to output messages.

```ruby
require 'logger'

# Log to console
logger = Logger.new(STDOUT)
logger.level = Logger::DEBUG

logger.info('Application started')
logger.debug('Debug details for developers')
```