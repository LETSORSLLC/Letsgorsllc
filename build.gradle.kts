plugins {
    id("com.android.application") version "7.3.1"
    id("org.jetbrains.kotlin.android") version "1.7.20"
    id("com.android.dynamic-feature") // Add dynamic-feature plugin
}

android {
    compileSdk = 33
    defaultConfig {
        applicationId = "com.example.myapp"
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

dependencies {
    implementation("androidx.appcompat:appcompat:1.4.2")
    implementation("androidx.constraintlayout:constraintlayout:2.1.4")
    implementation(platform("com.google.firebase:firebase-bom:32.2.3"))
    implementation("com.google.firebase:firebase-analytics-ktx:21.0.0")
}
