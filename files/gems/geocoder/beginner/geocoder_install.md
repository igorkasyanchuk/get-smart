## 📌 Install and Configure Geocoder

Start by adding the `geocoder` gem to your Gemfile and running `bundle install`. Next, generate a migration to add `latitude` and `longitude` columns to your model (for example, `User`). This setup is required before you can convert addresses to coordinates.

```ruby
# Gemfile
gem 'geocoder'

# Run in terminal
t$ bundle install
$ rails generate migration AddLatitudeAndLongitudeToUsers latitude:float longitude:float
$ rails db:migrate
```