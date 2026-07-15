FROM docker.io/hugomods/hugo:exts AS build
COPY . /src
WORKDIR /src
RUN git submodule update --init --recursive
RUN hugo

FROM docker.io/library/nginx:alpine
COPY --from=build /src/public/ /usr/share/nginx/html/
