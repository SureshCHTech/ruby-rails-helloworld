# Use the official Ruby image from Docker Hub
FROM ruby:latest

# Set the working directory in the container
WORKDIR /app

# Copy the Gemfile and Gemfile.lock from the project root directory into the container
COPY Gemfile Gemfile.lock ./

# Install Ruby dependencies
RUN bundle install

# Copy the rest of the application code into the container
COPY . .

# Expose port 4567 (change to your application's actual port)
EXPOSE 4567

# Command to run the application
CMD ["ruby", "app.rb", "-o", "0.0.0.0", "-p", "4567"]
