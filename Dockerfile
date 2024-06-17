# fluentd/Dockerfile
FROM fluent/fluentd:v1.12.0-debian-1.0
USER root
RUN gem install elasticsearch -v 7.13.3
RUN ["gem", "install", "excon", "--no-document", "--version", "0.109.0"]
RUN ["gem", "install", "fluent-plugin-elasticsearch", "--no-document", "--version", "5.0.3"]
USER fluent
