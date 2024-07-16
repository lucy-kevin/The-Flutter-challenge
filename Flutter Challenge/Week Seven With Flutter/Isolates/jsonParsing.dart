
import 'dart:io';
import 'dart:isolate';
import 'dart:convert';


void main(List<String> args) async{
  final rp = ReceivePort();
  Isolate.spawn(_parseJsonIsolatesEntry, rp.sendPort);
  final todos = rp.takeWhile((element) => element is Iterable<Todo>)
  .cast<Iterable<Todo>>()
  .take(1);
  await for (final todos in todos){
    
      print(todos);
    
  
  }

  
}
void _parseJsonIsolatesEntry(SendPort sp)async{
  final client = HttpClient();
  final url = Uri.parse("https://jsonplaceholder.typicode.com/todos");

 final todos = await client.getUrl(url)
  .then((reg) => reg.close())
  .then((response) => response.transform(utf8.decoder).join())
  .then((value) => jsonDecode(value)as List<dynamic>)
  .then((json)=> json.map((map) =>Todo.fromJson(map) ));
sp.send(todos);
}

class Todo{
  final int userId;
  final int id;
  final String title;
  final bool completed;

@override
String toString() => "userId: $userId, id: $id, title: $title, completed: $completed";
  Todo({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed
  });

  Todo.fromJson(Map<String, dynamic> json):
    
      userId= json['userId'],
      id= json['id'],
      title= json['title'],
      completed= json['completed'];
  
  }

