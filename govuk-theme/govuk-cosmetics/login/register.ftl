<#import "template.ftl" as layout>
<@layout.registrationLayout backToApplication=true; section>
    <#if section = "title">
        ${msg("registerWithTitle",(realm.displayName!''))}
    <#elseif section = "header">
        ${msg("registerWithTitle",(realm.displayName!''))}
    <#elseif section = "form">
        <!-- Global Site Tag (gtag.js) - Google Analytics -->
        <script async src="https://www.googletagmanager.com/gtag/js?id=UA-126364208-2"></script>
        <script>
          window.dataLayer = window.dataLayer || [];
          function gtag(){dataLayer.push(arguments);}
          gtag('js', new Date());

          gtag('config', 'UA-126364208-2');
        </script>
        <form id="kc-register-form" class="${properties.kcFormClass!}" action="${url.registrationAction}" method="post">
          <input type="text" readonly value="this is not a login form" style="display: none;">
          <input type="password" readonly value="this is not a login form" style="display: none;">

            <#if !realm.registrationEmailAsUsername>
                <div class="govuk-form-group ${messagesPerField.printIfExists('username',properties.kcFormGroupErrorClass!)}">
                    <div class="${properties.kcLabelWrapperClass!}">
                        <label for="username" class="govuk-label">${msg("createUsername")}</label>
                    </div>
                    <div class="${properties.kcInputWrapperClass!}">
                        <input type="text" id="username" class="govuk-input" name="username" value="${(register.formData.username!'')}" />
                    </div>
                </div>
            </#if>

            <div class="govuk-form-group ${messagesPerField.printIfExists('firstName',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="firstName" class="govuk-label">${msg("firstName")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="firstName" class="govuk-input" name="firstName" value="${(register.formData.firstName!'')}" autocomplete="name" />
                    <input type="hidden" id="lastName" name="lastName" readonly value="n/a" />
                </div>
            </div>

            <div class="govuk-form-group ${messagesPerField.printIfExists('email',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="email" class="govuk-label">${msg("registerEmailAddress")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="email" id="email" class="govuk-input" name="email" value="${(register.formData.email!'')}" autocomplete="work email" />
                </div>
            </div>

            <div class="govuk-form-group ${messagesPerField.printIfExists('mobileNumber',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="mobileNumber" class="govuk-label">${msg("mobileNumber")}</label>
                    <span id="mobileNumber-hint" class="govuk-hint">${msg("mobileNumberHint")}</span>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="tel" id="mobileNumber" class="govuk-input" name="mobileNumber" value="${(register.formData.mobileNumber!'')}" autocomplete="mobile tel" aria-describedby="mobileNumber-hint" />
                </div>
            </div>

            <#if passwordRequired>
                <div class="govuk-form-group ${messagesPerField.printIfExists('password',properties.kcFormGroupErrorClass!)}">
                    <div class="${properties.kcLabelWrapperClass!}">
                        <label for="password" class="govuk-label">${msg("createPassword")}</label>
                        <span id="password-hint" class="govuk-hint">${msg("passwordHint")}</span>
                    </div>
                    <div class="${properties.kcInputWrapperClass!}">
                        <input type="password" id="password" class="govuk-input" name="password" aria-describedby="password-hint" />
                    </div>
                </div>

                <div class="govuk-form-group ${messagesPerField.printIfExists('password-confirm',properties.kcFormGroupErrorClass!)}">
                    <div class="${properties.kcLabelWrapperClass!}">
                        <label for="password-confirm" class="govuk-label">${msg("passwordConfirm")}</label>
                    </div>
                    <div class="${properties.kcInputWrapperClass!}">
                        <input type="password" id="password-confirm" class="govuk-input" name="password-confirm" />
                    </div>
                </div>
            </#if>

            <#if recaptchaRequired??>
                <div class="form-group">
                    <div class="${properties.kcInputWrapperClass!}">
                        <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                    </div>
                </div>
            </#if>

            <div class="govuk-form-group">
                <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                    <input class="govuk-button" type="submit" value="${msg("doRegister")}"/>
                </div>
            </div>
        </form>
    </#if>
</@layout.registrationLayout>
