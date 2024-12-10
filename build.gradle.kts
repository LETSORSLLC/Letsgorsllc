plugins {
    id("com.android.application") version "8.1.0"
    id("org.jetbrains.kotlin.android") version "1.7.20"
}

android {
    compileSdk = 33
    defaultConfig {
        applicationId = "com.example.myapp"
        minSdk = 21 // Consider updating to a more recent version
        targetSdkVersion = 33
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
    implementation("androidx.appcompat:appcompat:1.6.1") // Updated to AndroidX
    implementation("androidx.constraintlayout:constraintlayout:2.1.4") // Updated to AndroidX
    implementation(platform("com.google.firebase:firebase-bom:32.2.3"))
    implementation("com.google.firebase:firebase-analytics-ktx")
}
