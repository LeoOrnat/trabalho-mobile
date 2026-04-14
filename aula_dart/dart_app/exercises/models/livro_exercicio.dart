class LivroExercicio {
  final String id; // Identificador unico do livro
  final String titulo; // Titulo do livro
  final String autor; // Autor do livro
  final int anoPublicacao; // Ano de publicacao

  LivroExercicio({
    required this.id,
    required this.titulo,
    required this.autor,
    required this.anoPublicacao,
  });

  LivroExercicio copyWith({
    String? id,
    String? titulo,
    String? autor,
    int? anoPublicacao,
  }) {
     // Cria uma nova instancia com apenas os campos informados alterados
    return LivroExercicio(
      id: id ?? this.id,
      titulo: titulo ?? this.titulo,
      autor: autor ?? this.autor,
      anoPublicacao: anoPublicacao ?? this.anoPublicacao,
    );
  }

  @override
  String toString() {
        // Formato amigavel para exibicao no terminal
    return 'ID: $id | "$titulo" - $autor ($anoPublicacao)';
  }
}
