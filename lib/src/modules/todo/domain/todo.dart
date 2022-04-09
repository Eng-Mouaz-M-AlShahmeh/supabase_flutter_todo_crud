// Developed by: Eng Mouaz M Shahmeh
class TodoModel {
  int? id;
  String? task;
  bool? status;

  TodoModel({
    this.id,
    this.task,
    this.status,
  });

  TodoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    task = json['task'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['task'] = task;
    data['status'] = status;
    return data;
  }
}