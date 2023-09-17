import 'dart:io';

import 'package:path_provider/path_provider.dart';

void deleteHiveStorageDirectory() async {
  try {
    // Get the path to the Hive storage directory
    final appDocumentDir = await getApplicationDocumentsDirectory();
    final hiveStorageDir = Directory(appDocumentDir.path + '/userData');
    final hiveStorageDir2 = Directory(appDocumentDir.path + '/boxCourse');

    // Check if the directory exists before attempting to delete
    if (await hiveStorageDir.exists()) {
      await hiveStorageDir.delete(recursive: true);
      await hiveStorageDir2.delete(recursive: true);
      print('Hive storage directory deleted successfully.');
    } else {
      print('Hive storage directory does not exist.');
    }
  } catch (e) {
    print('Error deleting Hive storage directory: $e');
  }
}

void main() {
  // Call the function to delete the Hive storage directory
  deleteHiveStorageDirectory();
}
