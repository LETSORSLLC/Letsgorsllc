
     plugins {
         id("com.android.application") version "8.1.1"
         id("org.jetbrains.kotlin.android") version "1.9.0"
         id("com.google.gms.google-services") version "4.3.15"
     }

     dependencyResolutionManagement {
         repositoriesMode.set(RepositoriesMode.FAIL_ON_PROJECT_REPOS)
         repositories {
             google()
             mavenCentral()
         }
added
add text before this line
android {
    namespace = "com.example.firebaseapp"
    compileSdk = 33

    defaultConfig {
        applicationId = "com.example.firebaseapp"
        minSdk = 21
        targetSdk = 33
        versionCode = 1
        versionName = "1.0"
    }

    buildTypes {
        release {
            isMinifyEnabled = false
            proguardFiles(getDefaultProguardFile("proguard-android-optimize.txt"), "proguard-rules.pro")
        }
    }
}
add text before this line

dependencies {
    implementation("com.google.firebase:firebase-analytics-ktx:23.0.0")
}
implementation(platform("com.google.firebase:firebase-bom:32.1.1"))
implementation("com.google.firebase:firebase-auth-ktx")
implementation("com.google.firebase:firebase-firestore-ktx")
add text before this line
