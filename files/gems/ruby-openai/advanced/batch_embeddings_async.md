## 📈 Batch Embedding with Sidekiq and Caching

For large‐scale similarity search, process texts in batches asynchronously using Sidekiq and cache embeddings in Redis or a vector store. Chunk your corpus, enqueue jobs, and dedupe embeddings to minimize API calls and speed up lookups.

```ruby
# app/workers/embedding_worker.rb
class EmbeddingWorker
  include Sidekiq::Worker
  sidekiq_options retry: 3

  def perform(doc_id, text)
    cache_key = "embedding:#{doc_id}"
    return if Redis.current.exists(cache_key)

    client = OpenAI::Client.new(access_token: ENV["OPENAI_API_KEY"])
    resp   = client.embeddings.parameters(model: "text-embedding-ada-002", input: text)
    vector = resp.dig("data", 0, "embedding")

    # Store in Redis or push to Pinecone
    Redis.current.set(cache_key, vector.to_json)
  end
end

# Enqueue in batch
documents.each_slice(50) do |batch|
  batch.each { |doc| EmbeddingWorker.perform_async(doc.id, doc.content) }
end
```

By batching and caching, you avoid redundant embeddings, respect rate limits, and seamlessly integrate with vector stores for fast nearest‑neighbor searches.