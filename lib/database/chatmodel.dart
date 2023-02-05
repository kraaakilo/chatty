class ChatModel {
  late int id;
  late String content;
  late String sender;
  late String date;

  ChatModel(this.id, this.content, this.sender, this.date);

  ChatModel.fromMap(Map<String, Object?> map) {
    id = map["id"] as int;
    content = map["content"] as String;
    sender = map["sender"] as String;
    date = map["date"] as String;
  }

  Map<String, Object?> toMap() {
    return <String, Object?>{
      "id": id,
      "content": content,
      "sender": sender,
      "date": date,
    };
  }
}