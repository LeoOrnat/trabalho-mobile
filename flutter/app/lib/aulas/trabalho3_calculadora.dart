import 'package:flutter/material.dart';

class Trabalho3CalculadoraPage extends StatefulWidget {
  const Trabalho3CalculadoraPage({super.key});

  @override
  State<Trabalho3CalculadoraPage> createState() =>
      _Trabalho3CalculadoraPageState();
}

class _Trabalho3CalculadoraPageState extends State<Trabalho3CalculadoraPage> {
  String _display = '0';
  String _expressao = '';
  double? _primeiroValor;
  String? _operador;
  bool _limparNoProximoNumero = false;

  void _limpar() {
    setState(() {
      _display = '0';
      _expressao = '';
      _primeiroValor = null;
      _operador = null;
      _limparNoProximoNumero = false;
    });
  }

  void _digitarNumero(String valor) {
    setState(() {
      if (_limparNoProximoNumero) {
        _display = '0';
        _limparNoProximoNumero = false;
      }

      if (valor == '.') {
        if (_display.contains('.')) return;
        _display += '.';
        return;
      }

      if (_display == '0') {
        _display = valor;
      } else {
        _display += valor;
      }
    });
  }

  void _selecionarOperacao(String operador) {
    final valorAtual = double.tryParse(_display);
    if (valorAtual == null) return;

    setState(() {
      _primeiroValor = valorAtual;
      _operador = operador;
      _expressao = '${_formatarResultado(valorAtual)} $operador';
      _limparNoProximoNumero = true;
    });
  }

  void _calcular() {
    final segundoValor = double.tryParse(_display);

    if (_primeiroValor == null || _operador == null || segundoValor == null) {
      return;
    }

    double resultado;

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
            _expressao = '';
            _primeiroValor = null;
            _operador = null;
            _limparNoProximoNumero = true;
          });
          return;
        }
        resultado = _primeiroValor! / segundoValor;
        break;
      default:
        return;
    }

    setState(() {
      _expressao =
          '${_formatarResultado(_primeiroValor!)} $_operador ${_formatarResultado(segundoValor)} =';
      _display = _formatarResultado(resultado);
      _primeiroValor = null;
      _operador = null;
      _limparNoProximoNumero = true;
    });
  }

  String _formatarResultado(double valor) {
    if (valor.isNaN || valor.isInfinite) {
      return 'Erro';
    }

    if (valor == valor.toInt()) {
      return valor.toInt().toString();
    }

    return valor
        .toStringAsFixed(2)
        .replaceFirst(RegExp(r'0+$'), '')
        .replaceFirst(RegExp(r'\.$'), '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Trabalho 3 - Calculadora'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
          children: [
            CalculatorDisplay(
              expressao: _expressao,
              texto: _display,
            ),
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
  final String expressao;
  final String texto;

  const CalculatorDisplay({
    super.key,
    required this.expressao,
    required this.texto,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      color: Colors.grey[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            expressao,
            style: const TextStyle(
              fontSize: 22,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 10),
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerRight,
            child: Text(
              texto,
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ],
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
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                CalculatorButton(
                  label: 'C',
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  onPressed: onLimpar,
                ),
                CalculatorButton(
                  label: '÷',
                  backgroundColor: Colors.orange,
                  textColor: Colors.white,
                  onPressed: () => onOperacao('÷'),
                ),
                CalculatorButton(
                  label: '×',
                  backgroundColor: Colors.orange,
                  textColor: Colors.white,
                  onPressed: () => onOperacao('×'),
                ),
                CalculatorButton(
                  label: '-',
                  backgroundColor: Colors.orange,
                  textColor: Colors.white,
                  onPressed: () => onOperacao('-'),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                CalculatorButton(label: '7', onPressed: () => onNumero('7')),
                CalculatorButton(label: '8', onPressed: () => onNumero('8')),
                CalculatorButton(label: '9', onPressed: () => onNumero('9')),
                CalculatorButton(
                  label: '+',
                  backgroundColor: Colors.orange,
                  textColor: Colors.white,
                  onPressed: () => onOperacao('+'),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                CalculatorButton(label: '4', onPressed: () => onNumero('4')),
                CalculatorButton(label: '5', onPressed: () => onNumero('5')),
                CalculatorButton(label: '6', onPressed: () => onNumero('6')),
                CalculatorButton(
                  label: '=',
                  backgroundColor: Colors.blue,
                  textColor: Colors.white,
                  onPressed: onIgual,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                CalculatorButton(label: '1', onPressed: () => onNumero('1')),
                CalculatorButton(label: '2', onPressed: () => onNumero('2')),
                CalculatorButton(label: '3', onPressed: () => onNumero('3')),
                CalculatorButton(label: '.', onPressed: () => onNumero('.')),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                CalculatorButton(
                  label: '0',
                  flex: 4,
                  onPressed: () => onNumero('0'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CalculatorButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final int flex;

  const CalculatorButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.black,
    this.flex = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: SizedBox(
          height: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
              foregroundColor: textColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              elevation: 2,
            ),
            onPressed: onPressed,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
