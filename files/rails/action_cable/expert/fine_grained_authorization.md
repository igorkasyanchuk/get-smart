## 🛡️ Implement Fine‑Grained Channel Authorization and Group Subscriptions

Instead of broad channel subscriptions, authorize each stream in `subscribed` using your domain logic. This prevents unauthorized access to data and lets you subscribe a user to multiple dynamic streams (e.g., project or team rooms).

```ruby
# app/channels/projects_channel.rb
class ProjectsChannel < ApplicationCable::Channel
  def subscribed
    project = Project.find(params[:project_id])
    return reject unless current_user.can_view?(project)

    stream_for project
    # join a team room too
    if params[:team_id]
      team = project.teams.find(params[:team_id])
      stream_for team if current_user.member_of?(team)
    end
  end

  def unsubscribed
    # cleanup or logging
  end
end
```

Client-side, you can channel multiplex:

```js
consumer.subscriptions.create(
  { channel: "ProjectsChannel", project_id: 42, team_id: 7 },
  { received: data => console.log('Update:', data) }
)
```