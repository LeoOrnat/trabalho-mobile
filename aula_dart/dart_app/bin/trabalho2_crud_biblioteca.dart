import 'dart:io';

import '../exercises/models/livro_exercicio.dart';
import '../exercises/services/biblioteca_exercicio_service.dart';

void main() {
  final BibliotecaExercicioService biblioteca = BibliotecaExercicioService();

  while (true) {
    _mostrarMenu();
    final int? opcao = _lerInt('Opcao: ');

    switch (opcao) {
      case 1:
        _cadastrarLivro(biblioteca);
        break;
      case 2:
        biblioteca.listarLivros();
        break;
      case 3:
        _atualizarLivro(biblioteca);
        break;
      case 4:
        _removerLivro(biblioteca);
        break;
      case 5:
        print('Saindo...');
        return;
      default:
        print('Opcao invalida.');
    }

    print('');
  }
}

void _mostrarMenu() {
  print('1 - Cadastrar livro');
  print('2 - Listar livros');
  print('3 - Atualizar livro');
  print('4 - Remover livro');
  print('5 - Sair');
}

void _cadastrarLivro(BibliotecaExercicioService biblioteca) {
  final String id = _lerLinha('ID: ').trim();
  final String titulo = _lerLinha('Titulo: ').trim();
  final String autor = _lerLinha('Autor: ').trim();
  final int? anoPublicacao = _lerInt('Ano de publicacao: ');

  if (id.isEmpty || titulo.isEmpty || autor.isEmpty || anoPublicacao == null) {
    print('Dados invalidos. Cadastro cancelado.');
    return;
  }

  final bool ok = biblioteca.adicionarLivro(
    LivroExercicio(
      id: id,
      titulo: titulo,
      autor: autor,
      anoPublicacao: anoPublicacao,
    ),
  );

  if (!ok) {
    print('Ja existe um livro com ID "$id".');
    return;
  }

  print('Livro cadastrado com sucesso.');
}

void _atualizarLivro(BibliotecaExercicioService biblioteca) {
  final String id = _lerLinha('ID do livro para atualizar: ').trim();
  final LivroExercicio? livro = biblioteca.buscarPorId(id);
  if (livro == null) {
    print('Livro nao encontrado.');
    return;
  }

  print('Livro atual: $livro');

  final String novoTitulo = _lerLinha('Novo titulo (enter para manter): ').trim();
  final String novoAutor = _lerLinha('Novo autor (enter para manter): ').trim();
  final String anoRaw = _lerLinha('Novo ano (enter para manter): ').trim();

  final int? novoAno = anoRaw.isEmpty ? null : int.tryParse(anoRaw);
  if (anoRaw.isNotEmpty && novoAno == null) {
    print('Ano invalido. Atualizacao cancelada.');
    return;
  }

  final bool ok = biblioteca.atualizarLivro(
    id,
    titulo: novoTitulo.isEmpty ? null : novoTitulo,
    autor: novoAutor.isEmpty ? null : novoAutor,
    anoPublicacao: novoAno,
  );

  if (!ok) {
    print('Falha ao atualizar.');
    return;
  }

  print('Livro atualizado com sucesso.');
}

void _removerLivro(BibliotecaExercicioService biblioteca) {
  final String id = _lerLinha('ID do livro para remover: ').trim();

  final bool ok = biblioteca.removerLivro(id);
  if (!ok) {
    print('Livro nao encontrado.');
    return;
  }

  print('Livro removido com sucesso.');
}

String _lerLinha(String prompt) {
  stdout.write(prompt);
  return stdin.readLineSync() ?? '';
}

int? _lerInt(String prompt) {
  final String raw = _lerLinha(prompt).trim();
  if (raw.isEmpty) {
    return null;
  }
  return int.tryParse(raw);
}
