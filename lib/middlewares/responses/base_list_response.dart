class BaseListResponse<T> {
  int? status;
  List<T>? data;

  BaseListResponse({
    required this.status,
    required this.data,
  });

  factory BaseListResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic) fromJsonT,
  ) {
    return BaseListResponse(
      status: json['status'],
      data: List<T>.from(json['data'].map((item) => fromJsonT(item))),
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
