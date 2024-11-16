class LoginRequest {
  final String username;
  final String password;
  final String version;
  final String device;
  final String osDevice;
  final String ip;
  final String serial;

  const LoginRequest({
    required this.username,
    required this.password,
    required this.version,
    required this.device,
    required this.osDevice,
    required this.ip,
    required this.serial,
  });

  LoginRequest copyWith({
    String? username,
    String? password,
    String? version,
    String? device,
    String? osDevice,
    String? ip,
    String? serial,
  }) {
    return LoginRequest(
      username: username ?? this.username,
      password: password ?? this.password,
      version: version ?? this.version,
      device: device ?? this.device,
      osDevice: osDevice ?? this.osDevice,
      ip: ip ?? this.ip,
      serial: serial ?? this.serial,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'username': username,
      'password': password,
      'version': version,
      'device': device,
      'os_device': osDevice,
      'ip': ip,
      'serial': serial
    };
  }

  static LoginRequest fromJson(Map<String, Object?> json) {
    return LoginRequest(
      username: json['username'] as String,
      password: json['password'] as String,
      version: json['version'] as String,
      device: json['device'] as String,
      osDevice: json['os_device'] as String,
      ip: json['ip'] as String,
      serial: json['serial'] as String,
    );
  }

  @override
  String toString() {
    return '''LoginRequest(
      username:$username,
      password:$password,
      version:$version,
      device:$device,
      osDevice:$osDevice,
      ip:$ip,
      serial:$serial
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is LoginRequest &&
        other.runtimeType == runtimeType &&
        other.username == username &&
        other.password == password &&
        other.version == version &&
        other.device == device &&
        other.osDevice == osDevice &&
        other.ip == ip &&
        other.serial == serial;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, username, password, version, device, osDevice, ip, serial);
  }
}
