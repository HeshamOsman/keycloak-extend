<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=false displayWide=false>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <title>cegedim.cloud login</title>
 <meta charset="UTF-8">
 <meta http-equiv="X-UA-Compatible" content="IE=11">
 <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <meta name="description" content="cegedim.cloud login page">
 <link rel="apple-touch-icon" sizes="180x180" href="${url.resourcesPath}/apple-touch-icon.png">
 <link rel="icon" type="image/png" sizes="32x32" href="${url.resourcesPath}/favicon-32x32.png">
 <link rel="icon" type="image/png" sizes="16x16" href="${url.resourcesPath}/favicon-16x16.png">
 <link rel="manifest" href="${url.resourcesPath}/site.webmanifest">
 <link rel="mask-icon" href="${url.resourcesPath}/safari-pinned-tab.svg" color="#5bbad5">
 <meta name="msapplication-TileColor" content="#da532c">
 <meta name="theme-color" content="#ffffff"> 
 <#if properties.meta?has_content>
    <#list properties.meta?split(' ') as meta>
        <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
    </#list>
</#if>
<#if properties.styles?has_content>
    <#list properties.styles?split(' ') as style>
        <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
    </#list>
</#if>
</head>
<body>
<#nested "form">
</body>
</html>
</#macro>