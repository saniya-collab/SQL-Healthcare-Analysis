FROM postgres:16-alpine

# These are placeholders; actual values should be passed at runtime
ENV POSTGRES_USER=${POSTGRES_USER:-postgres} \
    POSTGRES_PASSWORD=${POSTGRES_PASSWORD:-postgres} \
    POSTGRES_DB=${POSTGRES_DB:-hospitaldb}

# Copy SQL file to auto-init location (only runs on first container start)
COPY ["Sql_assignment.sql", "/docker-entrypoint-initdb.d/init.sql"]
