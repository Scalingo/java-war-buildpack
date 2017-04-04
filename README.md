# WAR Buildpack

This is a [buildpack](http://doc.scalingo.com/buildpacks) for WAR file.

## How it Works

This buildpack will detect your application as WAR if it has a `*.war` file in
its root directory. It will download the [Webapp
Runner](https://github.com/jsimone/webapp-runner/) from the [Maven central
repository](http://central.maven.org/maven2/com/github/jsimone/webapp-runner/)
and execute a web process with the command `java -jar
/usr/local/bin/webapp-runner.jar my-app.war`.

## Configuration

### Choose a JDK

If you want to specifiy a version of the JDK, just set the environment variable
`JAVA_VERSION` in your application. You can do that either on the dashboard or
using our CLI with:

```
scalingo --app app-name env-set JAVA_VERSION=1.7
```

### Choose a Tomcat version

You can specify a version of Tomcat by modifying the Webapp Runner version.
It can be done with the environment variable `WEBAPP_RUNNER_VERSION`. You
can set it either on the dashboard or using our CLI with:

```
scalingo --app app-name env-set WEBAPP_RUNNER_VERSION=8.0.39.0
```

## License

Licensed under the MIT License. See LICENSE file.
