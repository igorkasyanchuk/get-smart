## 📤 Render Turbo Stream Responses

In your controller, respond to Turbo Stream requests with `format.turbo_stream`. Create a `.turbo_stream.erb` view to send updates back to the client.

```ruby
def create
  @comment = @post.comments.create(comment_params)
  respond_to do |format|
    format.html { redirect_to @post }
    format.turbo_stream
  end
end
```  
```erb
<!-- app/views/comments/create.turbo_stream.erb -->
<%= turbo_stream.append "comments", partial: "comments/comment", locals: { comment: @comment } %>
```