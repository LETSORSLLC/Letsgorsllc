#!/bin/sh
if [ -z "$JAVA_HOME" ]; then
  case "$(uname)" in
    Darwin*) JAVA_HOME=$(/usr/libexec/java_home) ;;
    *) JAVA_HOME=$(dirname $(dirname $(readlink -f $(which javac)))) ;;
  esac
fi
exec "$JAVA_HOME/bin/java" -Dorg.gradle.appname=gradlew -classpath gradle/wrapper/gradle-wrapper.jar org.gradle.wrapper.GradleWrapperMain "$@"
