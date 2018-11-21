<?xml version="1.0"?>
<!-- TODO: check include Cpp support; add driver module template -->
<recipe>
    <mkdir at="${escapeXmlAttribute(projectOut)}/libs" />
    <mkdir at="${escapeXmlAttribute(resOut)}/anim" />
    <mkdir at="${escapeXmlAttribute(resOut)}/drawable" />
    <mkdir at="${escapeXmlAttribute(resOut)}/drawable-xhdpi" />
    <mkdir at="${escapeXmlAttribute(resOut)}/drawable-xxhdpi" />
    <mkdir at="${escapeXmlAttribute(resOut)}/drawable-xxxhdpi" />
    <mkdir at="${escapeXmlAttribute(resOut)}/mipmap-hdpi" />
    <mkdir at="${escapeXmlAttribute(resOut)}/mipmap-xhdpi" />
    <mkdir at="${escapeXmlAttribute(resOut)}/mipmap-xxhdpi" />
    <mkdir at="${escapeXmlAttribute(resOut)}/mipmap-xxxhdpi" />
    <mkdir at="${escapeXmlAttribute(resOut)}/layout" />
    <mkdir at="${projectOut}/src/main/java/${slashedPackageName(packageName)}/mvp/model/api/service" />
    <mkdir at="${projectOut}/src/main/java/${slashedPackageName(packageName)}/mvp/model/api/cache" />
    <mkdir at="${projectOut}/src/main/java/${slashedPackageName(packageName)}/mvp/model/entity" />
    <mkdir at="${projectOut}/src/main/java/${slashedPackageName(packageName)}/app/service" />
    <mkdir at="${projectOut}/src/main/java/${slashedPackageName(packageName)}/app/utils" />

    <merge from="root/settings.gradle.ftl"
             to="${escapeXmlAttribute(topOut)}/settings.gradle" />
    <merge from="root/root-build.gradle.ftl"
             to="${escapeXmlAttribute(topOut)}/build.gradle" />         
    <copy from="root/config.gradle"
                   to="${escapeXmlAttribute(topOut)}/config.gradle" />

    <instantiate from="root/build.gradle.ftl"
                   to="${escapeXmlAttribute(projectOut)}/build.gradle" />
    <instantiate from="root/AndroidManifest.xml.ftl"
                   to="${escapeXmlAttribute(manifestOut)}/AndroidManifest.xml" />
    <instantiate from="root/res/layout/include_title.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/include_title.xml" />               
    <instantiate from="root/res/values/strings.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/values/strings.xml" />
    <instantiate from="root/res/values/dimens.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/values/dimens.xml" />
    <instantiate from="root/res/values/styles.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/values/styles.xml" />
    <copy from="root/res/values/colors.xml"
                   to="${escapeXmlAttribute(resOut)}/values/colors.xml" />
    <instantiate from="root/test/app_package/ExampleInstrumentedTest.java.ftl"
                   to="${escapeXmlAttribute(testOut)}/ExampleInstrumentedTest.java" />

    <instantiate from="root/src/app_package/GlobalConfiguration.java.ftl"
                   to="${projectOut}/src/main/java/${slashedPackageName(packageName)}/app/GlobalConfiguration.java" />
    <open file="${projectOut}/src/main/java/${slashedPackageName(packageName)}/app/GlobalConfiguration.java" />
    <instantiate from="root/src/app_package/AppLifecyclesImpl.java.ftl"
                   to="${projectOut}/src/main/java/${slashedPackageName(packageName)}/app/AppLifecyclesImpl.java" />
    <open file="${projectOut}/src/main/java/${slashedPackageName(packageName)}/app/AppLifecyclesImpl.java" />
    <instantiate from="root/src/app_package/ActivityLifecycleCallbacksImpl.java.ftl"
                   to="${projectOut}/src/main/java/${slashedPackageName(packageName)}/app/ActivityLifecycleCallbacksImpl.java" />
    <instantiate from="root/src/app_package/FragmentLifecycleCallbacksImpl.java.ftl"
                   to="${projectOut}/src/main/java/${slashedPackageName(packageName)}/app/FragmentLifecycleCallbacksImpl.java" />
    <instantiate from="root/src/app_package/GlobalHttpHandlerImpl.java.ftl"
                   to="${projectOut}/src/main/java/${slashedPackageName(packageName)}/app/GlobalHttpHandlerImpl.java" />
    <instantiate from="root/src/app_package/ResponseErrorListenerImpl.java.ftl"
                   to="${projectOut}/src/main/java/${slashedPackageName(packageName)}/app/ResponseErrorListenerImpl.java" />
    <instantiate from="root/src/app_package/EventBusTags.java.ftl"
                   to="${projectOut}/src/main/java/${slashedPackageName(packageName)}/app/EventBusTags.java" />
    <instantiate from="root/src/app_package/RxUtils.java.ftl"
                   to="${projectOut}/src/main/java/${slashedPackageName(packageName)}/app/utils/RxUtils.java" />
    <instantiate from="root/src/app_package/Api.java.ftl"
                   to="${projectOut}/src/main/java/${slashedPackageName(packageName)}/mvp/model/api/Api.java" />
    


