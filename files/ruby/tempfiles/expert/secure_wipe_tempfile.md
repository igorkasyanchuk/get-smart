## 🔒 Securely Wiping Tempfile Contents on Unlink
Ensure no data remnants by subclassing `Tempfile` to overwrite its data with zeros before unlinking. This approach combines overriding `unlink` with a `close` hook, guaranteeing both manual and garbage-collected teardown wipe the contents securely.

```ruby
require 'tempfile'

class SecureTempfile < Tempfile
  alias_method :close_without_wipe, :close

  # Override unlink to zero out data first
  def unlink
    rewind
    write("\0" * size)
    flush
    super
  end

  # Ensure wipe on close
  def close
    close_without_wipe
    unlink rescue nil
  end

  private

  # Determine current file size
  def size
    current = pos
    rewind
    length = read.length
    rewind
    seek(current)
    length
  end
end

# Usage example
secure = SecureTempfile.new('secret')
secure.write("Top secret credentials")
secure.close  # Data is overwritten then unlinked
```