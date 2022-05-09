GOOGLE_PROJECT_ID=red-bruin-349004
CLOUD_RUN_SERVICE=bark-bark-test
INSTANCE_CONNECTION_NAME=red-bruin-349004:us-central1:barkbark
DB_USER=root
DB_PASSWORD=sorrythisisforprivateusage
DB_NAME=Productiondatabase

gcloud builds submit --tag gcr.io/${GOOGLE_PROJECT_ID}/${CLOUD_RUN_SERVICE}\
    --project ${GOOGLE_PROJECT_ID}

gcloud run deploy ${CLOUD_RUN_SERVICE} \
    --image gcr.io/${GOOGLE_PROJECT_ID}/${CLOUD_RUN_SERVICE} \
    --add-cloudsql-instances ${INSTANCE_CONNECTION_NAME} \
    --update-env-vars INSTANCE_CONNECTION_NAME=${INSTANCE_CONNECTION_NAME},DB_USER=${DB_USER},DB_PASS=${DB_PASSWORD},DB_NAME=${DB_NAME} \
    --platform managed \
    --region us-central1 \
    --project ${GOOGLE_PROJECT_ID}