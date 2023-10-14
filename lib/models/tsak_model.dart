class TaskData {
  String id;
  String title;
  String description;
  int Date;
  bool isDone;

  TaskData(
      {this.id = "",
        required this.title,
        required this.description,
        required this.Date,
        this.isDone = false});

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "Date": Date,
      "isDone": isDone
    };
  }

  TaskData.fromJson(Map<String, dynamic> json)
      : this(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      Date: json["Date"],
      isDone: json["isDone"]);
}