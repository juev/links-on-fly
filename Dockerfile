# Pull in latest linkding docker image.
FROM sissbruecker/linkding:latest

# Copy custom uwsgi. This allows to run with 256MB RAM.
COPY uwsgi.ini /etc/linkding/uwsgi.ini

# Litestream spawns linkding's webserver as subprocess.
CMD ["./bootstrap.sh"]