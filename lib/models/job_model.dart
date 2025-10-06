class Job {
  final int id;
  final String title;
  final String company;
  final String location;
  final String salary;

  Job({
    required this.id,
    required this.title,
    required this.company,
    required this.location,
    required this.salary,
  });

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      id: json['id'],
      title: json['title'] ?? "No Title",
      company: json['brand'] ?? "Unknown Company",
      location: json['category'] ?? "Unknown Location",
      salary: "${json['price'] ?? '0'} USD",
    );
  }
}
