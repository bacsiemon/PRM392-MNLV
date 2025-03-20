plugins {
    alias(libs.plugins.android.application)
}

android {
    namespace = "com.example.prm392mnlv"
    compileSdk = 35

    defaultConfig {
        applicationId = "com.example.prm392mnlv"
        minSdk = 25
        targetSdk = 35
        versionCode = 1
        versionName = "1.0"

        testInstrumentationRunner = "androidx.test.runner.AndroidJUnitRunner"
    }

    buildTypes {
        release {
            isMinifyEnabled = false
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"), "proguard-rules.pro"
            )
        }
    }
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }
}

dependencies {

    implementation(libs.appcompat)
    implementation(libs.material)
    implementation(libs.activity)
    implementation(libs.constraintlayout)
    implementation(libs.retrofit.v2110)
    implementation(libs.converter.moshi)
    implementation(libs.moshi.adapters)
    implementation(libs.mapstruct)
    implementation(libs.datastore.preferences)
    implementation(libs.datastore.preferences.rxjava3)
    implementation(libs.rxandroid)
    implementation(libs.datastore.preferences.core.jvm)
    implementation(libs.core)
    annotationProcessor(libs.mapstruct.processor)
    implementation(libs.recyclerview)
    testImplementation(libs.junit)
    androidTestImplementation(libs.ext.junit)
    androidTestImplementation(libs.espresso.core)
}
