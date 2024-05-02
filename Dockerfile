# Use the official Ruby image
FROM ruby:latest

# Install essential Linux packages
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    nodejs \
    yarn \
    sqlite3 \
    --no-install-recommends

# Set the working directory in the container
WORKDIR /app

# Copy the Gemfile and Gemfile.lock from the project root directory into the container
COPY Gemfile Gemfile.lock ./

# Install Ruby dependencies
RUN gem install bundler && bundle install

# Copy the rest of the application code into the container
COPY . .

# Expose port 3000 to the outside world
EXPOSE 3000

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
