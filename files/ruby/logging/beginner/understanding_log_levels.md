## 🔢 Understanding Log Levels

Logger supports five main severity levels (DEBUG, INFO, WARN, ERROR, FATAL) plus UNKNOWN. By setting `logger.level`, you control which messages get printed: messages with a severity lower than the set level are ignored. This helps filter noise and focus on important events.

```ruby
require 'logger'

logger = Logger.new('application.log')
logger.level = Logger::WARN

logger.debug('This will not appear')  # below WARN
logger.warn('Disk space low!')         # appears in log
logger.error('Unhandled exception!')   # appears in log
```