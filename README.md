# bitbucket-pipelines-android-gcloud
android and gcloud that allows Firebase Test-lab integration

[Bitbucket Pipelines](https://bitbucket.org/product/features/pipelines) [Docker](https://www.docker.com/) image based on [image](https://hub.docker.com/_/debian)

More help in Bitbucket's [Pipelines feature](https://bitbucket.org/product/features/pipelines)

Docker image at [fanky10/bitbucket-pipelines-android-gcloud](https://hub.docker.com/r/fanky10/bitbucket-pipelines-android-gcloud) (no `CMD` as it is overriden by *Pipelines*)

## Packages installed
 - [Google Cloud SDK](https://cloud.google.com/sdk/docs/)
 - [Open JDK 11](https://openjdk.java.net/projects/jdk/11/)
 - [Android SDK](https://developer.android.com/studio#command-tools)

## Sample `bitbucket-pipelines.yml`

```YAML
image: fanky10/bitbucket-pipelines-android-gcloud
pipelines:
  default:
    - step:
       name: Build Release
       script:
         - ./gradlew :app:bundleRelease
       artifacts:
         - app/build/outputs/**
    - step:
        script:
          - echo ${GOOGLE_CLIENT_SECRET} > client-secret.json
          - gcloud auth activate-service-account --key-file {client-secret.json}
          - gcloud config set project $CLOUDSDK_CORE_PROJECT
          - gcloud {custom_params}
```


## Changelog

### 1.1

- Updates Image base to latest debian (which is, at the time of this writing, debian:buster)
- Adds support to Java 11
- Upgrades Google Cloud SDK to 384.0.1


### 1.0

 - Initial release
 - Google Cloud SDK version 309.0.0
