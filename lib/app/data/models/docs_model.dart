import 'package:hive/hive.dart';
part 'docs_model.g.dart';
@HiveType(typeId: 3)
class Docs {
  @HiveField(0)
  String title;
  @HiveField(1)
  String docsName;
  @HiveField(2)
  String path;

  Docs({
    required this.title,
    required this.docsName,
    required this.path,
  });
}
