import 'package:flutter/material.dart';

class Trabalho3CalculadoraPage extends StatefulWidget {
  const Trabalho3CalculadoraPage({super.key});

  @override
  State<Trabalho3CalculadoraPage> createState() =>
      _Trabalho3CalculadoraPageState();
}

class _Trabalho3CalculadoraPageState extends State<Trabalho3CalculadoraPage> {
  String _display = '0';
  String? _operador;
  double? _primeiroValor;
  bool _limparDisplayNoProximoNumero = false;

  void _limpar() {
    setState(() {
      _display = '0';
      _operador = null;
      _primeiroValor = null;
      _limparDisplayNoProximoNumero = false;
    });
  }

  void _digitarNumero(String valor) {
    setState(() {
      if (_limparDisplayNoProximoNumero) {
        _display = '0';
        _limparDisplayNoProximoNumero = false;
      }

      if (valor == '.') {
        if (_display.contains('.')) {
          return;
        }
        _display = '$_display.';
        return;
      }

      if (_display == '0') {
        _display = valor;
        return;
      }

      _display += valor;
    });
  }

  void _selecionarOperacao(String operador) {
    final double? valorAtual = double.tryParse(_display);
    if (valorAtual == null) {
      return;
    }

    setState(() {
      _primeiroValor = valorAtual;
      _operador = operador;
      _limparDisplayNoProximoNumero = true;
    });
  }

  void _calcular() {
    final double? segundoValor = double.tryParse(_display);
    if (_primeiroValor == null || _operador == null || segundoValor == null) {
      return;
    }

    final double resultado;

    switch (_operador) {
      case '+':
        resultado = _primeiroValor! + segundoValor;
        break;
      case '-':
        resultado = _primeiroValor! - segundoValor;
        break;
      case '×':
        resultado = _primeiroValor! * segundoValor;
        break;
      case '÷':
        if (segundoValor == 0) {
          setState(() {
            _display = 'Erro';
            _operador = null;
            _primeiroValor = null;
            _limparDisplayNoProximoNumero = true;
          });
          return;
        }
        resultado = _primeiroValor! / segundoValor;
        break;
      default:
        return;
    }

    setState(() {
      _display = _formatarResultado(resultado);
      _primeiroValor = null;
      _operador = null;
      _limparDisplayNoProximoNumero = true;
    });
  }

  String _formatarResultado(double valor) {
    if (valor.isInfinite || valor.isNaN) {
      return 'Erro';
    }

    final String raw = valor.toStringAsPrecision(12);
    if (!raw.contains('.')) {
      return raw;
    }

    final String semZeros = raw.replaceFirst(RegExp(r'\.?0+$'), '');
    return semZeros;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trabalho 3 - Calculadora'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            CalculatorDisplay(texto: _display),
            Expanded(
              child: CalculatorKeypad(
                onNumero: _digitarNumero,
                onOperacao: _selecionarOperacao,
                onLimpar: _limpar,
                onIgual: _calcular,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CalculatorDisplay extends StatelessWidget {
  final String texto;

  const CalculatorDisplay({super.key, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      alignment: Alignment.centerRight,
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.centerRight,
        child: Text(
          texto,
          style: const TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class CalculatorKeypad extends StatelessWidget {
  final void Function(String) onNumero;
  final void Function(String) onOperacao;
  final VoidCallback onLimpar;
  final VoidCallback onIgual;

  const CalculatorKeypad({
    super.key,
    required this.onNumero,
    required this.onOperacao,
    required this.onLimpar,
    required this.onIgual,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _row(
          [
            CalculatorButton(
              label: 'C',
              backgroundColor: Theme.of(context).colorScheme.errorContainer,
              onPressed: onLimpar,
            ),
            CalculatorButton(
              label: '÷',
              backgroundColor:
                  Theme.of(context).colorScheme.secondaryContainer,
              onPressed: () => onOperacao('÷'),
            ),
            CalculatorButton(
              label: '×',
              backgroundColor:
                  Theme.of(context).colorScheme.secondaryContainer,
              onPressed: () => onOperacao('×'),
            ),
            CalculatorButton(
              label: '-',
              backgroundColor:
                  Theme.of(context).colorScheme.secondaryContainer,
              onPressed: () => onOperacao('-'),
            ),
          ],
        ),
        _row(
          [
            CalculatorButton(label: '7', onPressed: () => onNumero('7')),
            CalculatorButton(label: '8', onPressed: () => onNumero('8')),
            CalculatorButton(label: '9', onPressed: () => onNumero('9')),
            CalculatorButton(
              label: '+',
              backgroundColor:
                  Theme.of(context).colorScheme.secondaryContainer,
              onPressed: () => onOperacao('+'),
            ),
          ],
        ),
        _row(
          [
            CalculatorButton(label: '4', onPressed: () => onNumero('4')),
            CalculatorButton(label: '5', onPressed: () => onNumero('5')),
            CalculatorButton(label: '6', onPressed: () => onNumero('6')),
            CalculatorButton(
              label: '=',
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              onPressed: onIgual,
            ),
          ],
        ),
        Expanded(
          child: _row(
            [
              CalculatorButton(
                label: '1',
                onPressed: () => onNumero('1'),
              ),
              CalculatorButton(
                label: '2',
                onPressed: () => onNumero('2'),
              ),
              CalculatorButton(
                label: '3',
                onPressed: () => onNumero('3'),
              ),
              CalculatorButton(
                label: '0',
                flex: 2,
                onPressed: () => onNumero('0'),
              ),
              CalculatorButton(
                label: '.',
                onPressed: () => onNumero('.'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _row(List<CalculatorButton> buttons) {
    return Expanded(
      child: Row(
        children: [
          for (final button in buttons) Expanded(flex: button.flex, child: button),
        ],
      ),
    );
  }
}

class CalculatorButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final int flex;

  const CalculatorButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.backgroundColor,
    this.flex = 1,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color bg = backgroundColor ?? colorScheme.surface;

    return Padding(
      padding: const EdgeInsets.all(6),
      child: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: bg,
          foregroundColor: colorScheme.onSurface,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
