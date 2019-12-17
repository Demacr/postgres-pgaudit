#!/bin/bash

IS_AUDIT_LOG_ENABLED=${IS_AUDIT_LOG_ENABLED:-false}
echo "IS_AUDIT_LOG_ENABLED=$IS_AUDIT_LOG_ENABLED"

PGAUDIT_LOG_ARGS=""
if [ ${IS_AUDIT_LOG_ENABLED} = "true" ] ; then
    PGAUDIT_LOG=${PGAUDIT_LOG:-}
    echo "PGAUDIT_LOG=$PGAUDIT_LOG"

    PGAUDIT_LOG_LEVEL=${PGAUDIT_LOG_LEVEL:-LOG}
    echo "PGAUDIT_LOG_LEVEL=$PGAUDIT_LOG_LEVEL"

    PGAUDIT_LOG_CATALOG=${PGAUDIT_LOG_CATALOG:-on}
    echo "PGAUDIT_LOG_CATALOG=$PGAUDIT_LOG_CATALOG"

    PGAUDIT_LOG_PARAMETER=${PGAUDIT_LOG_PARAMETER:-on}
    echo "PGAUDIT_LOG_PARAMETER=$PGAUDIT_LOG_PARAMETER"

    PGAUDIT_LOG_ARGS="-c shared_preload_libraries=pgaudit -c log_destination=csvlog -c logging_collector=on -c pgaudit.log=$PGAUDIT_LOG -c pgaudit.log_level=$PGAUDIT_LOG_LEVEL -c pgaudit.log_catalog=$PGAUDIT_LOG_CATALOG -c pgaudit.log_parameter=$PGAUDIT_LOG_PARAMETER "
    echo "PGAUDIT_LOG_ARGS=$PGAUDIT_LOG_ARGS"
fi

echo Running cmd: docker-entrypoint.sh "$@" $PGAUDIT_LOG_ARGS
exec docker-entrypoint.sh "$@" $PGAUDIT_LOG_ARGS
