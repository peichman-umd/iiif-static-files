# IIIF Static Files

Provides a Docker image configuration for serving static iiif.lib.umd.edu
application files, including the Mirador viewer.

This Docker image extends umd-web-static-files by:

* Adding an "index.html" home page

* Adding static Mirador viewer files from
[https://github.com/umd-lib/mirador-static][mirador-static]

* Replacing the Nginx configuration with a configuration that proxies some
URLs to legacy IIIF servers.

See [umd-web-static-files][umd-web-static-files] for more information about
using this image.

**Note**: When updating the base "umd-web-static-files" Docker image version,
be sure to update the "docker_config/nginx/conf.d/default.conf" file to reflect
any changes.

## Docker Image

To build the Docker image:

```
> docker build -t docker.lib.umd.edu/iiif-static-files:<VERSION> -f Dockerfile .
```

where \<VERSION> is the version for the image.

For example, to build version 1.0.0:

```
> docker build -t docker.lib.umd.edu/iiif-static-files:1.0.0 -f Dockerfile .
```

The image should then be pushed to the UMD Nexus.

## Mirador Viewer

Multiple versions of the Mirador viewer are included in this repository, in the
"html/viewer" subdirectory.

These versions were generated from
[https://github.com/umd-lib/mirador-static][mirador-static] as follows:

1) In "html/viewer" directory, clone the "mirador-static" repository, and
switch into the directory:

```
> cd html/viewer
> git clone git@github.com:umd-lib/mirador-static.git
> cd mirador-static
```

2) Checkout the Git tag of the version to use (where \<VERSION> is the Git tag):

```
> git checkout <VERSION>
```

For example, for version 1.3.0:

```
> git checkout 1.3.0
```

3) Delete the ".git" subdirectory, as it is not needed, and keeping it would
unnecessarily increase the size the Docker image:

```
> rm -rf .git
```

4) Switch back to the parent directory:

```
> cd ..
```

5) Rename the "mirador-static" subdirectory to the version number (where
\<VERSION> is the name of the version:

```
> mv mirador-static <VERSION>
```

For example, for version 1.3.0:

```
> mv mirador-static 1.3.0
```

6) Commit the changes.

---
[mirador-static]: https://github.com/umd-lib/mirador-static
[umd-web-static-files]: https://github.com/umd-lib/umd-web-static-files
