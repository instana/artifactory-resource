# Instana Artifactory Resource

Deploys and retrieves artifacts from Instana's Artifactory.
To define an Instana Artifactory resource for a Concourse pipeline:

``` yaml
resource_types:

- name: artifactory-resource
  type: docker-image
  source:
    repository: instana/artifactory-resource
    tag: latest

resources:

- name: pcf-tile
  type: artifactory-resource
  source:
    download_key: ((instana-download-key))
    group: com.instana
    artifact: pcf-tile
    file_name: pcf-tile-:version.pivotal
```

## Source Configuration

* `group`: *Required* Maven group to download.
* `artifact`: *Required* Maven artifact to download.
* `download_key`: *Required* A valid Instana download key.
* `file_name`: *Required* The pattern of the file to download; use the `:version` token to denote the version number.
  There is no dedicated support for `classifier` or `packaging_type` as in Maven, as those end up reflected in the file name anyhow.
* `check_etag`: *Optional* Add the `etag` of the artefact to the version number, which is very useful when you consume, for example, `-SNAPSHOT` versions; default: do not check `etag`.
  **IMPORTANT:** Checking the `etag` costs one additional HTTP call per version; be very mindful of using it with artefacts that have lots of versions!
* `skip_ssl_verification`: *Optional* Does not perform SSL verification; default: perform SSL verification.
Don't try this at home.

## Resource behavior

### `check`

Retrieves and returns all or newer versions available of the artifact.

### `in`

Retrieves a specific version of the artifact based.
It also populates a `version` file, containing the artifact version.

The `in` method accepts an optional `version_file` configuration that specifies the path of a file containing the version to download, rather than the latest version that is passed in input automatically by Concourse.
This can be very handy when working with versioning pinning for resources, especially in combination with the [`semver`](https://github.com/concourse/semver-resource) resource.

### `out`

Not implemented.
This resource is read-only.

## Development

### Build Docker image

Run the following command in the root folder:

```sh
docker build -t instana/artifactory-resource .
```

### Public to Docker Hub

```sh
docker push instana/artifactory-resource:latest
```
