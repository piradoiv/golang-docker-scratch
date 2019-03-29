FROM ubuntu:19.04 as build
RUN apt update
RUN apt install golang -y -qq
ADD /src /src
RUN cd /src && CGO_ENABLED=0 go build -o /server
RUN strip /server

FROM scratch
COPY --from=build /server /server
ENTRYPOINT ["/server"]
EXPOSE 8000

