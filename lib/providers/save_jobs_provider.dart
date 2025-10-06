import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/db_helper.dart';

// DB helper provider
final dbProvider = Provider<DBHelper>((ref) => DBHelper());

// Saved jobs list provider
final savedJobsProvider = FutureProvider<List<Map<String, dynamic>>>((ref) async {
  final db = ref.read(dbProvider);
  return db.getSavedJobs();
});

// Saved jobs count provider
final savedJobsCountProvider = FutureProvider<int>((ref) async {
  final db = ref.read(dbProvider);
  final jobs = await db.getSavedJobs();
  return jobs.length;
});

// Notifier for managing saved jobs
final savedJobsNotifierProvider = Provider<SavedJobsNotifier>((ref) {
  final db = ref.read(dbProvider);
  return SavedJobsNotifier(db, ref);
});

class SavedJobsNotifier {
  final DBHelper db;
  final Ref ref;
  SavedJobsNotifier(this.db, this.ref);

  // Save job and refresh providers
  Future<void> saveJob(Map<String, dynamic> job) async {
    await db.insertJob(job);
    ref.invalidate(savedJobsProvider);       // refresh saved jobs list
    ref.invalidate(savedJobsCountProvider);  // refresh saved jobs count
  }

  // Delete job and refresh providers
  Future<void> deleteJob(int id) async {
    await db.deleteJob(id);
    ref.invalidate(savedJobsProvider);       // refresh saved jobs list
    ref.invalidate(savedJobsCountProvider);  // refresh saved jobs count
  }
}
