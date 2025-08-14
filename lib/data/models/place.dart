class Place {
  final String id;
  final String name;
  final String date;
  final double expense;
  final String? hotel;

  Place({
    required this.id,
    required this.name,
    required this.date,
    required this.expense,
    this.hotel,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      id: json['id'],
      name: json['name'],
      date: json['date'],
      hotel: json['hotel'],
      expense: (json['expense'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'date': date,
    'expense': expense,
    'hotel': hotel,
  };
}
