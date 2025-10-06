import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/auth_provider.dart';
import '../providers/save_jobs_provider.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider); // current user
    final savedCountAsync = ref.watch(savedJobsCountProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 40,
              child: Icon(Icons.person, size: 50),
            ),
            const SizedBox(height: 20),
            Text("Name: ${user?['name'] ?? 'Unknown'}",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text("Email: ${user?['email'] ?? 'Unknown'}",
                style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            savedCountAsync.when(
              data: (count) => Text("Total Saved Jobs: $count",
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              loading: () => const CircularProgressIndicator(),
              error: (err, stack) => Text("Error: $err"),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.logout),
                label: const Text("Logout"),
                onPressed: () {
                  ref.read(authServiceProvider).logout();
                  Navigator.pushReplacementNamed(context, '/login');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
