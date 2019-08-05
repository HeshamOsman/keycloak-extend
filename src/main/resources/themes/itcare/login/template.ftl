<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=false displayWide=false>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="robots" content="noindex, nofollow">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-store, no-cache, must-revalidate">
    <meta http-equiv="Expires" content="Sat, 01 Dec 2001 00:00:00 GMT">
    <title>ITCare - Login</title>
    <link rel="icon" href="${url.resourcesPath}/img/favicon.ico" />
    <link href='https://fonts.googleapis.com/css?family=Kanit' rel='stylesheet'>
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
    <#if properties.scripts?has_content>
        <#list properties.scripts?split(' ') as script>
            <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
        </#list>
    </#if>
    <#if scripts??>
        <#list scripts as script>
            <script src="${script}" type="text/javascript"></script>
        </#list>
    </#if>
</head>

<body style="{'padding-top': bodyPaddingTop}" >
<div id="container" class="container-fluid">
    <nav class="navbar navbar-default navbar-fixed-top navbar-inverse" role="navigation">
        <div class="container-fluid">
            <div class="collapse navbar-collapse">
                <a class="navbar-brand" style="font-family: 'Kanit', cursive; font-size:2.5em; margin-left: -95px">IT<span class="text-success">CARE</span></a>

                <ul class="nav navbar-nav">
                    <li><a href="https://itcare.cloud.cegedim.com/public/tour">${msg("TOUR_DISCOVER")}</a></li>
                    <li><a href="https://itcare.cloud.cegedim.com/support/contact-us">${msg("TOUR_SUPPORT")}</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="active"><a href="#">${msg("LOGIN_SIGNIN")}</a></li>
                    <#if realm.internationalizationEnabled  && locale.supported?size gt 1>
                    <li class="dropdown">
                        <a href="#" id="button_language" class="dropdown-toggle" data-toggle="dropdown"
                            title="${msg("MENU_LANGUAGE")}" role="button" aria-expanded="false">${msg("MENU_LANGUAGE")}
                        <b class="caret"></b></a>
                        <ul class="dropdown-menu" role="menu">
                        <#list locale.supported as l>
                        <#if l.label == "Français">
                         <li><a href="${l.url}" title="${l.label}"><img src="${url.resourcesPath}/img/French.png"> ${l.label}</a></li>
                        <#else>
                         <li><a href="${l.url}" title="${l.label}"><img src="${url.resourcesPath}/img/${l.label}.png"> ${l.label}</a></li>
                        </#if>
                        </#list>
                        </ul>
                    </li>
                    </#if>
                </ul>
            </div> <!-- /.navbar-collapse -->
        </div> <!-- /.container-fluid -->
    </nav>
    <#nested "form">
</div>
<div id="footer" class="container-fluid" resolving="">
  <div class="row">
    <div class="col-md-12">
      <div class="col-md-4">
        <p><img class="responsive" width="160" src="${url.resourcesPath}/img/cegedimcloud-logo.svg"></img></p>
        <p>
          <small>Copyright &copy; ${msg("FOOTER_COPYRIGHT")}</small>
        </p>
      </div>
      <div  class="col-md-4">
        <h5>${msg("FOOTER_SECTION_SUPPORT")}</h5>
        <p>
          <small><a href="mailto:it.cloudplatforms@cegedim.fr">${msg("FOOTER_SUPPORT_REQUEST")}</a></small>
        </p>
        <p>
          <small><a href="https://itcare.cloud.cegedim.com">${msg("FOOTER_TERMS_OF_USE")}</a></small>
        </p>
      </div>
      <div class="col-md-4">
        <h5>${msg("FOOTER_SECTION_COMPANY")}</h5>
        <p>
          <small><a href="https://cegedim.cloud">${msg("FOOTER_CEGEDIM_CLOUD")}</a></small>
        </p>
        <p>
          <small><a href="http://www.cegedim.com">${msg("FOOTER_CEGEDIM_GROUP")}</a></small>
        </p>
      </div>
    </div>
  </div>
</div>
</body>
</html>
</#macro>