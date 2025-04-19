## 🚀 Parameterized Shared Examples with Dynamic Class Resolution

Create highly reusable shared examples by parameterizing both resource names and factory names, resolving constants dynamically. This pattern allows you to DRY up CRUD specs for multiple controllers or services.

Define the shared examples with dynamic constantization:

```ruby
# spec/support/shared_examples/crud_service.rb
RSpec.shared_examples 'a CRUD service' do |resource_name:, factory: nil|
  factory ||= resource_name
  klass = resource_name.to_s.classify.constantize

  describe 'CREATE operation' do
    subject { service.create(params) }
    let(:service) { described_class.new }
    let(:params) { attributes_for(factory) }

    it 'increments record count' do
      expect { subject }.to change(klass, :count).by(1)
    end
  end

  describe 'READ operation' do
    let!(:record) { create(factory) }

    it 'finds the record' do
      expect(service.find(record.id)).to eq(record)
    end
  end

  describe 'UPDATE operation' do
    let!(:record) { create(factory) }
    let(:new_attrs) { attributes_for(factory) }

    it 'updates attributes' do
      expect { service.update(record.id, new_attrs) }
        .to change { record.reload.attributes }
    end
  end

  describe 'DELETE operation' do
    let!(:record) { create(factory) }

    it 'removes the record' do
      expect { service.delete(record.id) }.to change(klass, :count).by(-1)
    end
  end
end
```

Include it in your service specs with parameters:

```ruby
# spec/services/user_service_spec.rb
RSpec.describe UserService do
  include_examples 'a CRUD service', resource_name: :user, factory: :user
end

# spec/services/article_service_spec.rb
RSpec.describe ArticleService do
  include_examples 'a CRUD service', resource_name: :article
end
```

This pattern scales to any resource/service pairing, minimizing boilerplate across your test suite.
