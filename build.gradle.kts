
plugins {
    id("com.android.application") version "8.7.3" apply false
    id("com.android.library") version "8.7.3" apply false
}

tasks.wrapper {
    distributionType = Wrapper.DistributionType.BIN
    gradleVersion = "8.11.1"
}

allprojects {
    subprojects {
        afterEvaluate {
            tasks.withType(JavaCompile::class.java).configureEach {
                options.compilerArgs.add("-Xlint:deprecation")
            }
        }
    }
}
