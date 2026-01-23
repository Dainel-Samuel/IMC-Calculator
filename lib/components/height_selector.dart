import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_color.dart';
import 'package:imc_calculator/core/text_styles.dart';

class HeightSelector extends StatefulWidget {
  final double selectedHeight;
  final Function(double) onHeightChanged;

  const HeightSelector({
      super.key,
      required this.selectedHeight,
      required this.onHeightChanged
    }
  );

  @override
  State<HeightSelector> createState() => _HeightSelectorState();
}

class _HeightSelectorState extends State<HeightSelector> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundComponent,
          borderRadius: BorderRadius.circular(16)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text("ALTURA", style: TextStyles.bodyText),
              Text("${widget.selectedHeight.toStringAsFixed(0)} cm", style: TextStyles.titleText),
              Slider(
                value: widget.selectedHeight, 
                onChanged: (newHeight){
                  widget.onHeightChanged(newHeight);
              },
              min: 100,
              max: 220,
              divisions: 120,
              activeColor: AppColors.accent,
              )
            ],
          ),
        ),
      ),
    );
  }
}