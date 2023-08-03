import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:http/http.dart' as http;
import '../model/auto_model.dart';

class GitServices {
  Future<List<GithubRepository>> fetchData() async {
    final response = await http.get(
      Uri.parse('https://api.github.com/users/arrahmanbd/repos'),
    );
    if (response.statusCode == 200) {
      final List<dynamic> repositoriesData = json.decode(response.body);
      return  repositoriesData.map((repo) {
        return GithubRepository.fromMap(repo);
      }).toList();
    }
    throw Exception('Failed to load repositories');
  }
}

final serviceProvider = Provider<GitServices>((ref) {
  return GitServices();
});