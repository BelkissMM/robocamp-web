*** Settings ***
Documentation    Este arquivo implementa funções e elementos da página produtos

***Variables***
${BUTTON_PRODUCT_ADD}       class:product-add

*** Keywords ***
# Quando eu faço o cadastro desse produto
Go to Product Form
    Wait Until Element Is Visible       ${BUTTON_PRODUCT_ADD}
    Click Element                       ${BUTTON_PRODUCT_ADD}
    Wait Until Page Contains            Novo Produto

Create New Product
    [Arguments]    ${product_json}
# Click Element      class:product-add

    Input Text         css:input[name=title]    ${product_json['name']}

    Run Keyword if     "${product_json['cat']}"
    ...     Select Category    ${product_json['cat']}
    
    Input Text         css:input[name=price]     ${product_json['price']}

    Input Producers    ${product_json['producers']}
    Input Text         css: textarea[name=description]    ${product_json['desc']}

    Run Keyword if     "${product_json['image']}"
    ...     Upload Photo       ${product_json['image']}

    Click Element      id:create-product

Upload Photo
    [Arguments]        ${image}
    ${file}            Set Variable     ${EXECDIR}/resources/fixtures/images/${image}
    Choose File        id:upcover       ${file}

Select Category    #Keyword q seleciona categoria
    [Arguments]        ${cat}
    Click Element      css:input[placeholder=Gategoria]
#Set Selenium Speed 1
    Wait Until Element Is Visible    class:el-select-dropdown__list
    Click Element                    xpath://li/span[text()='${cat}']
#Set Selenium Speed 0

Input Producers
    [Arguments]         ${producers}

    :FOR    ${item}    IN    @{producers}
    \    Log            ${item}
    \    Input Text     class:producers    ${item}
    \    Press Keys     class:producers    TAB

#Create New Product
  ###Antes da refatoração
    # [Arguments]         ${product_json}

    # Click Element       class:product-add
    # Input Text          css:input[name=title]      ${product_json['name']}

    # Click Element       css:input[placeholder=Gategoria]

    # #Set Selenium Speed  1
    # Wait Until Element Is Visible   class:el-select-dropdown__list
    # Click Element       xpath://li/span[text()='${product_json['cat']}']
    # #Set Selenium Speed  0

    # Input Text          css:input[name=price]      ${product_json['price']}

    # @{producers}=   Set Variable    ${product_json['producers']}

    # :FOR                  ${item}     IN  @{producers}
    # \   Log               ${item}
    # \   Input Text        class:producers   ${item}
    # \   Press Keys        class:producers   TAB

    # Input Text            css: textarea[name=description]   ${product_json['desc']}

    # Click Element         id:create-product

    # Set Test Variable     ${product_json} Foi lá para pgna Actions
    # #deixar disponível para esse step. Pq o Json está dentro da opção do qndo e não do então.


