import 'dart:convert';
import 'package:http/http.dart' as http;

class RemoteImageDataSource {
  final http.Client client;

  RemoteImageDataSource(this.client);

  /// Fetches the JSON from the API and returns the `url` string.
  Future<String> fetchRandomImageUrl() async {
    final uri = Uri.parse('https://november7-730026606190.europe-west1.run.app/image/');
    final resp = await client.get(uri, headers: {'Accept': 'application/json'});
    if (resp.statusCode != 200) {
      throw Exception('Failed to fetch image: ${resp.statusCode}');
    }
    final decoded = json.decode(resp.body) as Map<String, dynamic>;
    final url = decoded['url'] as String?;
    if (url == null) throw Exception('Malformed response, missing url');
    return url;
  }
}
