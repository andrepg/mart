# Reference 1 - https://github.com/mancarius/docker-flutter/blob/master/stable/Dockerfile
# Reference 2 - https://github.com/instrumentisto/flutter-docker-image/blob/main/Dockerfile
# Reference 3 - https://github.com/cirruslabs/docker-images-flutter
# Reference 4 - https://github.com/mancarius/docker-flutter/tree/master


# Use base image from Microsoft
FROM mcr.microsoft.com/devcontainers/base:ubuntu

# Define Android environment variables
ARG android_sdk=
ARG flutter_sdk=

RUN test -n "${android_sdk}" || (echo "android_sdk argument not set" && false)
RUN test -n "${flutter_sdk}" || (echo "flutter_sdk argument not set" && false)

ENV SDK_HOME "/opt/sdk"
ENV ANDROID_HOME "$SDK_HOME/android"
ENV FLUTTER_HOME "$SDK_HOME/flutter/bin"
ENV PATH "$PATH:$FLUTTER_HOME:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/cmdline-tools/latest/bin"

WORKDIR ${SDK_HOME}

# Install Flutter basic requirements
RUN apt-get -y update && apt-get install -y \
    build-essential \
    curl \
    clang \
    cmake \
    ca-certificates \
    gcc \
    lib32z1 \
    libbz2-1.0 \
    libc6 \
    libclang-dev \
    libglu1-mesa \
    libgtk-3-dev \
    libncurses5-dev \
    libstdc++6 \
    ninja-build \
    openjdk-21-jdk \
    unzip \
    xz-utils \
    zip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN chown -R vscode:vscode $SDK_HOME \
    && chmod g+rw $SDK_HOME

USER vscode

COPY ${android_sdk} ./cmdlinetools.zip
COPY ${flutter_sdk} ./fluttersdk.tar.xz

## Flutter & Android SDK install 
RUN mkdir -p $ANDROID_HOME/cmdline-tools \
    && unzip cmdlinetools.zip \
    && tar xvf fluttersdk.tar.xz \
    && rm cmdlinetools.zip \
    && rm fluttersdk.tar.xz 

# Move all content from cmdline-tools to latest (that's best we got for now)
# @see https://developer.android.com/tools/sdkmanager?hl=pt-br
RUN mv ./cmdline-tools $ANDROID_HOME/cmdline-tools/latest

# Last thing we'll do is setup Android and Flutter, since last one depends on first one
RUN echo "y" | sdkmanager --sdk_root=$ANDROID_HOME --install \   
    "platform-tools" \
    "platforms;android-33" \
    "build-tools;33.0.0" \
    "extras;google;google_play_services" \
    "extras;google;m2repository" \
    "extras;google;instantapps" \
    "extras;google;market_licensing" \
    "extras;google;market_apk_expansion" 

RUN flutter config --no-analytics 
RUN flutter precache 
RUN flutter update-packages 
RUN yes "y" | flutter doctor --android-licenses