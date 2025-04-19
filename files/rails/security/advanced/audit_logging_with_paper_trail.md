## 📝 Audit Logging with PaperTrail and Encrypted Logs

Track record changes and store encrypted logs for compliance. Use `paper_trail` with an encrypted database column or external log service.

```ruby
gem 'paper_trail'
```

```ruby
# app/models/application_record.rb
has_paper_trail

# config/initializers/paper_trail.rb
PaperTrail.serializer = PaperTrail::Serializers::JSON
```