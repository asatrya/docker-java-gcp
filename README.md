# Quickstart

## Set GCP Project ID

Copy `.env.sample` to `.env` and replace `your-project-id` with yout GCP project ID

```$xslt
GOOGLE_PROJECT_ID=your-project-id
```

## Set GCP Service Account Key

You need to already created a service account and have it's key. Copy `gcp-key.sample.json` and rename to `gcp-key.json`, then copy paste your key to `gcp-key.json`.

## Build and Run

You need to have Docker Compose installed. Build docker image and run docker container with this command

```bash
$ docker-compose up -d --build
```  

## Test

Go inside the container

```bash
$ docker-compose exec app bash
```

On the container's bash, run:

```bash
$ gsutil ls
```

If everything OK, this command will run successfully and return list of buckets in Google Cloud Storage.

In fact, you can run any `gcloud` command line that is permissible for the service account that is used.