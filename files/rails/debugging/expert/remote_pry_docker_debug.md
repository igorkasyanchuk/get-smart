## 🌐 Remote Pry Debugging in Docker

When your Rails app runs in Docker or Kubernetes, local `binding.pry` won't attach. `pry-remote` opens a TCP server inside the container—just forward the port to your host and connect remotely.

```ruby
# Gemfile (development group)
gem 'pry-remote'

# In your code
def risky_method
  require 'pry-remote'; binding.remote_pry
  # execution pauses until you connect
  do_critical_work
end
```

Start your container with port 9876 exposed:

```bash
docker run -p 9876:9876 my-app:dev
```  

Then from your host shell:

```bash
pry-remote --host 127.0.0.1 --port 9876
```  

You’ll get a pry session in the exact context of your running container. No more guessing with logs across environments!