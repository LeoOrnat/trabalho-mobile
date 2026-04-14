# dart_app

Projeto Dart utilizado nas aulas práticas da disciplina de Programação para Dispositivos Móveis.

## Estrutura do Projeto

```text
dart_app/
	bin/         # ponto de entrada
	lib/         # modelos e serviços
	exercises/   # exercícios da disciplina
	test/        # testes automatizados
```

## Executar o Projeto

```bash
dart pub get
dart run bin/dart_examples.dart
```

## Trabalho 1 - Hello World

- Nome do estudante: (preencher)
- Objetivo: executar um programa simples em Dart imprimindo "Hello World" no terminal.

### Executar

```bash
dart run bin/trabalho1_hello_world.dart
```

### Saida esperada

```text
Hello World
```

## Trabalho 2 - CRUD de Biblioteca (Terminal)

- Integrantes do grupo: (preencher)
- Objetivo: gerenciar livros no terminal usando POO (classes, atributos, metodos, construtores) e lista em memoria.

### Executar

```bash
dart run bin/trabalho2_crud_biblioteca.dart
```

### Menu

```text
1 - Cadastrar livro
2 - Listar livros
3 - Atualizar livro
4 - Remover livro
5 - Sair
```

## Executar Testes

```bash
dart test
```

## Observações

- Os exercícios estão organizados por arquivo numerado na pasta `exercises/`.
- As implementações de apoio usadas em aula estão em `lib/`.
- Recomenda-se commitar a evolução por exercício para facilitar revisão.
--