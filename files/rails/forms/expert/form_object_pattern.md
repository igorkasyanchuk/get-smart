## 🔧 Form Object Pattern with ActiveModel for Complex Workflows
Use PORO form objects to decouple form logic from AR models when saving to multiple tables or invoking service calls. Include `ActiveModel::Model` and define custom validations, mapping input to services in a single transaction.

```ruby
# app/forms/user_signup_form.rb
class UserSignupForm
  include ActiveModel::Model
  attr_accessor :email, :password, :profile_attributes
  validates :email, format: /@/, presence: true
  validates :password, length: { minimum: 8 }
  validate :unique_email

  def save
    return false unless valid?
    ActiveRecord::Base.transaction do
      user = User.create!(email: email, password: password)
      user.create_profile!(profile_attributes)
      WelcomeMailer.welcome_email(user).deliver_later
    end
    true
  end

  private
  def unique_email
    errors.add(:email, 'is taken') if User.exists?(email: email)
  end
end

# In controller
def create
  form = UserSignupForm.new(signup_params)
  if form.save
    redirect_to root_path, notice: 'Signed up!'
  else
    render :new
  end
end
```