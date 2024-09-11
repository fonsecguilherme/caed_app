
# CAED App
- Aplicativo criado para o teste da vaga de desenvolvedor Flutter da CAED. O aplicativo consiste em 3 telas; login, home page com informações e uma tela de detalhes. Para fazer o mock dos dados da API eu usei o serviço [mocki.io](https://mocki.io) e fiz um mock simples, e usei a representação das informações que estavam sendo mostrada nas telas da adobe. 

## Autor
- Guilherme Fonseca [Github](https://github.com/fonsecguilherme) e [Linkedin](https://www.linkedin.com/in/devfonsecguilherme/)

## Stack utilizada

**Front-end:** Dart e Flutter

**Pacotes utilizados:** [BLoC](https://pub.dev/packages/bloc), [Flutter BLoC](https://pub.dev/packages/flutter_bloc), [HTTP](https://pub.dev/packages/http), [BLoC test](https://pub.dev/packages/bloc_test), [Equatable](https://pub.dev/packages/equatable), [Mocktail](https://pub.dev/packages/mocktail), [BLoC test](https://pub.dev/packages/bloc_test)

State management: BLoC and Flutter BLoC

API requests: HTTP

## BLoC
- Para esse projeto, foi utilizado cubits para gerenciamento de estados e arquitetura proposta na documentação do bloc. A escolha foi baseada justamente por ser um padrão bem definido, altamente testável, com boa adoção pelo mercado e as possibilidades de ajustes finos na UI. 

## Testes
- Para os testes, escrevi testes de tela (widgets) para verificar se quando determinados estão sendo emitidos, os componentes corretos estão sendo mostrados. Testes de BLoC de login e de navegação da bottom navigation bar. Além de testes do repositório e também do modelo de representação de dados retornados pela API.
  
## Screenshots
* Login Screen
<p float=!"left">
  <img src="https://github.com/user-attachments/assets/ed68feaa-70ab-48b5-b30d-bd48344e7fee" width="350" />
</p>

* Home Screen
<p float="left">
  <img src="https://github.com/user-attachments/assets/fd5633b8-b2a4-4b67-a14f-10c79c5327be" width="350" />
  <img src="https://github.com/user-attachments/assets/033d0144-7984-402a-8b79-86992fb1cb2b" width="350" />
  <img src="https://github.com/user-attachments/assets/2c045dc2-5b31-418b-8790-e5b8d6020d7c" width="350" />
  <img src="https://github.com/user-attachments/assets/c53ec30b-62c4-4a9e-9ecb-3fc8ede664b3" width="350" />
  <img src="https://github.com/user-attachments/assets/e1352b19-45e3-4480-adc5-e2285d72b616" width="350" />
  <img src="https://github.com/user-attachments/assets/ffcd7f9a-7079-4c0c-9c82-a29075eb526f" width="350" />
</p>

* Package Detail Screen
<p float="left">
  <img src="https://github.com/user-attachments/assets/c2416c45-7f0b-490f-84ff-2939731049e5" width="350" />
  <img src="https://github.com/user-attachments/assets/15148372-5cde-4084-b931-a676a94f2850" width="350" />
</p>

* Error flushbar
<p float="left">
  <img src="https://github.com/user-attachments/assets/69979c17-27fe-4909-9847-8c5cddcb4007" width="350" />
  <img src="https://github.com/user-attachments/assets/7589c1da-f10c-49d0-8e66-500b2cca3c91" width="350" />
</p>

