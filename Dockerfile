# Use the official Ruby image
FROM ruby:2.7

# Set the working directory in the container
WORKDIR /app

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile Gemfile.lock ./

# Install dependencies using Bundler
RUN gem install bundler && bundle install

# Copy the rest of the application code into the container
COPY . .

# Expose any ports your application may use
EXPOSE 3000

# Set the default command to run when the container starts
CMD ["ruby", "app.rb"]
