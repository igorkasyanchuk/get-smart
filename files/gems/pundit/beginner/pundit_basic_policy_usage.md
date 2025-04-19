## 📜 Create a Basic Policy and Use authorize

Pundit policies define what actions a user can perform on resources. Generate a policy, define authorization methods, and use `authorize` in your controllers to enforce them.

```bash
# Generate a policy for Post
rails generate pundit:policy post
```

```ruby
# app/policies/post_policy.rb
class PostPolicy < ApplicationPolicy
  def update?
    user.admin? || record.user_id == user.id
  end

  def destroy?
    user.admin?
  end
end
```

```ruby
# app/controllers/posts_controller.rb
class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  def update
    authorize @post
    if @post.update(post_params)
      redirect_to @post, notice: 'Post updated successfully.'
    else
      render :edit
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
```