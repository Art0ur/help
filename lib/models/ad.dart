import 'package:help/models/user.dart';

enum AdStatus { PENDING, ACTIVE, SOLD, DELETED }

class Ad {
  //Ad();

  String? id;
  List? images;
  String title = '';
  String description = '';
  late num price;
  bool hidePhone = false;

  AdStatus status = AdStatus.PENDING;
  late DateTime created;

  User? user;

  int? views;
}
