plugins {
    alias(libs.plugins.android.application)
}

android {
    namespace = "com.example.prm392mnlv"
    compileSdk = 35

    defaultConfig {
        applicationId = "com.example.prm392mnlv"
        minSdk = 26
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
    implementation(libs.navigation.fragment.ktx) // Or the latest version
    implementation(libs.navigation.ui.ktx)
    implementation (libs.navigation.compose)
    implementation(libs.core)
    implementation(libs.appcompat)
    implementation(libs.material)
    implementation(libs.activity)
    implementation(libs.constraintlayout)
    implementation(libs.recyclerview)
    implementation(libs.recyclerview.swipedecorator)
    implementation(libs.retrofit.v2110)
    implementation(libs.converter.moshi)
    implementation(libs.moshi.adapters)
    implementation(libs.datastore.preferences)
    implementation(libs.datastore.preferences.rxjava3)
    implementation(libs.datastore.preferences.core.jvm)
    implementation(libs.rxandroid)
    implementation(files("src/main/libs/zpdk-release-v3.1.aar"))
    implementation(libs.mapstruct)
    annotationProcessor(libs.mapstruct.processor)
    testImplementation(libs.junit)
    androidTestImplementation(libs.ext.junit)
    androidTestImplementation(libs.espresso.core)

    // Sử dụng Glide từ version catalog
    implementation(libs.glide)
    annotationProcessor(libs.glide.compiler)
    implementation(libs.jwtdecode)
}
