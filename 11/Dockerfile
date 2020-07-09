FROM postgres:11
RUN apt-get update && \
  apt-get install -y --no-install-recommends \
    curl \
	  ca-certificates \
	  build-essential \
	  postgresql-server-dev-${PG_MAJOR} \
	  libssl-dev \
	  libkrb5-dev && \
  mkdir -p /tmp/pgaudit && \
  cd /tmp/pgaudit && \
  curl -L https://github.com/pgaudit/pgaudit/archive/1.3.1.tar.gz | tar xz --strip 1 && \
  make -C /tmp/pgaudit/ install USE_PGXS=1 && \
  apt-get purge libssl-dev libkrb5-dev curl ca-certificates build-essential postgresql-server-dev-${PG_MAJOR} --auto-remove -y && \
  rm -rf /var/lib/apt/lists/*

COPY pgaudit-docker-entrypoint.sh /usr/local/bin/
COPY init.sql /docker-entrypoint-initdb.d/

ENTRYPOINT ["pgaudit-docker-entrypoint.sh"]
CMD ["postgres"]
