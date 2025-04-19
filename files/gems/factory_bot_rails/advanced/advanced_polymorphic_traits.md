## 🧩 Advanced Polymorphic Trait Composition

When working with polymorphic associations or Single Table Inheritance (STI), you can define generic traits and then compose them for different subtypes. This approach keeps your factories DRY while allowing you to override or extend behavior per subtype.

```ruby
describe FactoryBot do
  factory :attachment do
    file { Rack::Test::UploadedFile.new('spec/fixtures/sample.pdf', 'application/pdf') }

    trait :image do
      file { Rack::Test::UploadedFile.new('spec/fixtures/sample.png', 'image/png') }
      association :attachable, factory: :photo
    end

    trait :document do
      association :attachable, factory: :document_record
    end
  end
end

# Usage in specs:
let(:image_attachment) { create(:attachment, :image) }
let(:doc_attachment)   { create(:attachment, :document) }
```