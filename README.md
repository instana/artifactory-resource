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
* `file_type`: *Required* The extension to download, needed when there are different types of artifacts with the same GAV.
* `skip_ssl_verification`: *Optional* Does not perform SSL verification.
Don't try this at home.

## Resource behavior

### `check`

Retrieves and returns all or newer versions available of the artifact.

### `in`

Retrieves a specific version of the artifact based.
It also populates a `version` file, containing the artifact version.

### `out`

Not implemented.
This resource is read-only.

## Development

### Build Docker image

Run the following command in the root folder:

```sh
docker build -t instana/artifactory-resource .
```
