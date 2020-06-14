*** Settings ***
Documentation       Este arquivo implementa abertura e fechamento do navegador

***Variables***
${base_url}     http://pixel-web:3000

${ALERT_DANGER}         class:alert-danger
${ALERT_INFO}           class:alert-info

*** Keywords ***
### Hooks
Open Session
    Open Chrome Readless
    Set Selenium Implicit Wait  5
    Set Window Size     1280        800

Close Session
    Close Browser

After Test
    Capture Page Screenshot

After Test WCLS 
#WCLS Com limpeza do Local Storage
    Capture Page Screenshot
    Execute Javascript      localStorage.clear();

Login Session
    Open Session
    Login With  papito@ninjapixel.com   pwd123
   
Product Form Session 
# ele já vai direto para o formulário, só vai rodar 1 única vez, cadastro_tentativa
    Login Session
    Go to Product Form

Open Chrome
    Open Browser    ${base_url}/login    chrome   options=add_experimental_option('excludeSwitches', ['enable-logging'])


Open Chrome Readless
     Open Browser    ${base_url}/login    headlesschrome   options=add_experimental_option('excludeSwitches', ['enable-logging'])