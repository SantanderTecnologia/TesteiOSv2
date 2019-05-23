# Bank App #

Teste para vaga de desenvolvedor iOS no banco Santander.
Utlizando MVP + Coordinator, e isolando a responsabilidade de consumo de dados em um repositório.

## Executar projeto ##
Para executar o projeto execute o comando `bundle exec fastlane setup` a partir da pasta do projeto.

A `lane` setup se encarrega por instalar as dependências do projeto (cocoapods).

Após execução da lane um novo arquivo `BankApp.xcworkspace` será criado, basta abrir o arquivo e executar.

### Installed Pods ###
1. Keychain - Salvar dados de forma segura no Keychain do dispositivo
2. Alamofire - Execução de requisições a APIs. (Prefiro utilizar URLSession porém por economia de tempo, preferi utilizar Alamofire.)

### Executar Unit Tests ##
Para executar os testes unitários basta executar o comando `bundle exec fastlane test` a partir da pasta do projeto.

### Dados pessoais ###
*Nome*: Pedro Veloso

*Empresa*: Resource IT
