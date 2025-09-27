import 'dart:convert';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BillRecord {
  final DateTime date;
  final double amount; // 支出为正
  final String type;
  final String note;
  BillRecord({required this.date, required this.amount, required this.type, required this.note});
}

class BillController extends GetxController {
  final records = <BillRecord>[];
  final _dateFormat = DateFormat('yyyy-MM-dd');

  DateTime? selectedHeatDate; // 新增：热力图当前选中日期（去除时分秒）

  double get totalAmount => records.fold(0, (p, e) => p + e.amount);

  Map<String, double> get amountByType {
    final map = <String, double>{};
    for (final r in records) {
      map.update(r.type, (v) => v + r.amount, ifAbsent: () => r.amount);
    }
    return map;
  }

  Map<DateTime, double> get amountByDay {
    final map = <DateTime, double>{};
    for (final r in records) {
      final key = DateTime(r.date.year, r.date.month, r.date.day);
      map.update(key, (v) => v + r.amount, ifAbsent: () => r.amount);
    }
    return map;
  }

  List<DateTime> get sortedDays => amountByDay.keys.toList()..sort();

  void selectHeatDate(DateTime day) {
    final normalized = DateTime(day.year, day.month, day.day);
    if (selectedHeatDate == normalized) {
      selectedHeatDate = null; // 再次点击取消
    } else {
      selectedHeatDate = normalized;
    }
    update();
  }

  List<BillRecord> recordsOf(DateTime day) {
    final n = DateTime(day.year, day.month, day.day);
    return records.where((r) => r.date.year == n.year && r.date.month == n.month && r.date.day == n.day).toList();
  }

  void loadFromJsonString(String jsonStr) {
    try {
      final parsed = json.decode(jsonStr);
      if (parsed is List) {
        records.clear();
        for (final item in parsed) {
          if (item is Map) {
            final dateStr = (item['date'] ?? '').toString();
            DateTime? date;
            try { date = DateTime.parse(dateStr); } catch (_) {}
            if (date == null) continue;
            final amount = double.tryParse(item['amount'].toString()) ?? 0;
            final type = (item['type'] ?? '其他').toString();
            final note = (item['note'] ?? '').toString();
            records.add(BillRecord(date: date, amount: amount, type: type, note: note));
          }
        }
        // 清除已不在范围的选中
        if (selectedHeatDate != null && recordsOf(selectedHeatDate!).isEmpty) {
            selectedHeatDate = null;
        }
        update();
      }
    } catch (e) {
      rethrow;
    }
  }

  String exampleJson() {
    final today = DateTime.now();
    final list = List.generate(20, (i) {
      final d = today.subtract(Duration(days: i));
      return {
        'date': _dateFormat.format(d),
        'amount': (10 + i * 3) % 47 + 5,
        'type': ['餐饮', '交通', '住宿', '门票', '杂项'][i % 5],
        'note': '示例记录 $i'
      };
    });
    return const JsonEncoder.withIndent('  ').convert(list);
  }
}
