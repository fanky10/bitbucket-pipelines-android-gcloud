# bitbucket-pipelines-android-gcloud
android and gcloud that allows Firebase Test-lab integration

[Bitbucket Pipelines](https://bitbucket.org/product/features/pipelines) [Docker](https://www.docker.com/) image based on [image](https://hub.docker.com/r/bitbucketpipelines/android-ci-image)

More help in Bitbucket's [Confluence](https://confluence.atlassian.com/bitbucket/bitbucket-pipelines-beta-792496469.html)

Docker image at [fanky10/bitbucket-pipelines-android-gcloud](https://hub.docker.com/r/fanky10/bitbucket-pipelines-android-gcloud) (no `CMD` as it is overriden by *Pipelines*)

## Packages installed
 - `curl`, `python3-dev`, `python3-crcmod`, `apt-transport-https`, `lsb-release`, `openssh-client`
 - `git`, `make`, `gnupg`
 - [Google Cloud SDK](https://cloud.google.com/sdk/docs/)

## Sample `bitbucket-pipelines.yml`

```YAML
image: fanky10/bitbucket-pipelines-android-gcloud
pipelines:
  default:
    - step:
        script:
          - echo ${GOOGLE_CLIENT_SECRET} > client-secret.json
          - gcloud auth activate-service-account --key-file client-secret.json
          - gcloud config set project $CLOUDSDK_CORE_PROJECT
          - gcloud {custom_params}
```


## Changelog

### 1.0

 - Initial release
 - Google Cloud SDK version 309.0.0
