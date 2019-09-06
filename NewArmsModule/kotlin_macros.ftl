<#-- Macro used to add the necessary dependencies to support kotlin to
an app build.gradle -->

<#macro addKotlinPlugins>
<#if generateKotlin>
<#compress>
apply plugin: 'kotlin-android'
apply plugin: 'kotlin-android-extensions'
apply plugin: 'kotlin-kapt'
</#compress>
</#if>
</#macro>

<#macro addKotlinDagger2Dependencies>
<#if generateKotlin>
<#compress>
kapt rootProject.ext.dependencies["dagger2-compiler"]
</#compress>
</#if>
</#macro>

<#macro addKotlinDependencies>
<#if generateKotlin>${getConfigurationName("compile")} "org.jetbrains.kotlin:kotlin-stdlib-jdk7:$kotlin_version"</#if>
</#macro>

// TODO: <apply plugin /> Is adding the dependencies at the *end* of build.gradle
// TODO: The two macros above, addKotlinPlugins and addKotlinDependencies, are duplicating the work of addAllKotlinDependencies, when
//       creating a new project (isNewProject == true). The only reason is the above bug on <apply plugin />
<#macro addAllKotlinDependencies>
  <#if !isNewProject && ((language!'Java')?string == 'Kotlin')>
    <apply plugin="kotlin-android" />
    <apply plugin="kotlin-android-extensions" />
    <apply plugin="kotlin-kapt" />
    <merge from="root://gradle-projects/NewArmsModule/kotlin.gradle.ftl"
        to="${escapeXmlAttribute(projectOut)}/build.gradle" />
    <#if !hasDependency('org.jetbrains.kotlin:kotlin-stdlib')>
        <dependency mavenUrl="org.jetbrains.kotlin:kotlin-stdlib-jdk7:$kotlin_version"/>
		<merge from="root://activities/common/kotlin.gradle.ftl"
             to="${escapeXmlAttribute(projectLocation)}/build.gradle" />
    </#if>
  </#if>
</#macro>

<#macro addKotlinToBaseProject>
  <#if (language!'Java')?string == 'Kotlin'>
    <merge from="root://activities/common/kotlin.gradle.ftl"
             to="${escapeXmlAttribute(projectLocation)}/build.gradle" />
  </#if>
</#macro>