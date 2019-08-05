<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "form">
    <#assign btnAdmClass="btn btn-danger">
    <div class="row login-bg" style="height: 35pc">
        <div class="col-xs-12 col-md-8 login-intro">
            <h1>${msg("LOGIN_TEXT_TITLE")}</h1>
            <p style="font-size: 1.3em; line-height: 1.7em">${msg("LOGIN_TEXT_BODY")}</p>
            <p></p>
            <div style="padding-top: 100px" class="text-center">
                <a class="btn btn-success btn-lg" href="https://itcare.cloud.cegedim.com/public/tour">${msg("TOUR_DISCOVER")}</a>
            </div>
        </div>
        <div class="col-xs-12 col-md-4" id="login">
            <div class="login-form">
                <form id="kc-totp-login-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
                    <div class="${properties.kcFormGroupClass!}">
                        <div class="${properties.kcLabelWrapperClass!}">
                            <label for="totp" class="${properties.kcLabelClass!}">${msg("loginTotpOneTime")}</label>
                        </div>

                        <div class="${properties.kcInputWrapperClass!}">
                            <input id="totp" name="totp" autocomplete="off" type="text" class="${properties.kcInputClass!}" autofocus />
                        </div>
                    </div>

                    <div class="${properties.kcFormGroupClass!}">
                        <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                            <div class="${properties.kcFormOptionsWrapperClass!}">
                            </div>
                        </div>
                        <br>
                        <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                            <div class="${properties.kcFormButtonsWrapperClass!}">
                            <button class="${btnAdmClass} btn-sm" type="submit" name="login" id="kc-login">Submit</button>
                            <button class="${btnAdmClass} btn-info btn-sm" type="submit" name="cancel" id="kc-cancel">Cancel</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    </#if>
</@layout.registrationLayout>