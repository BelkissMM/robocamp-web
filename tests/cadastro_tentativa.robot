*** Settings ***
Documentation       Cadastro de produtos
...         Sendo um administrador de catálogo
...         Quero cadastrar produtos
...         Para que eu possa disponibiliza-los na loja virtual

Resource    ../resources/actions.robot

Suite Setup     Product Form Session
Suite Teardown  Close Session

Test Setup      Reload Page
Test Teardown   After Test WCLS 
Test Template   Tentativa de cadastro
# Test Setup      Login Session
# Test Teardown   Close Session


***Keywords***
Tentativa de cadastro
    [Arguments]     ${file_name}        ${expect_message}

    Dado que eu tenho um novo produto   ${file_name}
    Quando eu tento cadastrar o produto
    Entao devo ver uma mensagem informativa     ${expect_message}

*** Test Cases ***              produto             saida
Nome não informado              streetf2.json       Oops - Informe o nome do produto!
Categoria não selecionada       kidchameleon.json   Oops - Selecione uma categoria!
Preço não informado             shinobi.json        Oops - Informe o preço também!

# Nome não informado
    # [Tags]          no_name
    # [Template]      Tentativa de cadastro
    # streetf2.json   Oops - Informe o nome do produto!


# Categoria não selecionada 
    # [Tags]          no_cat
    # [Template]      Tentativa de cadastro
    # kidchamelon.json  Oops - Selecione uma categoria!

# Preço não informado
    # [Tags]           no_price
    # [Template]      Tentativa de cadastro
    # shinobi.json    Oops - Informe o preço também!

