## OpenCloud Settings ##
# Beside Traefik, this service must stay enabled.
# Note: the leading colon is required to enable the service.
OPENCLOUD=:opencloud.yml
# Domain of openCloud, where you can find the frontend.
# Defaults to "cloud.opencloud.test"
OC_DOMAIN=cloud.docker-prd.darksaber.fyi
# openCloud admin user password. Defaults to "admin".
ADMIN_PASSWORD=op://secrets/opencloud/env/adminpw

# S3 Storage configuration - optional
# OpenCloud supports S3 storage as primary storage.
# Per default, S3 storage is disabled and the decomposed storage driver is used.
# To enable S3 storage, uncomment the following line and configure the S3 storage.
# For more details see:
# https://doc.opencloud.eu/opencloud/next/deployment/storage/decomposeds3.html
# Note: the leading colon is required to enable the service.
DECOMPOSEDS3=:decomposeds3.yml
# Configure the S3 storage endpoint. Defaults to "http://minio:9000" for testing purposes.
DECOMPOSEDS3_ENDPOINT=http://minio:9000
# S3 region. Defaults to "default".
DECOMPOSEDS3_REGION=default
# S3 access key. Defaults to "opencloud"
DECOMPOSEDS3_ACCESS_KEY=op://secrets/opencloud/env/decomposeds3-access-key
# S3 secret. Defaults to "opencloud-secret-key"
DECOMPOSEDS3_SECRET_KEY=op://secrets/opencloud/env/decomposeds3-secret-key
# S3 bucket. Defaults to "opencloud"
DECOMPOSEDS3_BUCKET=op://secrets/opencloud/env/decomposeds3-bucket
#
# For testing purposes, add local minio S3 storage to the docker-compose file.
# The leading colon is required to enable the service.
DECOMPOSEDS3_MINIO=:minio.yml
# Minio domain. Defaults to "minio.opencloud.test".
MINIO_DOMAIN=minio.docker-prd.darksaber.fyi

# Addititional services to be started on opencloud startup
# The following list of services is not startet automatically and must be
# manually defined for startup:
# IMPORTANT: The notification service is MANDATORY, do not delete!
# IMPORTANT: Add any services to the startup list comma separated like "notifications,antivirus" etc.
START_ADDITIONAL_SERVICES="notifications"


## openCloud Web Extensions ##
# It is possible to use the openCloud Web Extensions to add custom functionality to the openCloud frontend.
# For more details see https://github.com/opencloud-eu/web-extensions/blob/main/README.md
# Note: the leading colon is required to enable the service.
# Enable this to create a new named volume
EXTENSIONS=:web_extensions/extensions.yml
# Enable the desired extensions by uncommenting the following lines.
# Note: the leading colon is required to enable the service.
# Note: if you want to remove a web extension, you must delete the opencloud-apps volume. It will be properly recreated on docker compose startup.
UNZIP=:web_extensions/unzip.yml
DRAWIO=:web_extensions/drawio.yml
JSONVIEWER=:web_extensions/jsonviewer.yml
PROGRESSBARS=:web_extensions/progressbars.yml
EXTERNALSITES=:web_extensions/externalsites.yml
# External Sites needs additional config, see the following files for more details.
# - config/opencloud/apps.yaml
# - config/opencloud/csp.yaml
#IMPORTER=:web_extensions/importer.yml
# The importer needs additional config, see the following lines for more details.
# Domain of Uppy Companion. Defaults to "companion.opencloud.test".
COMPANION_DOMAIN=companion.docker-prd.darksaber.fyi
# Provider settings, see https://uppy.io/docs/companion/#provideroptions for reference.
# Empty by default, which disables providers.
COMPANION_ONEDRIVE_KEY=
COMPANION_ONEDRIVE_SECRET=


## Default Enabled Services ##

### Apache Tika Content Analysis Toolkit ###
# Tika (search) is enabled by default, comment if not required.
# Note: the leading colon is required to enable the service.
TIKA=:tika.yml


