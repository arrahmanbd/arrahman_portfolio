// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../../../services/api_services.dart';
import '../../../model/auto_model.dart';

typedef GitService = AsyncValue<List<GithubRepository>>;

class RepoNotifier extends StateNotifier<GitService> {
  final GitServices gitService;
  RepoNotifier(
    this.gitService,
  ) : super(AsyncValue.loading()) {
    fetchRepository();
  }

  Future<void> fetchRepository() async {
    state = AsyncValue.loading();
    try {
      final fetchData = await gitService.fetchData();
      state = AsyncValue.data(fetchData);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}

final gitViewModel = StateNotifierProvider<RepoNotifier, GitService>((ref) {
  final service = ref.watch(serviceProvider);
  return RepoNotifier(service);
});
