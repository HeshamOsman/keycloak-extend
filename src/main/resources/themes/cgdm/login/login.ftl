<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo displayWide=(realm.password && social.providers??); section>
<#if section = "form">
    <div class="limiter">
        <div class="container-login">
            <div class="wrap-login" style="padding-bottom: 20px">
                <form class="login-form validate-form" id="logInForm" action="${url.loginAction}" method="post" novalidate>
                    <span class="login-form-avatar">
                        <img src="${url.resourcesPath}/images/logo-cegedim-cloud.png">
                    </span>
                    <#if message?has_content>
                        <p class="error-msg">
                            <small><span>${message.summary?no_esc}</span></small>
                        </p>
                    </#if>
                    <div class="wrap-input validate-input" style="margin-top: 85px; margin-bottom: 35px" data-validate = "${msg("DATA_VALIDATE_LOGIN")}">
                        <input class="input-login" type="text" name="username" autocomplete="username">
                        <span class="focus-input-login" data-placeholder="${msg("email")}"></span>
                    </div>
                    <div class="wrap-input validate-input" style="margin-bottom: 50px" data-validate="${msg("DATA_VALIDATE_PWD")}">
                        <input class="input-login" type="password" name="password" autocomplete="current-password">
                        <span class="focus-input-login" data-placeholder="${msg("password")}"></span>
                    </div>
                    <div style="margin-bottom: 50px">
                        <#if realm.rememberMe && !usernameEditDisabled??>
                          <label class="container"> ${msg("LOGIN_REMEMBER_ME")}
                              <input id="rememberMe" name="rememberMe" type="checkbox" checked>
                              <span class="checkmark"></span>
                          </label>
                        </#if>                        
                    </div>
                    <div class="container-login-form-btn">
                        <button class="login-form-btn">
                            ${msg("LOGIN_SIGNIN")}
                        </button>
                    </div>
                    <hr style="margin-top: 20px;margin-bottom: 20px"/>
                    <table>
                        <tr>
                            <td width="80">
                                <img src="${url.resourcesPath}/images/cegedim_cloud_users.png">
                            </td>
                            <td style="padding-left: 15px; color: #666666; vertical-align: top">
                                <strong style="line-height: 1.6em">${msg("LOGIN_SIGNIN_CEGEDIM_CUSTOMERS_BEFORE")}cegedim<span style="color: #E50345">.</span><span style="color: #0492D1">cloud</span>${msg("LOGIN_SIGNIN_CEGEDIM_CUSTOMERS_AFTER")}</strong><br />
                                <a href="#howto-login-cloud" rel="modal:open" class="txt2">
                                    ${msg("LOGIN_SIGNIN_HELP")}
                                </a><br />
                                <a href="https://password.cegedim-hds.fr" class="txt2">
                                    ${msg("LOGIN_CHANGE_PASSWORD")}
                                </a>
                            </td>
                        </tr>
                    </table>
                    <hr style="margin-top: 20px;margin-bottom: 20px"/>
                    <table>
                        <tr>
                            <td width="80">
                                <img src="${url.resourcesPath}/images/cegedim_group_users.png">
                            </td>
                            <td style="padding-left: 15px; color: #666666; vertical-align: top">
                                <strong style="line-height: 1.6em">${msg("LOGIN_SIGNIN_CEGEDIM_GRP_MEMBERS")}</strong><br />
                                <a href="#howto-login-cegedimgroup" rel="modal:open" class="txt2">
                                    ${msg("LOGIN_SIGNIN_HELP")}
                                </a><br />
                                <a href="https://password.cegedim.com" class="txt2">
                                    ${msg("LOGIN_CHANGE_PASSWORD")}
                                </a>
                            </td>
                        </tr>
                    </table>
                    <#if realm.internationalizationEnabled  && locale.supported?size gt 1>
                    <p style="padding-top: 30px; text-align: center">
                    <#list locale.supported as l>
                        <small><a href="${l.url}" title="${l.label}" class="">${l.label}</a></small>
                    </#list>
                    </p>
                    </#if>
                    <hr style="margin-top: 20px; margin-bottom: 20px"/>
                    <p style="text-align: center">
                        <small>© 2019, cegedim<span style="color: #E50345">.</span><span style="color: #0492D1">cloud</span></small>
                    </p>
                </form>
            </div>
        </div>
    </div>
    <#if properties.scripts?has_content>
    <#list properties.scripts?split(' ') as script>
        <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
    </#list>
    </#if>
    <#if scripts??>
        <#list scripts as script>
            <script src="${script}" type="text/javascript"></script>
        </#list>
        <#if message?has_content>
            <script>
                $(".focus-input-login").addClass("has-error");	
            </script>
        </#if>
    </#if>
</#if>

<div id="howto-login-cegedimgroup" class="modal">
  <p>${msg("LOGIN_SIGNIN_HELP_GROUP_CONTENT_1")}</p>
  <p>${msg("LOGIN_SIGNIN_HELP_GROUP_CONTENT_2")}</p>
</div>
<div id="howto-login-cloud" class="modal">
  <p>${msg("LOGIN_SIGNIN_HELP_CLOUD_CONTENT_1")}</p>
  <p>${msg("LOGIN_SIGNIN_HELP_CLOUD_CONTENT_2")}</p>
</div>

</@layout.registrationLayout>