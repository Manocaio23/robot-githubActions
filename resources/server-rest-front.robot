*** Settings ***
Library     Browser
Library     FakerLibrary

*** Variables ***
${BROWSER}      chromium
${HEADLESS}     ${false}    
#${SITE}          https://front.serverest.dev/login
${SITE}           https://the-internet.herokuapp.com/dropdown
${EMAIL}        xpath=//*[@id="email"]
${NOME}         xpath=//*[@id="nome"]
${SENHA}        xpath=//*[@id="password"]
${IFRAME}        https://the-internet.herokuapp.com/iframe
${TABLES}        https://the-internet.herokuapp.com/tables
${ABA}           https://the-internet.herokuapp.com/windows 
*** Keywords ***

Abrir Navegador
    New Browser     browser=${BROWSER}  
    ...             headless=${HEADLESS} 
    New Context     viewport={'width': 1200, 'height': 800}

    New Page       ${ABA} 
    

Pegar elementos
    Record Selector 

Preencher Dados Do Cadastro
    Click    css=.btn-link
    Fill Text   ${NOME}      teste 
    Fill Text    ${EMAIL}    teste4e@outlook.com
    Fill Text    ${SENHA}     123456
    Check Checkbox      xpath=//*[@id="administrador"]      
    Click   xpath=//*[@id="root"]/div/div/form/div[5]/button
   # Sleep          5s
    
    #Pegar elementos 

Conferir usuario cadastrado
   # Wait For Elements State      h1    visible

   Get Text    h1  ==    Bem Vindo teste
   Get Element States    xpath=//*[@id="navbarTogglerDemo01"]/form/button    validate    value & visible

Interagindo com DropDown "${opcao}"
    Select Options By    id=dropdown    text       ${opcao}

Tira print
    Take Screenshot    

Pegando o iframe
    # pegar o trexto do iframe
    ${text}    Get Text    id=mce_0_ifr >>> id=tinymce
    Log      ${text}

Conferindo valores da tabela 

    Click    id=table1 >> text=Jason
    ${elemento}    Get Table Cell Element    id=table1    1    3
    ${nome}    Get Text    ${elemento}     ==  Jason 
    Log    ${nome}

Conferindo valores da tabela com texto
    # se o first name do email é jason
     Click    id=table1 >> text=Jason
    ${elemento}    Get Table Cell Element    id=table1    "First Name"    "http://www.jdoe.com"
    ${nome}    Get Text    ${elemento}     ==  Jason
    Log    ${nome}


Interagindo com as novas abas
    
Clicando e acessando a nova abas
    Click  text="Click Here"
    Switch Page    NEW
    Get Text    h3    ==   New Window   
    Tira print 

Voltar para pagina inicial
    #QUERO A PRIMEIRA PAGINA ABERTA [0]
    [Arguments]    ${pag_id}
    Switch Page    ${pag_id}[0]
    Tira print