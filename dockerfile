FROM ubuntu:latest

# Install necessary packages
RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get install -y build-essential git

# Add your repository to the container
# Assuming you have a .git directory in the local repository, you need to copy it explicitly
COPY . /app
WORKDIR /app

# Copy the post-checkout hook to the .git/hooks directory
RUN cp post-checkout .git/hooks/post-checkout

# Ensure the post-checkout hook is executable
RUN chmod +x .git/hooks/post-checkout

RUN echo "Git hooks installed."