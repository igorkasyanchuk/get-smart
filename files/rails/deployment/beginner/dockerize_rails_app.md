## 🐳 Dockerize Rails App
Docker lets you package your Rails app and its dependencies into a portable container. This example shows a minimal `Dockerfile` and commands to build and run your app locally.

```dockerfile
# Use official Ruby runtime as a parent image
FROM ruby:2.7

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Set up working directory
WORKDIR /app

# Cache and install gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy the rest of the app code
COPY . ./

# Expose default Rails port
EXPOSE 3000

# Start the Rails server
CMD ["rails","server","-b","0.0.0.0"]
```

Build and run the container:

```bash
# Build the Docker image
docker build -t my-rails-app .

# Run the container, mapping port 3000
docker run -p 3000:3000 my-rails-app
```