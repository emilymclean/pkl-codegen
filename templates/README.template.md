# pkl-codegen
A collection of docker images to generate code bindings for pkl models (in either Swift, Java, or Kotlin).

Current builds are created for pkl version {{ .Env.version_string }}.

## Usage
Given an input model of `example.pkl`, you can generate a code binding for a selected platform and pkl version using the following command:

```sh
docker run --rm -v "./:/data" ghcr.io/emilymclean/pkl-codegen-<platform>:<version> /data/example.pkl /data/java
```

So, for Kotlin using pkl version {{ .Env.latest_pkl_version }}:

```sh
docker run --rm -v "./:/data" ghcr.io/emilymclean/pkl-codegen-kotlin:{{ .Env.latest_pkl_version }} /data/example.pkl /data/java
```

Note: The last path listed in the command will be interpreted as the output directory. So `/data/example.pkl /data/thing.pkl /data/java` will be interpreted such that `/data/example.pkl` and `/data/thing.pkl` are input files, while `/data/java` is the output for the result. 