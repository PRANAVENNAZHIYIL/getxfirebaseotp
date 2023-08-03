import 'package:hive/hive.dart';

part 'hivedtabse.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  String name;

  User(this.name);
}
