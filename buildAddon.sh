name: "Publish"

on:
  release:
    types: [published]
    
  workflow_dispatch:

jobs:
  publish:
    name: Publish build
    runs-on: ubuntu-latest
    steps:
      - name: Checkout the repository
        uses: actions/checkout@v3
      - name: Login to DockerHub
        uses: docker/login-action@v2
        with:
          username: ${{ secrets.DOCKERHUB_USERNAME }}
          password: ${{ secrets.DOCKERHUB_TOKEN }}
      - name: Publish build - Home Assistant builder
        uses: home-assistant/builder@2022.11.0
        with:
          args: |
            --aarch64 \
            --target /data/atdevices
