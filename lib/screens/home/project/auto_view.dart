import 'package:arrahman_portfolio/all_imports.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'auto_state.dart';

class GitRepoWidget extends ConsumerWidget {
  const GitRepoWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cf = ref.watch(gitViewModel);
    return cf.when(
        data: (data) => ListView(
              children: [
                ...data.map((e) => ProjectCard(
                      onTap: () {},
                      name: e.name,
                      description: e.description,
                      link: e.url,
                      time: e.created,
                    ))
              ],
            ),
        error: (error, n) => Text(error.toString()),
        loading: () => const Center(child: CircularProgressIndicator()));
  }
}
