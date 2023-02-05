import 'package:chatty/database/ChatModel.dart';
import 'package:sqflite/sqflite.dart';

const String table = 'chats';
const String idColumn = '_id';
const String senderColumn = 'sender';
const String contentColumn = 'content';
const String dateColumn = 'date';

class ChatProvider {
  late Database database;

  Future open(String path) async {
    database = await openDatabase(
        path,
        version: 1,
        onCreate: (Database db, int version) async {
          await db.execute('''
            create table $table ( 
              $idColumn integer primary key autoincrement, 
              $senderColumn text not null,
              $contentColumn text not null,
              $dateColumn text not null,
            )
            ''');
        });
  }

  Future<ChatModel> insert(ChatModel chatModel) async {
    print(chatModel.toString());
    await Future.delayed(const Duration(seconds: 1));
    return chatModel;

    // return await database.insert(table, chatModel.toMap());
  }

  Future<int> delete(int id) async {
    return await database.delete(table, where: '$idColumn = ?', whereArgs: [id]);
  }

  // Future<int> update(ChatModel chatModel) async {
  //   return await database.update(table, chatModel.toMap(),
  //       where: '$idColumn = ?', whereArgs: [chatModel.id]);
  // }

  Future close() async => database.close();
}
