# buildpack: Java WAR

This is a [buildpack](http://doc.scalingo.com/buildpacks) for WAR file.

## Usage

### Detection

If the `WAR_PATH` environment variable is set, this buildpack checks if a .war
file exists where `WAR_PATH` points. If the file does actually exist, it is
used and served as the application. Otherwise, the buildpack fails.

If `WAR_PATH` is not set, the buildpack falls back to checking if a .war file
exists at the root of the project and uses it if it does exist.

If you want to use a .war file stored at the root of your application, we
advise to unset the `WAR_PATH` environment variable and let the platform do its
magic.

### Deployment Workflow

During the *`BUILD`* phase, this buildpack:

1. Downloads and installs the Java Runtime Environment.
2. Downloads and installs a [webapp-runner](https://github.com/heroku/webapp-runner).
3. Validates the build.

:tada: This process results into a scalable image, ready to be packaged into a
container.

### Environment

The following environment variables are available for you to tweak your
deployment:

#### `JAVA_VERSION`

Version of the Java Runtime Environment to deploy.\
Defaults to `1.8`

#### `JAVA_WEBAPP_RUNNER_VERSION`

Version of the webapp-runner (Tomcat) to install and use.\
Defaults to `9.0.107.0`

#### `WEBAPP_RUNNER_VERSION`

**Deprecated**, please use [`JAVA_WEBAPP_RUNNER_VERSION`](#java_webapp_runner_version).

#### `WAR_PATH`

Path to the .war file you want to run.\
When unset, the platform tries to run a .war file at the root of the
application.\
Defaults to being unset
