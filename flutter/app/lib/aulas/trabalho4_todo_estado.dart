import 'package:flutter_riverpod/flutter_riverpod.dart';

class Tarefa {
  final String id;
  final String titulo;
  final bool concluida;

  const Tarefa({
    required this.id,
    required this.titulo,
    required this.concluida,
  });

  Tarefa copyWith({String? id, String? titulo, bool? concluida}) {
    return Tarefa(
      id: id ?? this.id,
      titulo: titulo ?? this.titulo,
      concluida: concluida ?? this.concluida,
    );
  }
}

class TarefasNotifier extends StateNotifier<List<Tarefa>> {
  TarefasNotifier() : super(const <Tarefa>[]);

  void adicionar(String titulo) {
    final String texto = titulo.trim();
    if (texto.isEmpty) {
      return;
    }

    final String id = DateTime.now().microsecondsSinceEpoch.toString();
    state = <Tarefa>[
      ...state,
      Tarefa(id: id, titulo: texto, concluida: false),
    ];
  }

  void alternarConcluida(String id) {
    state = state
        .map(
          (Tarefa tarefa) => tarefa.id == id
              ? tarefa.copyWith(concluida: !tarefa.concluida)
              : tarefa,
        )
        .toList(growable: false);
  }

  void remover(String id) {
    state = state.where((Tarefa t) => t.id != id).toList(growable: false);
  }
}

final StateNotifierProvider<TarefasNotifier, List<Tarefa>> tarefasProvider =
    StateNotifierProvider<TarefasNotifier, List<Tarefa>>(
  (ref) => TarefasNotifier(),
);
