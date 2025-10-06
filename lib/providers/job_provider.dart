import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/job_model.dart';
import '../services/api_service.dart';

final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

final jobsProvider = FutureProvider<List<Job>>((ref) async {
  final api = ref.read(apiServiceProvider);
  return api.fetchJobs();
});
