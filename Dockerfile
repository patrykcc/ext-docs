FROM nginx:1.10-alpine

RUN apk --update add python3 python3-dev py-pip && \
    pip install --upgrade pip && \
    pip install mkdocs && \
    pip install mkdocs-material && \
    pip install pymdown-extensions

ADD . /site

WORKDIR /site

RUN mkdocs build && mv site/* /usr/share/nginx/html/
