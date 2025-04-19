## 🧪 Isolated Testing of Helper Methods with ActionView::Base
Test helper logic outside of controllers or views by instantiating `ActionView::Base` with view paths and including your helper modules. This isolation ensures pure unit tests for formatting or tag‑building methods.

```ruby
# spec/helpers/application_helper_spec.rb
require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  let(:av) do
    ActionView::Base.new(Rails.configuration.paths['app/views'], {}, ApplicationController.new)
                  .tap { |view| view.extend(ApplicationHelper) }
  end

  it 'generates an icon_for_post' do
    expect(av.icon_for_post).to match /<i.*class="icon-post".*>/
  end
end
```