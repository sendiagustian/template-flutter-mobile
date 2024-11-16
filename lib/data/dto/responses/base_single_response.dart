class BaseSingleResponse<T> {
  int? status;
  T? data;

  BaseSingleResponse({
    required this.status,
    required this.data,
  });

  factory BaseSingleResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic) fromJsonT,
  ) {
    return BaseSingleResponse(
      status: json['status'],
      data: fromJsonT(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data,
    };
  }

  @override
  String toString() {
    return '''TargetRequest: {
      'status': $status,
      'data': $data,
    }''';
  }
}
