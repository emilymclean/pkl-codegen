# pkl-codegen
A collection of docker images to generate code bindings for pkl models (in either Swift, Java, or Kotlin). Also supports PklDoc generation.

Current builds are created for pkl version {{ .Env.version_string }}.

## Usage
Given an input model of `example.pkl`, you can generate a code binding for a selected platform and pkl version using the following command:

```sh
docker run --rm -v "./:/data" ghcr.io/emilymclean/pkl-codegen-<platform>:<version> /data/example.pkl -o /data/java
```

So, for Kotlin using pkl version {{ .Env.latest_pkl_version }}:

```sh
docker run --rm -v "./:/data" ghcr.io/emilymclean/pkl-codegen-kotlin:{{ .Env.latest_pkl_version }} /data/example.pkl -o /data/java
```

The supported platforms/images are as follows:

| Output 	| Image                	|
|--------	|----------------------	|
| Kotlin 	| `pkl-codegen-kotlin` 	|
| Java   	| `pkl-codegen-java`   	|
| Swift  	| `pkl-codegen-swift`  	|
| Go      	| `pkl-codegen-go`  	|
| PklDoc 	| `pkl-codegen-doc`    	|

### Versioning
Versions of the container generally adhere to the following versioning format: `<pkl version>-<container release version>`. For example, for pkl `{{ .Env.latest_pkl_version }}` and release `1.0.0`, this would be `{{ .Env.latest_pkl_version }}-1.0.0`. In addition, a tag for the container major version, nightly version, and major+nightly version is also published. In the same circumstance as above, this would be `{{ .Env.latest_pkl_version }}-1`, `{{ .Env.latest_pkl_version }}-nightly`, and `{{ .Env.latest_pkl_version }}-1-nightly` respectively. It is **highly** recommended to at least pin to a major version to prevent breaking changes from accidentally interfering with use. 