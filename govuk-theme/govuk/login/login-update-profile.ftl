<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "title">
        ${msg("loginProfileTitle")}
    <#elseif section="header">
        ${msg("loginProfileTitle")}
    <#elseif section = "form">
        <form id="kc-update-profile-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
            <#if user.editUsernameAllowed>
                <div class="govuk-form-group ${messagesPerField.printIfExists('username',properties.kcFormGroupErrorClass!)} hidden">
                    <label for="username" class="govuk-label">${msg("username")}</label>
                    <input type="text" id="username" name="username" class="govuk-input" value="${(user.username!'')}" />
                </div>
            </#if>
            <#--We're hiding this field as keycloak needs it for form validation, but we don't let users change it-->
            <div hidden class="govuk-form-group ${messagesPerField.printIfExists('email',properties.kcFormGroupErrorClass!)}">
                <label for="email" class="govuk-label">${msg("email")}</label>
                <input type="text" id="email" name="email" value="${(user.email!'')}" class="govuk-input" />
            </div>

            <div class="govuk-form-group ${messagesPerField.printIfExists('firstName',properties.kcFormGroupErrorClass!)}">
                <label for="firstName" class="govuk-label">${msg("firstName")}</label>
                <input type="text" class="govuk-input" id="firstName" name="firstName" value="${(user.firstName!'')}" autocomplete="name" />
                <input type="hidden" id="lastName" name="lastName" readonly value="n/a" />
            </div>

            <div class="govuk-form-group">
                <input class="govuk-button" type="submit" value="${msg("doSubmit")}"/>
            </div>
        </form>
    </#if>
</@layout.registrationLayout>
