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
| PklDoc 	| `pkl-codegen-doc`    	|
