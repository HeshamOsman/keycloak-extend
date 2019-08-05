<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo displayWide=(realm.password && social.providers??); section>
<#if section = "form">
<#assign btnClass="btn btn-success">
<#assign btnAdmClass="btn btn-danger">
<#if realm.name == 'adm'>
  <#assign btnClass=btnAdmClass>  
</#if>
<div class="row login-bg">
    <div class="col-xs-12 col-md-8 login-intro">
        <h1>${msg("LOGIN_TEXT_TITLE")}</h1>
        <p style="font-size: 1.3em; line-height: 1.7em">${msg("LOGIN_TEXT_BODY")}</p>
        <p></p>
        <div style="padding-top: 100px" class="text-center">
            <a class="btn btn-success btn-lg" href="https://itcare.cloud.cegedim.com/public/tour">${msg("TOUR_DISCOVER")}</a>
        </div>
    </div>
    <div class="col-xs-12 col-md-4" id="login">
        <div class="login-form text-center">
            <p class="text-center">
                <img class="responsive" width="160" src="${url.resourcesPath}/img/cegedimcloud-logo.svg"></img>
            </p>
            <#if message?has_content>
                <div class="text-left alert alert-${message.type}">
                    <#if message.type = 'success'><span class="${properties.kcFeedbackSuccessIcon!}"></span></#if>
                    <#if message.type = 'warning'><span class="${properties.kcFeedbackWarningIcon!}"></span></#if>
                    <#if message.type = 'error'><span class="${properties.kcFeedbackErrorIcon!}"></span></#if>
                    <#if message.type = 'info'><span class="${properties.kcFeedbackInfoIcon!}"></span></#if>
                    <span class="kc-feedback-text">${message.summary?no_esc}</span>
                </div>
            </#if>           
            <form id="logInForm" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                <div class="form-group text-left">
                    <label for="username">${msg("email")}</label>
                    <input class="form-control" id="username" name="username" value="${(login.username!'')}" type="text" required autofocus autocomplete="off" />
                </div>
                <div class="form-group text-left">
                    <label for="password">${msg("password")}</label>
                    <input class="form-control" id="password" name="password" type="password" required">
                </div>
                <div class="row" style="margin-top:10px;">
                    <div class="col-md-6 align-text-top text-left">
                        <#if realm.rememberMe && !usernameEditDisabled??>
                            <#if login.rememberMe??>
                                <input id="rememberMe" name="rememberMe" type="checkbox" checked>
                                <small>${msg("LOGIN_REMEMBER_ME")}</small>
                            <#else>
                                <input id="rememberMe" name="rememberMe" type="checkbox">
                                <small>${msg("LOGIN_REMEMBER_ME")}</small>
                            </#if>
                        </#if>
                    </div>
                    <div class="col-md-6 align-text-top text-right">
                        <a href="https://password.cegedim.com"><small>${msg("LOGIN_CHANGE_PASSWORD")}</small></a>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group text-center col-md-12">
                    <br /><button class="${btnClass} btn-lg btn-block" type="submit" id="login-submit" name="login" value="Sign in">${msg("LOGIN_SIGNIN")}</button>
                    </div>
                </div>
            </form>
            <#if realm.password && social.providers??>
                <hr>
                ${msg("SIGN_IN_WITH")}
                <br><br>
                <#list social.providers as p>
                    <a class="${btnAdmClass} btn-info btn-block btn-sm glyphicons glyphicons-lock" href="${p.loginUrl}" role="button">
                     ${p.displayName} <span class="glyphicon glyphicon-log-in"></span></a>
                    
                </#list>
            </#if>    
        </div>
    </div>
</div>
</#if>
</@layout.registrationLayout>