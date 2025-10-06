import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/job_model.dart';

class ApiService {
  final String baseUrl = "https://dummyjson.com";

  Future<List<Job>> fetchJobs() async {
    final response = await http.get(Uri.parse("$baseUrl/products"));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List jobs = data['products'];
      return jobs.map((e) => Job.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load jobs");
    }
  }
}
