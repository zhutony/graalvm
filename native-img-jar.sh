set -x
# Fallback to JDK: native-image -jar ../PDF/pdf-box/target/pdf-box-1.0-SNAPSHOT-jar-with-dependencies.jar
# no jdk needed
native-image --initialize-at-build-time=org.apache.commons.logging.LogFactory,org.apache.commons.logging.impl.LogFactoryImpl --no-fallback -jar ../PDF/pdf-box/target/pdf-box-1.0-SNAPSHOT-jar-with-dependencies.jar
