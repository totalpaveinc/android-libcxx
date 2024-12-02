
plugins {
    id("com.android.library")
    id("maven-publish")
}

android {
    namespace = "com.totalpave.libcxx"

    compileSdk = 34

    defaultConfig {
        aarMetadata {
            minCompileSdk = 24
        }

        minSdk = 24
    }

    buildTypes {
        release {
            isMinifyEnabled = false
        }
    }

    publishing {
        singleVariant("release") {
            withSourcesJar()
        }
    }
}

publishing {
    publications {
        create<MavenPublication>("release") {
            groupId = "totalpave"
            artifactId = "libcxx"
            version = file("../VERSION").readText().trim()

            afterEvaluate {
                from(components["release"])
            }
        }
    }

    repositories {
        maven {
            url = uri("https://archiva.totalpave.com/repository/public")
            credentials {
                username = findProperty("totalpave.repository.user").toString()
                password = findProperty("totalpave.repository.password").toString()
            }
        }
    }
}
