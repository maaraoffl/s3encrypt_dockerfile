FROM java:openjdk-8-alpine
MAINTAINER "survivewithodds@gmail.com"

ARG AWS_ACCESS_KEY_ID
ARG AWS_SECRET_ACCESS_KEY

ENV AWS_ACCESS_KEY_ID $AWS_ACCESS_KEY_ID
ENV AWS_SECRET_ACCESS_KEY $AWS_SECRET_ACCESS_KEY

RUN apk --update add ruby ruby-rdoc ruby-irb
RUN gem install s3encrypt

COPY get_file.rb .
COPY hello.txt .

RUN chmod 777 get_file.rb hello.txt
RUN ruby /get_file.rb "hello.txt" "hola.txt" "dockmycontent" 'YYYY' 'ABCD-EFGH'

CMD ["/bin/sh", "-c"]
