import java.util.Properties
import java.io.FileInputStream

plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

// local.properties dosyasından Google Maps API Key'i oku
val props = Properties()
FileInputStream(rootProject.file("local.properties")).use {
    props.load(it)
}
val googleMapsApiKey = props.getProperty("googleMapsApiKey", "")

android {
    namespace = "com.ipekozsasilar.smart_exploration_notes"
    compileSdk = flutter.compileSdkVersion
    // Firebase ve ML Kit plugin'leri için önerilen NDK sürümü
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.ipekozsasilar.smart_exploration_notes"
        // Firebase Auth 23.x ve diğer plugin'ler en az 23 istiyor
        minSdk = 23
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
        
        // Google Maps API Key'i manifest'e enjekte et
        manifestPlaceholders["GOOGLE_MAPS_API_KEY"] = googleMapsApiKey
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}
