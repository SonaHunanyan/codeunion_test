class ApiError {
  ApiError({
    this.data,
    this.description,
    this.statusCode,
  });
  final int? statusCode;
  final String? description;
  final Map<String, dynamic>? data;
}
