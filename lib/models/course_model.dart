import 'package:hive/hive.dart';

@HiveType(typeId: 2)
class Course {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String pathFR;

  @HiveField(2)
  final String pathEN;

  @HiveField(3)
  final bool isFinish;

  Course({
    required this.title,
    required this.pathFR,
    required this.pathEN,
    required this.isFinish,
  });
}

class CourseAdapter extends TypeAdapter<Course> {
  @override
  final int typeId = 2; // Identifiant unique pour Course

  @override
  Course read(BinaryReader reader) {
    return Course(
      title: reader.readString(),
      pathFR: reader.readString(),
      pathEN: reader.readString(),
      isFinish: reader.readBool(),
    );
  }

  @override
  void write(BinaryWriter writer, Course obj) {
    writer.writeString(obj.title);
    writer.writeString(obj.pathFR);
    writer.writeString(obj.pathEN);
    writer.writeBool(obj.isFinish);
  }
}
