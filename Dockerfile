FROM debian

# Google cli docker config
# from: https://cloud.google.com/sdk/docs/downloads-apt-get
# and https://github.com/GoogleCloudPlatform/cloud-sdk-docker/blob/master/Dockerfile

ARG CLOUD_SDK_VERSION=384.0.1
ENV CLOUD_SDK_VERSION=$CLOUD_SDK_VERSION
ENV ANDROID_SDK_ROOT=/usr/lib/android-sdk
ENV PATH "$PATH:/opt/google-cloud-sdk/bin/"

RUN apt-get -qqy update && apt-get install -qqy \
        curl \
        lsb-release \
        gnupg

RUN echo 'deb http://deb.debian.org/debian/ sid main' >> /etc/apt/sources.list && \
    export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)" && \
    echo "deb https://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" > /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    apt-get update -qqy --allow-releaseinfo-change-suite

RUN apt-get install -qqy google-cloud-sdk=${CLOUD_SDK_VERSION}-0 \
    google-cloud-sdk-app-engine-python=${CLOUD_SDK_VERSION}-0 \
    google-cloud-sdk-app-engine-python-extras=${CLOUD_SDK_VERSION}-0

RUN apt-get install -qqy openjdk-11-jdk

RUN apt-get install -qqy android-sdk