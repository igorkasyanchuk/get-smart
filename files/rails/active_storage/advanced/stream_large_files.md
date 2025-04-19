## 🚀 Streaming Large Files with Range Requests

For serving huge blobs without loading them fully into memory, use `send_data` with streaming and HTTP range support. This enables resumable downloads and efficient memory usage.

```ruby
# app/controllers/blobs_controller.rb
class BlobsController < ApplicationController
  include ActionController::Live

  def show
    blob = ActiveStorage::Blob.find_signed(params[:signed_id])
    response.headers["Accept-Ranges"] = "bytes"
    range = request.headers["Range"]

    blob.open do |file|
      offset, length = parse_range(range, file.size)
      file.seek(offset)
      streaming_length = length || (file.size - offset)

      response.status = length ? :partial_content : :ok
      response.headers["Content-Range"] = "bytes #{offset}-#{offset + streaming_length - 1}/#{file.size}"
      response.headers["Content-Length"] = streaming_length.to_s
      send_data(file.read(streaming_length), disposition: "attachment", filename: blob.filename.to_s)
    end
  ensure
    response.stream.close
  end

  private

  def parse_range(range_header, size)
    return [0, nil] unless range_header
    matches = /bytes=(\d+)-(\d*)/.match(range_header)
    start_byte = matches[1].to_i
    end_byte = matches[2].present? ? matches[2].to_i : size - 1
    [start_byte, end_byte - start_byte + 1]
  end
end
```