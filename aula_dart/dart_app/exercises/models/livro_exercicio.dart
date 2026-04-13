class LivroExercicio {
  final String id;
  final String titulo;
  final String autor;
  final int anoPublicacao;

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
    return LivroExercicio(
      id: id ?? this.id,
      titulo: titulo ?? this.titulo,
      autor: autor ?? this.autor,
      anoPublicacao: anoPublicacao ?? this.anoPublicacao,
    );
  }

  @override
  String toString() {
    return 'ID: $id | "$titulo" - $autor ($anoPublicacao)';
  }
}
