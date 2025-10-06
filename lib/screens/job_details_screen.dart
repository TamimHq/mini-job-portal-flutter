import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/job_model.dart';
import '../providers/save_jobs_provider.dart';

class JobDetailScreen extends ConsumerWidget {
  final Job job;
  const JobDetailScreen({super.key, required this.job});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final savedJobsNotifier = ref.read(savedJobsNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: Text(job.title)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(job.title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text("Company: ${job.company}", style: const TextStyle(fontSize: 18)),
            Text("Location: ${job.location}", style: const TextStyle(fontSize: 16, color: Colors.grey)),
            const SizedBox(height: 12),
            Text("Salary: ${job.salary}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  await savedJobsNotifier.saveJob({
                    "title": job.title,
                    "company": job.company,
                    "location": job.location,
                    "salary": job.salary,
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Saved ${job.title} to My Jobs")),
                  );
                },
                child: const Text("Apply & Save"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
