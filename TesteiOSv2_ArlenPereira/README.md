Procedimento para rodar este projeto:

1 - Entre no diretorio do projeto, localize o arquivo "Podfile" e execute o comando "pod install" para carregar as bibliotecas;

2- Para executar os testes unitario e preciso verificar se o projeto esta apontando as bibliotecas pod, para isso segue as seguintes instrucoes:

- Ao entrar no projeto pelo arquivo "TesteiOSv2_ArlenPereira.xcworkspace";
- Clique na raiz do projeto do "Project Navigator";
- Selecione em "TesteiOSv2_ArlenPereira" no "PROJECT";
- Na aba "Info", procure a opcoes "Configurations" , "Debug" e "93TesteiOSv2_ArlenPereira";
- Em "TesteiOSv2_ArlenPereiraTests", na "Based on Configuration Files" certifique-se que as opcoes "Pods-TesteiOSv2_ArlenPereira.debug" esta selecionada;
- Expanda tambem em  opcoes "Release" e "TesteiOSv2_ArlenPereira";
- Em "TesteiOSv2_ArlenPereiraTests" na "Based on Configuration Files" certifique-se que as opcoes "Pods-TesteiOSv2_ArlenPereira.release" tambem esta selecionada.
}
