<#import "root://gradle-projects/NewArmsModule/kotlin_macros.ftl" as kt>
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
    ${getConfigurationName("compile")} 'me.jessyan:arms:2.5.2'
    ${getConfigurationName("compile")} 'me.jessyan:arms-imageloader-glide:2.5.2'

    //view
    ${getConfigurationName("compile")} rootProject.ext.dependencies["autosize"]
    annotationProcessor(rootProject.ext.dependencies["butterknife-compiler"]) {
        exclude module: 'support-annotations'
    }
    
    //tools
    annotationProcessor rootProject.ext.dependencies["dagger2-compiler"]
	kapt rootProject.ext.dependencies["dagger2-compiler"]

    //注意 Arms 核心库现在并不会依赖某个 EventBus, 要想使用 EventBus, 还请在项目中自行依赖对应的 EventBus
    //现在支持两种 EventBus, greenrobot 的 EventBus 和畅销书 《Android源码设计模式解析与实战》的作者 何红辉 所作的 AndroidEventBus
    //依赖后 Arms 会自动检测您依赖的 EventBus 并自动注册
    //建议使用 AndroidEventBus, 特别是组件化项目, 原因请看 https://github.com/hehonghui/AndroidEventBus/issues/49
    //这种做法可以让使用者有自行选择三方库的权利, 并且还可以减轻 Arms 的体积
    ${getConfigurationName("compile")} rootProject.ext.dependencies["androideventbus"]
//    ${getConfigurationName("compile")} rootProject.ext.dependencies["eventbus"]

    //test
    debugImplementation rootProject.ext.dependencies["canary-debug"]
    releaseImplementation rootProject.ext.dependencies["canary-release"]
    testImplementation rootProject.ext.dependencies["canary-release"]
    testImplementation rootProject.ext.dependencies["junit"]
    <@kt.addKotlinDependencies />
}
