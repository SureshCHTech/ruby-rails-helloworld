# Use the official Ruby image from Docker Hub with specified version
FROM ruby:2.3.0

# Set the working directory in the container
WORKDIR /app

# Copy the Gemfile and Gemfile.lock from the project root directory into the container
COPY Gemfile Gemfile.lock ./

# Install Bundler
RUN gem install bundler

# Install Ruby dependencies
RUN bundle install

# Copy the rest of the application code into the container
COPY . .

# Expose port (if necessary)
EXPOSE 4567

# Command to run the application
CMD ["ruby", "app.rb"]
