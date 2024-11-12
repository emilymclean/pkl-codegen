# pkl-codegen
A collection of docker images to generate code bindings for pkl models (in either Swift, Java, or Kotlin). Also supports PklDoc generation.

Current builds are created for pkl version 0.25.0, 0.25.1, 0.25.2, 0.25.3, 0.26.0, 0.26.1, 0.26.2, 0.26.3 and 0.27.0.

## Usage
Given an input model of `example.pkl`, you can generate a code binding for a selected platform and pkl version using the following command:

```sh
docker run --rm -v "./:/data" ghcr.io/emilymclean/pkl-codegen-<platform>:<version> /data/example.pkl -o /data/java
```

So, for Kotlin using pkl version 0.27.0:

```sh
docker run --rm -v "./:/data" ghcr.io/emilymclean/pkl-codegen-kotlin:0.27.0 /data/example.pkl -o /data/java
```

The supported platforms/images are as follows:

| Output 	| Image                	|
|--------	|----------------------	|
| Kotlin 	| `pkl-codegen-kotlin` 	|
| Java   	| `pkl-codegen-java`   	|
| Swift  	| `pkl-codegen-swift`  	|
| Go      	| `pkl-codegen-go`  	|
| PklDoc 	| `pkl-codegen-doc`    	|
