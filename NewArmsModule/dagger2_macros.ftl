<#macro addKaptPlugins>
<#if generateKotlin>
<#compress>
apply plugin: 'kotlin-kapt'
</#compress>
</#if>
</#macro>

<#macro addKaptDependencies>
<#if generateKotlin>
<#compress>
kapt rootProject.ext.dependencies["dagger2-compiler"]
</#compress>
</#if>
</#macro>