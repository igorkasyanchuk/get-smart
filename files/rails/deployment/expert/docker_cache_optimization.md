## 🚀 Optimized Multi-Stage Docker Builds for Rails

Use multi-stage builds and leverage buildkit caching to minimize image size and accelerate CI/CD. Separate dependencies (gems, node modules) from application code, and mount cache directories during development or CI to reuse layers across builds.

```dockerfile
# Stage 1: dependencies
FROM ruby:3.2 AS builder
WORKDIR /app
COPY Gemfile* ./
RUN bundle config set --local deployment true && \
    bundle install --jobs=4 --retry=3

# Stage 2: assets
FROM node:18 AS assets
WORKDIR /app
COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile
COPY . .
RUN RAILS_ENV=production yarn build

# Stage 3: final image
FROM ruby:3.2-slim
WORKDIR /app
COPY --from=builder /usr/local/bundle /usr/local/bundle
COPY --from=assets /app/public /app/public
COPY . .
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
```

Enable BuildKit cache mounting during CI:
```bash
DOCKER_BUILDKIT=1 docker build --cache-from=myapp:cache -t myapp:latest .
```