### IMPORTANT Note for Online Office Apps ###
# To avoid app interlocking issues, you should select only one app to be active/configured.
# This is due the fact that there is currently no app interlocking for the same file and one
# has to wait for a lock release to open the file with another app.

### Collabora Settings ###
# Collabora web office is default enabled, comment if not required.
# Note: the leading colon is required to enable the service.
COLLABORA=:collabora.yml
# Domain of Collabora, where you can find the frontend.
# Defaults to "collabora.opencloud.test"
COLLABORA_DOMAIN=collabora.docker-prd.darksaber.fyi
# Domain of the wopiserver which handles OnlyOffice.
# Defaults to "wopiserver.opencloud.test"
WOPISERVER_DOMAIN=wopiserver.docker-prd.darksaber.fyi
# Admin user for Collabora.
# Defaults to "admin".
# Collabora Admin Panel URL:
# https://{COLLABORA_DOMAIN}/browser/dist/admin/admin.html
COLLABORA_ADMIN_USER=admin
# Admin password for Collabora.
# Defaults to "admin".
COLLABORA_ADMIN_PASSWORD=op://secrets/opencloud/env/collabora-admin-password
# Set to true to enable SSL for Collabora Online. Default is true if not specified.
COLLABORA_SSL_ENABLE=true
# If you're on an internet-facing server, enable SSL verification for Collabora Online.
# Please comment out the following line:
COLLABORA_SSL_VERIFICATION=true


## Supplemental Configurations ##
# If you want to use supplemental configurations,
# you need to uncomment lines containing :path/file.yml
# and configure the service as required.


### Debugging - Monitoring ###
# Please see documentation at: https://opencloud.dev/opencloud/deployment/monitoring-tracing/
# Note: the leading colon is required to enable the service.
#MONITORING=:monitoring_tracing/monitoring.yml


### Virusscanner Settings ###
# IMPORTANT: If you enable antivirus, you also MUST configure the START_ADDITIONAL_SERVICES
# envvar in the OpenCloud Settings above by adding 'antivirus' to the list.
# Note: the leading colon is required to enable the service.
#CLAMAV=:clamav.yml
# Image version of the ClamAV container.
# Defaults to "latest"
CLAMAV_DOCKER_TAG=


### OnlyOffice Settings ###
# Note: the leading colon is required to enable the service.
# ONLYOFFICE=:onlyoffice.yml
# Domain for OnlyOffice. Defaults to "onlyoffice.opencloud.test".
ONLYOFFICE_DOMAIN=onlyoffice.docker-prd.darksaber.fyi
# Domain for the wopiserver which handles OnlyOffice.
WOPISERVER_ONLYOFFICE_DOMAIN=wopiserver-oo.docker-prd.darksaber.fyi


### Inbucket Settings ###
# Inbucket is a mail catcher tool for testing purposes.
# DO NOT use in Production.
# Note: the leading colon is required to enable the service.
#INBUCKET=:inbucket.yml
# email server (in this case inbucket acts as mail catcher).
# Domain for Inbucket. Defaults to "mail.opencloud.test".
INBUCKET_DOMAIN=

### Compose Configuration ###
# Path separator for supplemental compose files specified in COMPOSE_FILE.
COMPOSE_PATH_SEPARATOR=:

## IMPORTANT ##
# This MUST be the last line as it assembles the supplemental compose files to be used.
# ALL supplemental configs must be added here, whether commented or not.
# Each var must either be empty or contain :path/file.yml
COMPOSE_FILE=docker-compose.yml${OPENCLOUD:-}${TIKA:-}${DECOMPOSEDS3:-}${DECOMPOSEDS3_MINIO:-}${POSIX:-}${COLLABORA:-}${MONITORING:-}${IMPORTER:-}${CLAMAV:-}${ONLYOFFICE:-}${INBUCKET:-}${EXTENSIONS:-}${UNZIP:-}${DRAWIO:-}${JSONVIEWER:-}${PROGRESSBARS:-}${EXTERNALSITES:-}