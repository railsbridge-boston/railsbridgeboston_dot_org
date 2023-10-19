# [Choice] Ruby version (use -bullseye variants on local arm64/Apple Silicon): 3, 3.1, 3.0, 2, 2.7, 2.6, 3-bullseye, 3.1-bullseye, 3.0-bullseye, 2-bullseye, 2.7-bullseye, 2.6-bullseye, 3-buster, 3.1-buster, 3.0-buster, 2-buster, 2.7-buster, 2.6-buster
ARG VARIANT
FROM mcr.microsoft.com/vscode/devcontainers/ruby:0-${VARIANT}
ARG BUNDLER_VERSION
ARG NODE_VERSION
ARG RAILS_VERSION

# Install Rails
RUN gem install rails:${RAILS_VERSION} webdrivers

# Default value to allow debug server to serve content over GitHub Codespace's port forwarding service
# The value is a comma-separated list of allowed domains 
ENV RAILS_DEVELOPMENT_HOSTS=".githubpreview.dev,.preview.app.github.dev,.app.github.dev"

RUN su vscode -c "source /usr/local/share/nvm/nvm.sh && nvm install ${NODE_VERSION} 2>&1"

# set correct folder permissions for gems folder
RUN chown -R vscode /usr/local/rvm/gems/default

# install flyctl
RUN su vscode -c "curl -L https://fly.io/install.sh | sh"
ENV FLYCTL_INSTALL "/home/vscode/.fly"
ENV PATH "$FLYCTL_INSTALL/bin:$PATH"

# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
RUN echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends postgresql-client-15

# [Optional] Uncomment this line to install additional gems.
# RUN gem install <gems>

# [Optional] Uncomment this line to install global node packages.
# RUN su vscode -c "source /usr/local/share/nvm/nvm.sh && npm install -g <your-package-here>" 2>&1
