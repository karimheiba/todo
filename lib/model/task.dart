import 'package:todo/database/constats.dart';

class task {
  int? id;
  final String? name;
  final String? phone;
  bool isDone;

  task({this.name, this.phone, this.isDone = false, this.id});

  Map<String, dynamic> tomap() => {
        columnId: id,
        columnName: name,
        columnPhone: phone,
      };

  factory task.fromMap(Map<String, dynamic> map) {
    return task(
      id: map[columnId],
      name: map[columnName],
      phone: map[columnPhone],
    );
  }

  void doneCange() {
    isDone = !isDone;
  }
}
