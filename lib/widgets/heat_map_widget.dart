import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

class HeatMapWidget extends StatelessWidget {
  const HeatMapWidget({super.key, required this.startingDate, required this.datasets});
  final DateTime startingDate ;
  final Map<DateTime,int> datasets;

  @override
  Widget build(BuildContext context) {
    return HeatMap(
      datasets: datasets,
      endDate: DateTime.now(),
      startDate: startingDate ,
      colorMode: ColorMode.color,
      defaultColor: Theme.of(context).colorScheme.secondary,
      textColor: Colors.white,
      size: 30,
      showText: true,
      scrollable: true,
      showColorTip: false,
      colorsets:{
        1:Colors.green.shade200,
        2:Colors.green.shade300,
        3:Colors.green.shade400,
        4:Colors.green.shade500,
        5:Colors.green.shade600,
      } ,
    );
  }
}