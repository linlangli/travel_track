class Plan {
  final String travelId;
  final String place;
  final String hotel;
  final String expense;

  Plan({
    required this.travelId,
    required this.place,
    required this.hotel,
    required this.expense,
  });

  factory Plan.fromJson(Map<String, dynamic> json) => Plan(
    travelId: json['travelId'] ?? json['travelId'],
    place: json['place'] ?? json['place'],
    hotel: json['hotel'],
    expense: json['expense'],
  );

  Map<String, dynamic> toJson() => {
    'travelId': travelId,
    'place': place,
    'hotel': hotel,
    'expense': expense,
  };
}
