# Programação para Dispositivos Móveis - Unicesumar Ponta Grossa

Repositório das aulas práticas da disciplina de Programação para Dispositivos Móveis para as turmas de:

- Análise e Desenvolvimento de Sistemas (5º semestre)
- Engenharia de Software (7º semestre)

O objetivo deste repositório é centralizar exemplos, exercícios e projetos desenvolvidos em aula com Dart e Flutter.

## Estrutura do Repositório

```text
mobile/
  dart/
    dart_app/
      bin/
      lib/
      exercises/
      test/
  flutter/
    app/
      lib/
      test/
      docs/
      aula_widget/
```

## Como Usar Este Repositório

1. Clone o repositório na sua máquina.
2. Acompanhe os códigos por pasta de tecnologia (`dart/` e `flutter/`).
3. Atualize com frequência para obter os códigos das aulas mais recentes.
4. Para exercícios, crie sua própria branch para praticar sem perder o histórico.

## Pré-Requisitos

- Dart SDK (versão estável)
- Flutter SDK (versão estável)
- Git
- VS Code ou Android Studio

## Trilha Dart

Projeto principal: `dart/dart_app`

Comandos úteis:

```bash
cd dart/dart_app
dart pub get
dart run bin/dart_examples.dart
dart test
```

A pasta `exercises/` contém propostas práticas para fixação dos conteúdos.

## Trilha Flutter

Projeto principal: `flutter/app`

Comandos úteis:

```bash
cd flutter/app
flutter pub get
flutter run
flutter test
```

Projeto complementar de widgets/componentização:

```bash
cd flutter/app/aula_widget
flutter pub get
flutter run
flutter test
```

## Boas Práticas Para Alunos

- Mantenha seu ambiente atualizado (`dart --version` e `flutter --version`).
- Sempre execute `pub get` após atualizar o repositório.
- Não envie para o Git arquivos gerados de build/cache.
- Documente suas dúvidas e tentativas de solução nos exercícios.

## Versionamento das Aulas

Sugestão de estratégia para acompanhamento:

- Commits por aula e por tópico.
- Tags para marcos importantes (exemplo: `aula-01`, `aula-02`).
- Histórico limpo para facilitar revisão antes de provas e trabalhos.

## Trabalhos Práticos da Disciplina

Esta disciplina possui atividades práticas ao longo do semestre.
**A Atividade Avaliativa 1 é individual.**
As Atividades Avaliativas 2, 3 e 4 devem ser desenvolvidas em grupo.
Os trabalhos têm como objetivo consolidar os conceitos estudados em aula por meio do desenvolvimento de aplicações utilizando **Dart** e **Flutter**.

### Arquivos das Atividades Avaliativas

- [ATIVIDADE_AVALIATIVA_1.md](ATIVIDADE_AVALIATIVA_1.md)
- [ATIVIDADE_AVALIATIVA_2.md](ATIVIDADE_AVALIATIVA_2.md)
- [ATIVIDADE_AVALIATIVA_3.md](ATIVIDADE_AVALIATIVA_3.md)
- [ATIVIDADE_AVALIATIVA_4.md](ATIVIDADE_AVALIATIVA_4.md)

### Regras Gerais para Entrega

Todos os trabalhos da disciplina devem seguir as seguintes regras.

#### Entrega

A entrega será realizada em **duas etapas**:

1. **Publicação do projeto no GitHub**
2. **Envio do link do repositório por e-mail**

#### Repositório no GitHub

- A entrega deve ser realizada por meio de um **repositório público no GitHub**.
- O repositório deve conter:
  - o **código-fonte do projeto**
  - um arquivo **README.md** contendo a documentação da solução.

#### Envio por e-mail

Após publicar o repositório no GitHub, enviar o **link do repositório por e-mail** para:

**joao.vsantos@unicesumar.edu.br**

O e-mail deve seguir o formato abaixo:

**Título do e-mail**

Trabalho 1 Mobile ESOFT7S (ou ADSIS5S)

Substituir o número conforme o trabalho (Trabalho 2, Trabalho 3, etc.).

**Corpo do e-mail**

Deve conter:

- Nome completo de cada integrante da equipe
- Usuário do GitHub de cada integrante
- Link do repositório no GitHub

Exemplo:

Integrantes:

Rafael Domingues - [github.com/domingues497](https://github.com/domingues497)
Leonardo Ornat - [github.com/LeoOrnat](https://github.com/LeoOrnat)
Luiz Lealdino - [github.com/LuizLealdino-stack](https://github.com/LuizLealdino-stack)
João Gustavo Rodrigues - [github.com/gutsfz](https://github.com/gutsfz)
Rullian Peep19 - [github.com/rullianpeep19-dotcom](https://github.com/rullianpeep19-dotcom) 


Repositório:
https://github.com/domingues497/trabalho-mobile

**Cópia do e-mail (CC)**

O e-mail deve incluir **em cópia (CC)** o endereço de e-mail de **todos os integrantes da equipe**.

#### Entrega por apresentação ou vídeo

- A entrega poderá ser feita por **apresentação presencial** ou por **vídeo**.
- **Uma modalidade substitui a outra**: se a apresentação for em vídeo, não é necessário apresentar presencialmente, e vice-versa.
- Em qualquer modalidade, **cada integrante** deve explicar um trecho do código desenvolvido.
- Prazo de entrega:
  - **Engenharia de Software:** **13/04**, até **22h**.
  - **Análise e Desenvolvimento de Sistemas:** **14/04**, até **22h**.
  
Os grupos deverão:

- executar a aplicação
- demonstrar as funcionalidades implementadas
- explicar a estrutura do código desenvolvido

Caso o grupo **não consiga explicar o funcionamento da própria implementação**, a nota poderá ser reduzida.
Todos os intrgrantes do grupo devem participar.
  

#### Trabalho em Grupo

- Os trabalhos podem ser realizados em **grupos de até 6 participantes**.

#### Participação Individual

- Cada integrante do grupo deve possuir **pelo menos um commit relevante** relacionado ao desenvolvimento da atividade no repositório.


### Sugestão para o README dos Trabalhos

Recomenda-se incluir no README do trabalho uma seção indicando a contribuição de cada integrante:

Contribuição dos integrantes:

Rafael Domingues - fez o atividade avaliativa 2 fazendo projeto.
Leonardo Ornat - fez o atividade avaliativa 4 fazendo projeto.
Luiz Lealdino - fez o atividade avaliativa 3 fazendo projeto.
João Gustavo Rodrigues - fez o atividade avaliativa 4 fazendo projeto.
Rullian Peep19 - fez o atividade avaliativa 4 fazendo projeto.


## Observações

Este repositório é voltado para fins didáticos. O foco é aprendizagem progressiva por meio de exemplos pequenos, exercícios guiados e evolução incremental dos projetos.
