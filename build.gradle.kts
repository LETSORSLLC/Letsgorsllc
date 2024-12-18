plugins {
    id("com.android.application") version "8.1.0"
}

buildscript {
    repositories {
        google()
        mavenCentral()
    }
    dependencies {
        classpath("com.android.tools.build:gradle:8.1.0")
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

android {
    compileSdk = 30

    defaultConfig {
        applicationId = "com.example.myapp"
        minSdk = 24 // Updated to a more recent version
        targetSdk = 30
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
    testImplementation("junit:junit:4.12")
    androidTestImplementation("androidx.test:runner:1.4.0") // Updated to AndroidX
    androidTestImplementation("androidx.test.espresso:espresso-core:3.4.0") // Updated to AndroidX
}
