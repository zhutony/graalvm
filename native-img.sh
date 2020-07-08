CLZ=$1
 javac $CLZ.java
 native-image $CLZ
  ./$CLZ
