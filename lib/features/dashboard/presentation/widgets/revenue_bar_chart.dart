import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/revenue_point.dart';

class RevenueBarChart extends StatelessWidget {
  const RevenueBarChart({super.key, required this.data});

  final List<DashboardRevenuePoint> data;

  @override
  Widget build(BuildContext context) {
    final maxY = data.fold<double>(0, (a, d) => d.total > a ? d.total : a);
    final maxScale = maxY <= 100 ? 100.0 : (maxY * 1.2).ceilToDouble();

    return AspectRatio(
      aspectRatio: 1.6,
      child: BarChart(
        BarChartData(
          maxY: maxScale,
          borderData: FlBorderData(show: false),
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            horizontalInterval: maxScale / 4,
            getDrawingHorizontalLine: (_) => FlLine(
              color: Theme.of(context).colorScheme.outlineVariant.withValues(
                    alpha: 0.4,
                  ),
              strokeWidth: 0.5,
            ),
          ),
          titlesData: FlTitlesData(
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
                interval: maxScale / 4,
                getTitlesWidget: (value, _) {
                  if (value == 0) return const SizedBox.shrink();
                  return Text(
                    value >= 1000
                        ? '${(value / 1000).toStringAsFixed(1)}k'
                        : value.toInt().toString(),
                    style: const TextStyle(fontSize: 10),
                  );
                },
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 28,
                getTitlesWidget: (value, _) {
                  final i = value.toInt();
                  if (i < 0 || i >= data.length) return const SizedBox.shrink();
                  final label = DateFormat('EEE', 'es')
                      .format(data[i].date)
                      .substring(0, 3);
                  return Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text(
                      label,
                      style: const TextStyle(fontSize: 11),
                    ),
                  );
                },
              ),
            ),
          ),
          barGroups: [
            for (var i = 0; i < data.length; i++)
              BarChartGroupData(
                x: i,
                barRods: [
                  BarChartRodData(
                    toY: data[i].total,
                    width: 18,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(6),
                    ),
                    gradient: const LinearGradient(
                      colors: [AppColors.brandPrimary, AppColors.brandAccent],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
