import 'package:flutter/material.dart';

class OhmLowPage extends StatefulWidget {
  const OhmLowPage({super.key});

  @override
  State<OhmLowPage> createState() => _OhmLowPageState();
}

class _OhmLowPageState extends State<OhmLowPage> {
  final _tensionController = TextEditingController();
  final _resistanceController = TextEditingController();
  final _intensityController = TextEditingController();
  String? _result;

  void _calculateOhmsLaw(String type) {
    try {
      switch (type) {
        case 'tension':
          final resistance = double.parse(_resistanceController.text);
          final intensity = double.parse(_intensityController.text);
          setState(() {
            _result =
                'Tension (V) = ${(resistance * intensity).toStringAsFixed(2)} V';
            _tensionController.text = (resistance * intensity).toStringAsFixed(
              2,
            );
          });
          break;
        case 'resistance':
          final tension = double.parse(_tensionController.text);
          final intensity = double.parse(_intensityController.text);
          setState(() {
            _result =
                'Résistance (R) = ${(tension / intensity).toStringAsFixed(2)} Ω';
            _resistanceController.text = (tension / intensity).toStringAsFixed(
              2,
            );
          });
          break;
        case 'intensity':
          final tension = double.parse(_tensionController.text);
          final resistance = double.parse(_resistanceController.text);
          setState(() {
            _result =
                'Intensité (I) = ${(tension / resistance).toStringAsFixed(2)} A';
            _intensityController.text = (tension / resistance).toStringAsFixed(
              2,
            );
          });
          break;
      }
    } catch (e) {
      setState(() {
        _result = 'Erreur: Veuillez entrer des valeurs numériques valides';
      });
    }
  }

  @override
  void dispose() {
    _tensionController.dispose();
    _resistanceController.dispose();
    _intensityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Ohm')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _tensionController,
              decoration: const InputDecoration(
                labelText: 'Tension (V) en Volts',
                suffixText: 'V',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _resistanceController,
              decoration: const InputDecoration(
                labelText: 'Résistance (R) en Ohms',
                suffixText: 'Ω',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _intensityController,
              decoration: const InputDecoration(
                labelText: 'Intensité (I) en Ampères',
                suffixText: 'A',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _calculateOhmsLaw('tension'),
                  child: const Text('Calculer V'),
                ),
                ElevatedButton(
                  onPressed: () => _calculateOhmsLaw('resistance'),
                  child: const Text('Calculer R'),
                ),
                ElevatedButton(
                  onPressed: () => _calculateOhmsLaw('intensity'),
                  child: const Text('Calculer I'),
                ),
              ],
            ),
            if (_result != null) ...[
              const SizedBox(height: 24),
              Text(
                _result!,
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
            ],
            const SizedBox(height: 24),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Ohm',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text('V = R × I'),
                    Text('R = V / I'),
                    Text('I = V / R'),
                    SizedBox(height: 16),
                    Text('V = Tension en Volts (V)'),
                    Text('R = Résistance en Ohms (Ω)'),
                    Text('I = Intensité en Ampères (A)'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
