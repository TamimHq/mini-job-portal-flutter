import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/save_jobs_provider.dart';

class SavedJobsScreen extends ConsumerWidget {
  const SavedJobsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final savedJobsAsync = ref.watch(savedJobsProvider);
    final savedJobsNotifier = ref.read(savedJobsNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Saved Jobs")),
      body: savedJobsAsync.when(
        data: (jobs) {
          if (jobs.isEmpty) {
            return const Center(
              child: Text("No saved jobs yet."),
            );
          }
          return ListView.builder(
            itemCount: jobs.length,
            itemBuilder: (context, index) {
              final job = jobs[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: ListTile(
                  title: Text(job['title']),
                  subtitle: Text("${job['company']} • ${job['location']}"),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () async {
                      await savedJobsNotifier.deleteJob(job['id']); // delete from DB
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Deleted ${job['title']}")),
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text("Error: $err")),
      ),
    );
  }
}
