import 'package:hive/hive.dart';

part 'recette.g.dart';

@HiveType(typeId: 0)
class Recette extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String recette;

  @HiveField(2)
  String url;

  Recette({
    required this.name,
    required this.recette,
    required this.url,
  });
}
