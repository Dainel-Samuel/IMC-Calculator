import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_color.dart';
import 'package:imc_calculator/core/text_styles.dart';

class ImcResultScreen extends StatelessWidget {
  final int weight;
  final double height;

  const ImcResultScreen({super.key, required this.weight, required this.height});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: toolbarResult(),
      body: bodyResult(context)
    );
  }

  Padding bodyResult(BuildContext context) {
    double fiexdHeight = height / 100;
    double imcResult = weight/(fiexdHeight*fiexdHeight);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text("Tu resultado es:", style: TextStyles.titleText),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 32, bottom: 32),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.backgroundComponent,
                  borderRadius: BorderRadius.circular(16)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(getTitleByImc(imcResult), 
                      style: TextStyle(
                        fontSize: 30,
                        color: getColorByImc(imcResult),
                        fontWeight: FontWeight.w600)),
                    Text(imcResult.toStringAsFixed(2), 
                      style: TextStyle(
                        fontSize: 76,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(getDescriptionByImc(imcResult), 
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                          textAlign: TextAlign.center,),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: (){
                Navigator.pop(context);
              }, 
              style: ButtonStyle(
                shape: WidgetStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
                backgroundColor: WidgetStateProperty.all(AppColors.primary)),
              child: Text("Finalizar", style: TextStyles.bodyText)),
          ),
        ],
      ),
    );
  }

  AppBar toolbarResult() {
    return AppBar(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      title: Text('Resultado IMC'),
    );
  }
  
  Color? getColorByImc(double imcResult) {
    return imcResult < 18.5 ? Colors.yellow : // Bajo peso
           imcResult < 24.9 ? Colors.green : // Normal
           imcResult < 29.9 ? Colors.orange : // Sobrepeso
          Colors.red; // Obesidad
  }
  
  String getTitleByImc(double imcResult) {
    return switch (imcResult) {
      < 18.5 => "Bajo peso",
      < 24.9 => "Normal",
      < 29.9 => "Sobrepeso",
      _ => "Obesidad",
    };
  }

  String getDescriptionByImc(double imcResult) {
    return switch (imcResult) {
      < 18.5 => "Tu peso está por debajo de lo recomendado",
      < 24.9 => "Tu peso está en el rango saludable",
      < 29.9 => "Tienes sobrepeso, cuida tu alimentación",
      _ => "Tienes obesidad, consulta a un médico",
    };
  }
}
