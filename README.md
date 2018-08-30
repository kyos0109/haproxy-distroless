# haproxy-distroless

docker run -it --rm kyos0109/haproxy-distroless:latest --help

```
docker run -d --name haproxy \
-v $(pwd)/haproxy.cfg:/haproxy.cfg \
-p 80:80 \
kyos0109/haproxy-distroless -f /haproxy.cfg
```
