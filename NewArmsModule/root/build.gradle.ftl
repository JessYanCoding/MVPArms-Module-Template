<#import "root://activities/common/kotlin_macros.ftl" as kt>
apply plugin: 'com.android.application'
<@kt.addKotlinPlugins />

android {
    compileSdkVersion rootProject.ext.android["compileSdkVersion"]
    <#if compareVersionsIgnoringQualifiers(gradlePluginVersion, '3.0.0') lt 0>buildToolsVersion rootProject.ext.android["buildToolsVersion"]</#if>
    useLibrary 'org.apache.http.legacy'

    compileOptions {
        targetCompatibility JavaVersion.VERSION_1_8
        sourceCompatibility JavaVersion.VERSION_1_8
    }

    defaultConfig {
        applicationId "${packageName}"
        minSdkVersion rootProject.ext.android["minSdkVersion"]
        targetSdkVersion rootProject.ext.android["targetSdkVersion"]
        versionCode rootProject.ext.android["versionCode"]
        versionName rootProject.ext.android["versionName"]
        testInstrumentationRunner rootProject.ext.dependencies["androidJUnitRunner"]
    }

    buildTypes {
        debug {
            buildConfigField "boolean", "LOG_DEBUG", "true"
            buildConfigField "boolean", "USE_CANARY", "true"
            minifyEnabled false
            proguardFiles getDefaultProguardFile('proguard-android.txt'), 'proguard-rules.pro'
        }

        release {
            buildConfigField "boolean", "LOG_DEBUG", "false"
            buildConfigField "boolean", "USE_CANARY", "false"
            minifyEnabled true
            shrinkResources true
            zipAlignEnabled true
            proguardFiles getDefaultProguardFile('proguard-android.txt'), 'proguard-rules.pro'
        }
    }

    lintOptions {
        disable 'InvalidPackage'
        disable "ResourceType"
        abortOnError false
    }
}

dependencies {
    ${getConfigurationName("compile")} fileTree(dir: 'libs', include: ['*.jar'])
    ${getConfigurationName("compile")} 'me.jessyan:arms:2.4.1'
    //view
    annotationProcessor(rootProject.ext.dependencies["butterknife-compiler"]) {
        exclude module: 'support-annotations'
    }
    //tools
    annotationProcessor rootProject.ext.dependencies["dagger2-compiler"]
    //test
    debugImplementation rootProject.ext.dependencies["canary-debug"]
    releaseImplementation rootProject.ext.dependencies["canary-release"]
    testImplementation rootProject.ext.dependencies["canary-release"]
    testImplementation rootProject.ext.dependencies["junit"]
    <@kt.addKotlinDependencies />
}
