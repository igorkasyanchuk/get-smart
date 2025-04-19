## 🔄 Log Rotation with Logger

To prevent log files from growing indefinitely, Logger can automatically rotate them by size or date. When you pass a shift parameter, you tell Logger how often and how many old files to keep. This ensures your disk space stays under control without manual cleanup.

```ruby
require 'logger'

# Rotate daily, keep 7 days of logs
logger = Logger.new('app.log', 'daily', 7)
logger.info('Daily log entry')
```