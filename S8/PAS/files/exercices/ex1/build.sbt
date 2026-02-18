val scala3Version = "3.8.1"

lazy val root = project
  .in(file("."))
  .settings(
    name := "ex1",
    version := "0.1.0-SNAPSHOT",

    scalaVersion := scala3Version,

    libraryDependencies += "org.scalameta" %% "munit" % "1.0.0" % Test
  )
