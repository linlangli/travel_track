import 'package:travel_track/enums/transport.dart';

import 'place.dart';
import 'plan.dart';

class UsersModel {
  final String uid;
  final String name;
  final String gender;
  final String avatar;
  final bool? online;
  final List<UsersModel> friendsList;
  final int level;
  final List<Place> recentPlaces;
  final Map<Transport, int> usedTransports;
  final List<Plan> histories;
  final List<Plan> collects;

  UsersModel(
      this.friendsList,
      this.level,
      this.recentPlaces,
      this.usedTransports,
      this.histories,
      this.collects, {
        required this.uid,
        required this.name,
        this.online,
        required this.avatar,
        required this.gender,
      });

  factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
    // friendsList
    (json['friendsList'] as List<dynamic>?)
        ?.map((e) => UsersModel.fromJson(e as Map<String, dynamic>))
        .toList() ??
        [],
    // level
    json['level'] ?? 1,
    // recentPlaces
    (json['recentPlaces'] as List<dynamic>?)
        ?.map((e) => Place.fromJson(e as Map<String, dynamic>))
        .toList() ??
        [],
    // usedTransports
    (json['usedTransports'] as Map<String, dynamic>?)?.map(
          (k, v) => MapEntry(
        Transport.values.firstWhere(
              (e) => e.name == k,
          orElse: () => Transport.car,
        ),
        v as int,
      ),
    ) ??
        {},
    // histories
    (json['histories'] as List<dynamic>?)
        ?.map((e) => Plan.fromJson(e as Map<String, dynamic>))
        .toList() ??
        [],
    // collects
    (json['collects'] as List<dynamic>?)
        ?.map((e) => Plan.fromJson(e as Map<String, dynamic>))
        .toList() ??
        [],
    uid: json['uid'] ?? '',
    name: json['name'] ?? json['userName'] ?? '',
    online: json['online'],
    avatar: json['avatar'] ?? '',
    gender: json['gender'] ?? '',
  );

  Map<String, dynamic> toJson() => {
    'uid': uid,
    'name': name,
    if (online != null) 'online': online,
    'avatar': avatar,
    'gender': gender,
    'friendsList': friendsList.map((u) => u.toJson()).toList(),
    'level': level,
    'recentPlaces': recentPlaces.map((p) => p.toJson()).toList(),
    'usedTransports': usedTransports.map((k, v) => MapEntry(k.name, v)),
    'histories': histories.map((h) => h.toJson()).toList(),
    'collects': collects.map((c) => c.toJson()).toList(),
  };
}