import '../models/livro_exercicio.dart';

class BibliotecaExercicioService {
  final List<LivroExercicio> _livros = [];

  List<LivroExercicio> get livros => List<LivroExercicio>.unmodifiable(_livros);

  bool adicionarLivro(LivroExercicio livro) {
    final bool jaExiste = _livros.any((LivroExercicio l) => l.id == livro.id);
    if (jaExiste) {
      return false;
    }
    _livros.add(livro);
    return true;
  }

  LivroExercicio? buscarPorId(String id) {
    for (final livro in _livros) {
      if (livro.id == id) {
        return livro;
      }
    }
    return null;
  }

  bool atualizarLivro(
    String id, {
    String? titulo,
    String? autor,
    int? anoPublicacao,
  }) {
    final int index = _livros.indexWhere((LivroExercicio l) => l.id == id);
    if (index == -1) {
      return false;
    }

    _livros[index] = _livros[index].copyWith(
      titulo: titulo,
      autor: autor,
      anoPublicacao: anoPublicacao,
    );
    return true;
  }

  bool removerLivro(String id) {
    final int index = _livros.indexWhere((LivroExercicio l) => l.id == id);
    if (index == -1) {
      return false;
    }
    _livros.removeAt(index);
    return true;
  }

  void listarLivros() {
    print('[23] Livros cadastrados na biblioteca:');
    if (_livros.isEmpty) {
      print('  (nenhum livro cadastrado)');
      return;
    }
    for (final livro in _livros) {
      print('  - $livro');
    }
  }
}
