plugins {
    id 'com.android.application'
    id 'org.jetbrains.kotlin.android' // If using Kotlin
}

android {
    compileSdkVersion 33
    defaultConfig {
        applicationId "com.example.myapp"
        minSdkVersion 21 // Consider updating to a more recent version
        targetSdkVersion 33
        versionCode 1
        versionName "1.0"
    }
    buildTypes {
        release {
            minifyEnabled false
            proguardFiles getDefaultProguardFile('proguard-android-optimize.txt'), 'proguard-rules.pro'
        }
    }
}

dependencies {
    implementation 'androidx.appcompat:appcompat:1.6.1' // Updated to AndroidX
    implementation 'androidx.constraintlayout:constraintlayout:2.1.4' // Updated to AndroidX
    implementation 'com.google.firebase:firebase-analytics' // Add this line
}
