# Instalação do aplicativo

O Projeto esta utilizando CocoaPods como gerenciador de dependencia

É necessario ter a dependencia CocoaPods instalado 
    - sudo gem install cocoapods

Após a instalação da Gem é necessário entrar na pasta do projeto 
    - cd BankTest

E rodar o seguinte comando
    - pod install

Aproveite esse tempo para ir tomar um cafezinho ;)

# Observação

Estou utilizando duas libs:

    - Moya: 
        Moya é uma biblioteca de abstração de rede Swift. Ele nos fornece uma abstração para fazer chamadas de rede sem se comunicar diretamente com a Alamofire.
    
    - Keychain
        Keychain é um armazenamento seguro. Você pode armazenar todos os tipos de dados confidenciais: senhas de usuário, números de cartão de crédito, tokens secretos etc. Depois de armazenadas no Keychain, essas informações estão disponíveis apenas para o seu aplicativo, outros aplicativos não podem vê-lo.

# Fim Observação

Abra o arquivo 
    BankTest.xcworkspace

- Dentro da pasta BankTest

Command+R para rodar o projeto no Xcode ^^

# Tests

Escolhi utilizar o XCTest proprio da Apple por ser nativo e cobrir bem o que deveria ser testado neste projeto.