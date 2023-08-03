// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GithubRepository {
  final String name;
  final String url;
  final String description;
  final String created;

  GithubRepository({
    required this.name,
    required this.url,
    required this.description,
    required this.created,
  });
}

class GitRepo extends StatefulWidget {
  @override
  _GitRepoState createState() => _GitRepoState();
}

class _GitRepoState extends State<GitRepo> {
  late Future<List<GithubRepository>> repositories;

  @override
  void initState() {
    super.initState();
    repositories = fetchRepositories();
  }

  Future<List<GithubRepository>> fetchRepositories() async {
    final response = await http.get(
      Uri.parse('https://api.github.com/users/arrahmanbd/repos'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> repositoriesData = json.decode(response.body);
      return repositoriesData.map((repo) {
        return GithubRepository(
            name: repo['name'],
            url: repo['html_url'],
            description: repo['description']??'Flutter Project',
            created: repo['created_at'],
            );
      }).toList();
    } else {
      throw Exception('Failed to load repositories');
    }
  }

  Future<String> fetchReadme(String repoUrl) async {
    final readmeResponse = await http.get(
        // Uri.parse('$repoUrl/readme'),
        Uri.parse(
            'https://api.github.com/repos/arrahmanbd/screenshot_plus_package/readme'));

    if (readmeResponse.statusCode == 200) {
      final Map<String, dynamic> readmeData = json.decode(readmeResponse.body);
      final content = readmeData['content'];
      final decodedContent = utf8.decode(base64.decode(content));
      return decodedContent;
    } else {
      throw Exception('Failed to load README');
    }
  }

  ///
  ///
  Future<String> fetchReadmee() async {
    final response = await http.get(Uri.parse(
        'https://api.github.com/repos/arrahmanbd/screenshot_plus_package/readme')); // Replace with actual owner and repo
    if (response.statusCode == 200) {
      final Map<String, dynamic> readmeData = json.decode(response.body);
      final String content = readmeData['content'];

      // final decodedContent = utf8.decode(base64.decode(content));
      // print('dfgchvjb');
      return content;
    } else {
      throw Exception('Failed to load README');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GitHub Repositories',
      home: Scaffold(
        appBar: AppBar(
          title: Text('GitHub Repositories'),
        ),
        body: FutureBuilder<List<GithubRepository>>(
          future: repositories,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No repositories available.'));
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final repo = snapshot.data![index];
                  return ListTile(
                    title: Text(repo.name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(repo.description),
                        Text(repo.url),
                      ],
                    ),
                    trailing: Text(repo.created.substring(0,10)),
                    onTap: () {
                      fetchReadmee().then((readmeContents) {
                        showDialog(
                          context: context,
                          builder: (context) {
                          
                            return AlertDialog(
                              title: Text('README for ${repo.name}'),
                              content: SingleChildScrollView(
                                child: Text(repo.description),
                              ),
                            );
                          },
                        );
                      }).catchError((error) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Error'),
                              content: Text('Failed to fetch README.'),
                            );
                          },
                        );
                      });
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
