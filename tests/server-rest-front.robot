*** Settings ***

Resource   ../resources/server-rest-front.robot
Test Teardown    Take Screenshot 

*** Test Cases ***

Login com sucesso
    Abrir Navegador
    Preencher Dados Do Cadastro
    Conferir usuario cadastrado
    
Pegando dropdown
  Abrir Navegador
  Interagindo com DropDown "Option 1"

iframe
    Abrir Navegador
    Pegando o iframe

Validando tabelas
    Abrir Navegador
    Conferindo valores da tabela com texto

Abrindo navegador e voltando para pagina inicial
    Abrir Navegador
    ${pag_id}    Get Page Ids   CURRENT
    Clicando e acessando a nova abas
    Voltar para pagina inicial    ${pag_id}