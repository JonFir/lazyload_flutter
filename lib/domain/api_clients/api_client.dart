import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart';

import 'package:dart_lesson/domain/entity/post.dart';

class ApiClient {
  final client = HttpClient();

  Future<List<Post>> getPosts() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final request = await client.getUrl(url);
    final response = await request.close();
    final json = await response
        .transform(utf8.decoder)
        .toList()
        .then((value) => value.join())
        .then((v) => jsonDecode(v) as List<dynamic>);
    final result = json
        .map((dynamic e) => Post.fromJson(e as Map<String, dynamic>))
        .toList();
    return result;
  }

  Future<Post> createPost({required String title, required String body}) async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final parameters = <String, dynamic>{
      'title': title,
      'body': body,
      'userId': 109
    };
    final request = await client.postUrl(url);
    request.headers.add('Content-type', 'application/json; charset=UTF-8');
    request.write(jsonEncode(parameters));
    final response = await request.close();
    final string = await response
        .transform(utf8.decoder)
        .toList()
        .then((value) => value.join());
    final json = jsonDecode(string) as Map<String, dynamic>;
    final post = Post.fromJson(json);
    return post;
  }

  Future<void> fileUpload(File file) async {
    final url = Uri.parse('https://example.com');

    final request = await client.postUrl(url);

    request.headers.set(HttpHeaders.contentTypeHeader, ContentType.binary);
    request.headers.add('filename', basename(file.path));
    request.contentLength = file.lengthSync();
    final fileStream = file.openRead();
    await request.addStream(fileStream);

    final httpResponse = await request.close();

    if (httpResponse.statusCode != 200) {
      throw Exception('Error uploading file');
    } else {
      return;
    }
  }
}
