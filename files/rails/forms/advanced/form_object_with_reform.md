## 📝 Form Object Pattern with Reform

Use the Reform gem to decouple form logic from ActiveRecord, centralizing validation and coercion. Define a Reform form that wraps one or more models, enabling complex form composition.

```ruby
# app/forms/event_form.rb
class EventForm < Reform::Form
  include Reform::Form::ActiveRecord

  property :title
  property :start_date, type: Types::Form::DateTime
  property :location

  validation do
    required(:title).filled(:str?)
    required(:start_date).filled
    required(:location).filled
  end
end
```

```ruby
# app/controllers/events_controller.rb
def new
  @form = EventForm.new(Event.new)
end

def create
  @form = EventForm.new(Event.new)
  if @form.validate(params[:event])
    @form.save
    redirect_to @form.model
  else
    render :new
  end
end
```