## 🛠️ Schema-driven Parsing with Dry::Struct Coercions

Enforce strict schemas by combining Ruby CSV converters with Dry::Struct to map each row to a typed struct. This guarantees data integrity and leverages Coercible types for automatic casting.

```ruby
require 'csv'
require 'dry-struct'
module Types
  include Dry.Types()
end
class Transaction < Dry::Struct
  attribute :id,     Types::Coercible::Integer
  attribute :amount, Types::Coercible::Float
  attribute :date,   Types::Params::Date
end

records = CSV.read('transactions.csv', headers: true, converters: [:date]).map do |row|
  Transaction.new(row.to_hash)
end
records.each { |tx| puts "ID: #{tx.id}, Amount: #{tx.amount}, Date: #{tx.date}" }
```