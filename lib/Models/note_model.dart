import 'package:hive/hive.dart';
part 'note_model.g.dart';

@HiveType(typeId: 1)
class NoteModel extends HiveObject{

  @HiveField(0)
final String Title;
  @HiveField(1)
final String SubTitle;
  @HiveField(2)
final String Date;

 NoteModel(
    this.Title,
    this.SubTitle,
    this.Date,
    );
}