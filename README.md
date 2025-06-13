# cant-link
To test clone this repo [WPILib](https://github.com/me-it-is/allwpilib)
then enter the devshell with flake.nix
cd to the project directory and run ./gradlew build
after the build finishes and the tests start you should get this error
```
AprilTagDetectorTest > initializationError FAILED
    org.opentest4j.AssertionFailedError
        at app//edu.wpi.first.apriltag.AprilTagDetectorTest.beforeAll(AprilTagDetectorTest.java:41)

        Caused by:
        java.io.IOException: opencv_java4100d could not be loaded from path.
                attempted to load for platform /linux/x86-64/
        Last Load Error: 
        no opencv_java4100d in java.library.path: /home/das-raff/Documents/code/robotics/allwpilib/apriltag/build/install/apriltagDev/linuxx86-64/lib
        JVM Location: /nix/store/f7nmnvn5nank0qqf19wldfj1awsfpyv4-temurin-bin-17.0.14/bin/.java-wrapped
            at edu.wpi.first.util.RuntimeLoader.loadLibrary(RuntimeLoader.java:47)
            at edu.wpi.first.apriltag.AprilTagDetectorTest.beforeAll(AprilTagDetectorTest.java:39)
```
