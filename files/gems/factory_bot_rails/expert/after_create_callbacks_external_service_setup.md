## 🌐 Use Callbacks to Stub External Services and Seed Complex State

For scenarios where creating a record triggers external API calls or background jobs, tie into FactoryBot’s callbacks to stub these interactions or enqueue test‑friendly jobs. This ensures your factories remain reliable and side‑effect free in test environments.

```ruby
FactoryBot.define do
  factory :payment do
    amount { 1000 }
    status { :pending }

    after(:build) do |payment|
      # Prevent real Stripe client from initializing
      allow(Stripe::Charge).to receive(:create).and_return(
        OpenStruct.new(id: "ch_test_123", status: "succeeded")
      )
    end

    after(:create) do |payment|
      # Seed application state or async jobs
      payment.update!(status: :succeeded)
      payment.transactions.create!(external_id: "txn_#{SecureRandom.hex(4)}")
      # Enqueue a lightweight test job instead of real one
      TestWorker.perform_async(payment.id)
    end
  end
end

# In your spec:
payment = create(:payment)
expect(payment.status).to eq("succeeded")
expect(TestWorker).to have_enqueued_sidekiq_job(payment.id)
```

This pattern isolates external dependencies and seeds downstream objects or jobs reliably at factory time.