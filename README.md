# Java WAR Buildpack

Run a Java Web Application Archive (`.war` file) on Scalingo using this
buildpack.


## Documentation

See our official documentation:
👉 https://doc.scalingo.com/platform/deployment/deploy-java-jar-war

This buildpack first deploys a Java Development Kit (JDK) into your container.

It then deploys a standalone CLI tool named **Webapp Runner**. Webapp
Runner is based on the Apache Tomcat HTTP web server. It allows to run a WAR
application on Scalingo.


## Default Supported Version

The default Java JDK deployed by this buildpack depends on your [stack]:

- For `scalingo-22`: OpenJDK 1.8
- For `scalingo-24`: OpenJDK 25
- For `scalingo-26`: OpenJDK 25

The default Webapp Runner deployed by this buildpack is defined in one of the
[inventory] files of the buildpack.


## Maintenance Status

This buildpack is maintained by Scalingo solely for the deployment assets and
integration guidance provided in this repository and its associated
documentation.

Applying Java and Webapp Runner upgrades, as well as security patches remains
the responsibility of the customer by updating the corresponding environment
variables and redeploying the application.


Should Scalingo discontinue maintenance of this buildpack or no longer
recommend its use, a notice period of at least six months will be provided
whenever feasible, except where immediate action is required due to security
concerns or external constraints.


[inventory]: INVENTORY-default.tsv?plain=1

[stack]: https://doc.scalingo.com/platform/internals/stacks/overview
