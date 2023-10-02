import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

class XFileAdapter extends TypeAdapter<XFile> {
  @override
  final typeId = 0; // Unique ID for the XFile class

  @override
  XFile read(BinaryReader reader) {
    return XFile(reader.readString());
  }

  @override
  void write(BinaryWriter writer, XFile obj) {
    writer.writeString(obj.path);
  }
}
