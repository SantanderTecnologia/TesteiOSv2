[![Platform](https://img.shields.io/badge/iOS-9-green.svg)](https://developer.apple.com/ios/)

# Show me the code

Esse repositório contem uma aplicação por mim desenvolvida como exemplo abaixo: 
![Image of Yaktocat](https://github.com/SantanderTecnologia/TesteiOSv2/blob/master/telas.png)

# First time running 🚀
Abra o terminal e instale os pods rodando o codigo a seguir na pasta do projeto.
```bash
$ pod install
$ open BankApp.xcworkspace/
```
Com Xcode aberto clique em Run (CMD + R) no menu Product.

### # DESAFIO:

Na primeira tela teremos um formulario de login, o campo user deve aceitar email ou cpf,
o campo password deve validar se a senha tem pelo menos uma letra maiuscula, um caracter especial e um caracter alfanumérico.
Apos a validação, realizar o login no endpoint https://bank-app-test.herokuapp.com/api/login e exibir os dados de retorno na próxima tela.
O ultimo usuário logado deve ser salvo de forma segura localmente, e exibido na tela de login se houver algum salvo. 

Na segunda tela será exibido os dados formatados do retorno do login e será necessário fazer um segundo request para obter os lançamentos do usuário, no endpoint https://bank-app-test.herokuapp.com/api/statements/{idUser} que retornará uma lista de lançamentos

* Swift 3.0 ou superior
* Autolayout
* O app deve funcionar no iOS 9
* Testes unitários, pode usar a ferramenta que você tem mais experiência, só nos explique o que ele tem de bom.
* Arquitetura a ser utilizada: Swift Clean ([https://clean-swift.com/handbook/](https://clean-swift.com/handbook/) && [https://github.com/Clean-Swift/CleanStore](https://github.com/Clean-Swift/CleanStore)
* Uso do git.
