import 'package:hive/hive.dart';

part 'prem_hive_model.g.dart';

@HiveType(typeId: 5)
class Gjhkdafjlaf extends HiveObject {
  @HiveField(0)
  String secondUrl;

  @HiveField(1)
  bool isOpen;
  Gjhkdafjlaf({
    required this.secondUrl,
    required this.isOpen,
  });
}
