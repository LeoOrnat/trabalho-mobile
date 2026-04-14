import '../models/livro_exercicio.dart';

class BibliotecaExercicioService {
  final List<LivroExercicio> _livros = []; // "Banco de dados" em memoria

  // Exposicao somente leitura da lista de livros
  List<LivroExercicio> get livros => List<LivroExercicio>.unmodifiable(_livros);

  bool adicionarLivro(LivroExercicio livro) {
    // Nao permite IDs duplicados
    final bool jaExiste = _livros.any((LivroExercicio l) => l.id == livro.id);
    if (jaExiste) {
      return false;
    }
    _livros.add(livro);
    return true;
  }


  LivroExercicio? buscarPorId(String id) {
     // Busca linear por ID
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
    // Atualiza somente os campos nao nulos (via copyWith)
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
        // Remove pelo ID
    final int index = _livros.indexWhere((LivroExercicio l) => l.id == id);
    if (index == -1) {
      return false;
    }
    _livros.removeAt(index);
    return true;
  }

  void listarLivros() {
       // Mostra o estado atual da lista no terminal
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
