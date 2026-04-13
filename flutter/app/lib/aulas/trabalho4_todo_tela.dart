import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'trabalho4_todo_estado.dart';

class Trabalho4TodoPage extends ConsumerStatefulWidget {
  const Trabalho4TodoPage({super.key});

  @override
  ConsumerState<Trabalho4TodoPage> createState() => _Trabalho4TodoPageState();
}

class _Trabalho4TodoPageState extends ConsumerState<Trabalho4TodoPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _adicionar() {
    ref.read(tarefasProvider.notifier).adicionar(_controller.text);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    final List<Tarefa> tarefas = ref.watch(tarefasProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Trabalho 4 - To-Do List'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        labelText: 'Nova tarefa',
                        border: OutlineInputBorder(),
                      ),
                      onSubmitted: (_) => _adicionar(),
                    ),
                  ),
                  const SizedBox(width: 12),
                  FilledButton(
                    onPressed: _adicionar,
                    child: const Text('Adicionar'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: tarefas.isEmpty
                  ? const Center(child: Text('Nenhuma tarefa cadastrada.'))
                  : ListView.builder(
                      itemCount: tarefas.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Tarefa tarefa = tarefas[index];

                        return TarefaTile(
                          tarefa: tarefa,
                          onToggle: () => ref
                              .read(tarefasProvider.notifier)
                              .alternarConcluida(tarefa.id),
                          onRemove: () => ref
                              .read(tarefasProvider.notifier)
                              .remover(tarefa.id),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class TarefaTile extends StatelessWidget {
  final Tarefa tarefa;
  final VoidCallback onToggle;
  final VoidCallback onRemove;

  const TarefaTile({
    super.key,
    required this.tarefa,
    required this.onToggle,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle? base = Theme.of(context).textTheme.bodyLarge;
    final TextStyle? style = tarefa.concluida
        ? base?.copyWith(decoration: TextDecoration.lineThrough)
        : base;

    return ListTile(
      leading: Checkbox(
        value: tarefa.concluida,
        onChanged: (_) => onToggle(),
      ),
      title: Text(tarefa.titulo, style: style),
      trailing: IconButton(
        icon: const Icon(Icons.delete_outline),
        onPressed: onRemove,
      ),
      onTap: onToggle,
    );
  }
}
