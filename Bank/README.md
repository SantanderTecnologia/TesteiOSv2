:bank: Bank
===================

### Desafio
Na primeira tela teremos um formulario de login, o campo user deve aceitar email ou cpf, o campo password deve validar se a senha tem pelo menos uma letra maiuscula, um caracter especial e um caracter alfanumérico. Apos a validação, realizar o login no endpoint https://bank-app-test.herokuapp.com/api/login e exibir os dados de retorno na próxima tela. O ultimo usuário logado deve ser salvo de forma segura localmente, e exibido na vtela de login se houver algum salvo.   

Na segunda tela será exibido os dados formatados do retorno do login e será necessário fazer um segundo request para obter os lançamentos do usuário, no endpoint https://bank-app-test.herokuapp.com/api/statements/{idUser} que retornará uma lista de lançamentos.   

### Avaliação
Você será avaliado pela usabilidade, por respeitar o design e pela arquitetura do app. É esperado que você consiga explicar as decisões que tomou durante o desenvolvimento através de commits.

### Obrigatórios
:white_check_mark: Versão mínima Linguagem: Swift 3.0   
:white_check_mark: Versão mínima OS: iOS 9   
:white_check_mark: Autolayout  
:white_check_mark: Teste Unitários   
:white_check_mark: Arquitetura Clean-Swift   
:white_check_mark: Git   

### Justificativas
Teste Unitários: Foi utilizado o XCTest por se tratar de um recurso nativo, fácil de utilizar e não depender de recursos de terceiros.


### Laércio Luiz Obici Junior / Altran  
#### Requisitos:
- Xcode 10.1   
- Cocoapods   
#### Passo a passo:
- 1. Após clonar o projeto abra um terminal na pasta principal "Bank".   
- 2. Execute o comando "pod install" para obter as dependências do projeto no Cocoapods.   
- 3. Abra o arquivo "Bank.xcworkspace".   
- 4. Na "Project navigator" selecionar o arquivo principal do projeto "Bank" :arrow_right: Na aba "General" :arrow_right: "Signing" :arrow_right: "Team" Selecionar o time configurado no XCode.   
- 5. Utilize o botão "Build & Run" ou as teclas "(Command)⌘+B e (Command)⌘+R" para executar o projeto no simulador.  
- 6. Caso opte por executar em um dispositivo físico:   
Após o "Build & Run" no XCode, no dispositivo entrar em Ajustes :arrow_right: Geral :arrow_right: Gerenciamento de Dispositivo :arrow_right: Selecione a conta de Desenvolvedor :arrow_right: e agora o "Bank" vai estar disponível na lista dos app e basta utilizar o botão "Confiar em:" para poder utiliza-lo no dispositivo.   