import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class User {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String surname;

  @HiveField(2)
  final String country;

  @HiveField(3)
  int myProgression = 0;

  @HiveField(4)
  bool isCompleted = false;

  User({
    required this.name,
    required this.surname,
    required this.country,
    this.myProgression = 0,
    this.isCompleted = false,
  });
}

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 1; // Identifiant unique pour User

  @override
  User read(BinaryReader reader) {
    return User(
      name: reader.readString(),
      surname: reader.readString(),
      country: reader.readString(),
      myProgression: reader.readInt(),
      isCompleted: reader.readBool(),
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer.writeString(obj.name);
    writer.writeString(obj.surname);
    writer.writeString(obj.country);
    writer.writeInt(obj.myProgression);
    writer.writeBool(obj.isCompleted);
  }
}
