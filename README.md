# WAR Buildpack

This is a [buildpack](http://doc.scalingo.com/buildpacks) for WAR file.

## How it Works

This buildpack will detect your application as WAR if it has a `*.war` file in
its root directory. It will download the [Webapp
Runner](https://github.com/jsimone/webapp-runner/) from the [Maven
website](http://central.maven.org/maven2/com/github/jsimone/webapp-runner/) and
execute a web process with the command `java -jar
/usr/local/bin/webapp-runner.jar my-app.war`.

## License

Licensed under the MIT License. See LICENSE file.
