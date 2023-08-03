

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

  factory GithubRepository.fromMap(Map<String, dynamic> map) {
    return GithubRepository(
      name: map['name'],
      url: map['html_url'],
      description: map['description'] ?? 'Flutter Project',
      created: map['created_at'],
    );
  }
}
