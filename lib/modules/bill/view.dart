import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'controller.dart';
import 'package:travel_track/widgets/page.dart';
import 'package:travel_track/widgets/title_bar.dart';

class BillPage extends GetView<BillController> {
  BillPage({super.key});

  final TextEditingController jsonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (jsonController.text.isEmpty) {
      jsonController.text = controller.exampleJson();
    }
    return PageWidget(
      title: TitleBar(
        onSetting: () {},
        onMessage: () {},
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Expanded(
        child: GetBuilder<BillController>(
          init: controller,
          builder: (_) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInput(context),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _summaryCard(context),
                        const SizedBox(height: 16),
                        _lineChartCard(context),
                        const SizedBox(height: 16),
                        _pieChartCard(context),
                        const SizedBox(height: 16),
                        _heatmapCard(context),
                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildInput(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: _alpha(Theme.of(context).colorScheme.primaryContainer, .5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('JSON 数据', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          TextField(
            controller: jsonController,
            maxLines: 6,
            style: const TextStyle(fontSize: 12),
            decoration: const InputDecoration(
              isDense: true,
              border: OutlineInputBorder(),
              hintText: '输入账单 JSON 数组 (date, amount, type, note)',
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              FilledButton(
                onPressed: () {
                  try {
                    controller.loadFromJsonString(jsonController.text);
                  } catch (e) {
                    Get.snackbar('错误', '解析失败: $e');
                  }
                },
                child: const Text('解析 & 刷新'),
              ),
              const SizedBox(width: 12),
              OutlinedButton(
                onPressed: () {
                  jsonController.text = controller.exampleJson();
                },
                child: const Text('示例'),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _summaryCard(BuildContext context) {
    return _sectionCard(
      context,
      title: '总览',
      child: Wrap(
        spacing: 24,
        runSpacing: 8,
        children: [
          _metric(context, '记录数', controller.records.length.toString()),
          _metric(context, '总金额', controller.totalAmount.toStringAsFixed(2)),
          _metric(context, '分类数', controller.amountByType.length.toString()),
          _metric(
            context,
            '最高日额',
            controller.amountByDay.isEmpty
                ? '-'
                : controller.amountByDay.values.reduce(max).toStringAsFixed(2),
          ),
        ],
      ),
    );
  }

  Widget _metric(BuildContext context, String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(label, style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(height: 4),
        Text(value, style: Theme.of(context).textTheme.titleMedium),
      ],
    );
  }

  Widget _lineChartCard(BuildContext context) {
    final days = controller.sortedDays;
    final spots = [
      for (int i = 0; i < days.length; i++)
        FlSpot(i.toDouble(), controller.amountByDay[days[i]] ?? 0),
    ];
    return _sectionCard(
      context,
      title: '日支出折线',
      child: SizedBox(
        height: 220,
        child: spots.isEmpty
            ? const Center(child: Text('无数据'))
            : LineChart(
                LineChartData(
                  minY: 0,
                  lineBarsData: [
                    LineChartBarData(
                      isCurved: true,
                      color: Theme.of(context).colorScheme.primary,
                      barWidth: 3,
                      dotData: const FlDotData(show: false),
                      spots: spots,
                      belowBarData: BarAreaData(
                        show: true,
                        color: _alpha(Theme.of(context).colorScheme.primary, .15),
                      ),
                    ),
                  ],
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: (spots.length / 6).clamp(1, 10).toDouble(),
                        getTitlesWidget: (value, meta) {
                          int idx = value.toInt();
                          if (idx < 0 || idx >= days.length) return const SizedBox();
                          final d = days[idx];
                          return Text(DateFormat('MM/dd').format(d), style: const TextStyle(fontSize: 10));
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        getTitlesWidget: (value, meta) => Text(value.toStringAsFixed(0), style: const TextStyle(fontSize: 10)),
                      ),
                    ),
                    topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                  gridData: const FlGridData(show: true, drawVerticalLine: false),
                  borderData: FlBorderData(show: false),
                ),
              ),
      ),
    );
  }

  Widget _pieChartCard(BuildContext context) {
    final data = controller.amountByType;
    final total = data.values.fold<double>(0, (p, e) => p + e);
    final colors = _randomColors(data.length, Theme.of(context).colorScheme.primary);
    int i = 0;
    return _sectionCard(
      context,
      title: '分类占比',
      child: data.isEmpty
          ? const SizedBox(height: 160, child: Center(child: Text('无数据')))
          : Column(
              children: [
                SizedBox(
                  height: 220,
                  child: PieChart(
                    PieChartData(
                      sectionsSpace: 2,
                      centerSpaceRadius: 40,
                      sections: data.entries.map((e) {
                        final percent = total == 0 ? 0 : e.value / total;
                        final section = PieChartSectionData(
                          color: colors[i++],
                          value: e.value,
                          title: '${(percent * 100).toStringAsFixed(1)}%',
                          radius: 80,
                          titleStyle: const TextStyle(fontSize: 11, color: Colors.white),
                        );
                        return section;
                      }).toList(),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 12,
                  runSpacing: 8,
                  children: [
                    for (int j = 0; j < data.length; j++)
                      _legendItem(
                        context,
                        label: data.keys.elementAt(j),
                        value: data.values.elementAt(j).toStringAsFixed(2),
                        color: colors[j],
                      ),
                  ],
                ),
              ],
            ),
    );
  }

  List<Color> _randomColors(int count, Color seed) {
    final rnd = Random(seed.hashCode);
    return List.generate(count, (i) {
      final h = rnd.nextDouble();
      return HSLColor.fromAHSL(1, h * 360, .55, .55).toColor();
    });
  }

  Widget _legendItem(BuildContext context, {required String label, required String value, required Color color}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(width: 12, height: 12, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(2))),
        const SizedBox(width: 4),
        Text('$label $value', style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }

  Widget _heatmapCard(BuildContext context) {
    // 最近 90 天
    final now = DateTime.now();
    final start = now.subtract(const Duration(days: 89));
    final byDay = controller.amountByDay;
    final maxVal = byDay.isEmpty ? 1.0 : byDay.values.reduce(max).toDouble();
    final days = List.generate(90, (i) => DateTime(start.year, start.month, start.day + i));

    // 按周列 (类似 GitHub) -> 以周为列，周日开始
    List<List<DateTime?>> columns = [];
    List<DateTime?> current = [];
    int weekdayOffset = days.first.weekday % 7; // 周日=0
    for (int i = 0; i < weekdayOffset; i++) {
      current.add(null);
    }
    for (final d in days) {
      if (current.length == 7) {
        columns.add(current);
        current = [];
      }
      current.add(d);
    }
    if (current.isNotEmpty) {
      while (current.length < 7) {
        current.add(null);
      }
      columns.add(current);
    }

    return _sectionCard(
      context,
      title: '最近90天热力图',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 120,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: const [
                    SizedBox(height: 6),
                    _WeekLabel('日'),
                    _WeekLabel('一'),
                    _WeekLabel('二'),
                    _WeekLabel('三'),
                    _WeekLabel('四'),
                    _WeekLabel('五'),
                    _WeekLabel('六'),
                  ],
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: columns.length,
                    itemBuilder: (c, col) {
                      return Column(
                        children: [
                          for (int row = 0; row < 7; row++)
                            _heatCell(context, columns[col][row], byDay, maxVal),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Text('低', style: TextStyle(fontSize: 10)),
              const SizedBox(width: 4),
              for (int i = 0; i < 5; i++)
                Container(
                  width: 14,
                  height: 14,
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                    color: _heatColor(Theme.of(context).colorScheme.primary, (i + 1) / 5),
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              const SizedBox(width: 4),
              const Text('高', style: TextStyle(fontSize: 10)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _heatCell(BuildContext context, DateTime? date, Map<DateTime, double> byDay, double maxVal) {
    if (date == null) {
      return const SizedBox(width: 16, height: 16);
    }
    final key = DateTime(date.year, date.month, date.day);
    final v = byDay[key] ?? 0;
    final intensity = maxVal == 0 ? 0.0 : (v / maxVal);
    final color = v == 0 ? _alpha(Theme.of(context).colorScheme.surfaceContainerHighest, .3)
        : _heatColor(Theme.of(context).colorScheme.primary, intensity.toDouble());
    return Tooltip(
      message: DateFormat('MM/dd').format(date) + (v > 0 ? '  ¥${v.toStringAsFixed(2)}' : '  无'),
      child: Container(
        width: 16,
        height: 16,
        margin: const EdgeInsets.all(1.5),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(3),
        ),
      ),
    );
  }

  static Color _heatColor(Color base, double t) {
    t = t.clamp(0, 1);
    final hsl = HSLColor.fromColor(base);
    final lightness = (0.90 - t * 0.55); // 亮度梯度
    return hsl.withLightness(lightness).toColor();
  }

  static Color _alpha(Color c, double opacity) => c.withAlpha((255 * opacity.clamp(0, 1)).round());

  Widget _sectionCard(BuildContext context, {required String title, required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(title, style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(width: 8),
            ],
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}

class _WeekLabel extends StatelessWidget {
  final String text;
  const _WeekLabel(this.text);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 18,
      height: 16,
      child: Center(
        child: Text(text, style: const TextStyle(fontSize: 10)),
      ),
    );
  }
}
