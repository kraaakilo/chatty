import 'package:chatty/data/chat.dart';
import 'package:chatty/data/sender.dart';

List<String> randomPhrases = [
  'Bonjour',
  'Comment allez-vous ?',
  'Comment s\'est passé votre journée ?',
  'Quel est votre plat préféré ?',
  'Avez-vous des projets pour ce week-end ?',
  'Quel est votre film préféré ?',
  'Aimez-vous les animaux de compagnie ?',
  'Quels sont vos centres d\'intérêt ?',
  'Quel est votre livre préféré ?',
  'Avez-vous des frères et sœurs ?',
];

List<Chat> chatsDatabase = List.generate(
  randomPhrases.length,
  (index) => Chat(
    sender: index % 2 == 0 ? Sender.user : Sender.chatty,
    content: randomPhrases[index],
  ),
);
