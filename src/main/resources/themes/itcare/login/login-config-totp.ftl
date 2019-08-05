<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
    <#if section = "form">
    <#assign btnAdmClass="btn btn-danger">
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
            <div class="login-form">
                <ol id="kc-totp-settings">
                    <li>
                        <p >${msg("loginTotpStep1")}</p>
                        <ul id="kc-totp-supported-apps">
                            <#list totp.policy.supportedApplications as app>
                            <li>${app}</li>
                            </#list>
                        </ul>
                    </li>

                    <#if mode?? && mode = "manual">
                    <li>
                        <p>${msg("loginTotpManualStep2")}</p>
                        <p><span id="kc-totp-secret-key">${totp.totpSecretEncoded}</span></p>
                        <p><a href="${totp.qrUrl}" id="mode-barcode">${msg("loginTotpScanBarcode")}</a></p>
                    </li>
                    <li>
                        <p>${msg("loginTotpManualStep3")}</p>
                        <p>
                            <ul>
                                <li id="kc-totp-type">${msg("loginTotpType")}: ${msg("loginTotp." + totp.policy.type)}</li>
                                <li id="kc-totp-algorithm">${msg("loginTotpAlgorithm")}: ${totp.policy.getAlgorithmKey()}</li>
                                <li id="kc-totp-digits">${msg("loginTotpDigits")}: ${totp.policy.digits}</li>
                                <#if totp.policy.type = "totp">
                                    <li id="kc-totp-period">${msg("loginTotpInterval")}: ${totp.policy.period}</li>
                                <#elseif totp.policy.type = "hotp">
                                    <li id="kc-totp-counter">${msg("loginTotpCounter")}: ${totp.policy.initialCounter}</li>
                                </#if>
                            </ul>
                        </p>
                    </li>
                    <#else>
                    <li>
                        <p>${msg("loginTotpStep2")}</p>
                        <img id="kc-totp-secret-qr-code" src="data:image/png;base64, ${totp.totpSecretQrCode}" alt="Figure: Barcode"><br/>
                        <p><a href="${totp.manualUrl}" id="mode-manual">${msg("loginTotpUnableToScan")}</a></p>
                    </li>
                    </#if>
                    <li>
                        <p>${msg("loginTotpStep3")}</p>
                    </li>
                </ol>

                <form action="${url.loginAction}" class="${properties.kcFormClass!}" id="kc-totp-settings-form" method="post">
                    <div class="${properties.kcFormGroupClass!}">
                        <div class="${properties.kcInputWrapperClass!}">
                            <input type="text" id="totp" name="totp" autocomplete="off" class="${properties.kcInputClass!}" />
                            <button class="${btnAdmClass} btn-sm" type="submit" id="login-submit" name="login" value="Sign in">OK</button>
                        </div>
                        <input type="hidden" id="totpSecret" name="totpSecret" value="${totp.totpSecret}" />
                        
                    </div>
                </form>
            </div>
        </div>
    </div>
    </#if>
</@layout.registrationLayout>
