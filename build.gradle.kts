plugins {
    id("com.android.application") version "8.1.0"
    id("org.jetbrains.kotlin.android") version "1.7.20"
}

android {
    compileSdk = 33
    defaultConfig {
        applicationId = "com.example.myapp"
        minSdk = 21 // Consider updating to a more recent version
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

dependencies {
    implementation("androidx.appcompat:appcompat:1.6.1") // Current latest stable version
    implementation("androidx.constraintlayout:constraintlayout:2.1.4") // Current latest stable version
    implementation(platform("com.google.firebase:firebase-bom:32.2.3")) // Current latest stable version
    implementation("com.google.firebase:firebase-analytics-ktx:latest_version") // Replace with the actual latest version
}
