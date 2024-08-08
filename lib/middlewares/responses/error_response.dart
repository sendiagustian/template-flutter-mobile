class ErrorResponse {
  final String? status;
  final String? errors;
  const ErrorResponse({this.status, this.errors});

  Map<String, Object?> toJson() {
    return {'status': status, 'errors': errors};
  }

  static ErrorResponse fromJson(Map<String, Object?> json) {
    return ErrorResponse(
      status: json['status'] == null ? null : json['status'] as String,
      errors: json['errors'] == null ? null : json['errors'] as String,
    );
  }

  @override
  String toString() {
    return '''ErrorResponse(
      status:$status,
      errors:$errors
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is ErrorResponse &&
        other.runtimeType == runtimeType &&
        other.status == status &&
        other.errors == errors;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, status, errors);
  }
}