<#if unitTestsSupported>
    <instantiate from="root/test/app_package/ExampleUnitTest.java.ftl"
                   to="${escapeXmlAttribute(unitTestOut)}/ExampleUnitTest.java" />
</#if>


<#if !createActivity>
    <mkdir at="${escapeXmlAttribute(srcOut)}" />
</#if>

<#if makeIgnore>
    <copy from="root://gradle-projects/common/gitignore"
            to="${escapeXmlAttribute(projectOut)}/.gitignore" />
</#if>

<#include "root://gradle-projects/common/proguard_recipe.xml.ftl"/>


<copy from="root/res/mipmap-hdpi/ic_launcher.png"
        to="${escapeXmlAttribute(resOut)}/mipmap-hdpi/ic_launcher.png" />
<copy from="root/res/mipmap-xhdpi/ic_launcher.png"
        to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi/ic_launcher.png" />
<copy from="root/res/mipmap-xxhdpi/ic_launcher.png"
        to="${escapeXmlAttribute(resOut)}/mipmap-xxhdpi/ic_launcher.png" />
<copy from="root/res/mipmap-xxxhdpi/ic_launcher.png"
        to="${escapeXmlAttribute(resOut)}/mipmap-xxxhdpi/ic_launcher.png" />

<copy from="root/res/drawable-xhdpi/ic_arrow_back_white_24dp.png"
        to="${escapeXmlAttribute(resOut)}/drawable-xhdpi/ic_arrow_back_white_24dp.png" />
<copy from="root/res/drawable-xxhdpi/ic_arrow_back_white_24dp.png"
        to="${escapeXmlAttribute(resOut)}/drawable-xxhdpi/ic_arrow_back_white_24dp.png" />
<copy from="root/res/drawable-xxxhdpi/ic_arrow_back_white_24dp.png"
        to="${escapeXmlAttribute(resOut)}/drawable-xxxhdpi/ic_arrow_back_white_24dp.png" />               

<copy from="root/res/anim/translate_center_to_left.xml"
        to="${escapeXmlAttribute(resOut)}/anim/translate_center_to_left.xml" />
<copy from="root/res/anim/translate_center_to_right.xml"
        to="${escapeXmlAttribute(resOut)}/anim/translate_center_to_right.xml" />
<copy from="root/res/anim/translate_left_to_center.xml"
        to="${escapeXmlAttribute(resOut)}/anim/translate_left_to_center.xml" />
<copy from="root/res/anim/translate_right_to_center.xml"
        to="${escapeXmlAttribute(resOut)}/anim/translate_right_to_center.xml" />

</recipe>
