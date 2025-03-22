import 'package:aconnec_1109_x/src/model/model.abs.dart';

class NetworkModel implements Model<NetworkModel> {
  String _networkName = '';
  String _description = '';
  String _networkCode = '';

  NetworkModel({
    String networkName = '',
    String description = '',
    String networkCode = '',
  }) {
    _networkName = networkName;
    _networkCode = networkCode;
    _description = description;
  }

  String get networkName => _networkName;
  String get networkCode => _networkCode;
  String get description => _description;

  @override
  NetworkModel copyWith(Map<String, dynamic> value) {
    return NetworkModel(
      networkName: value[NetworkModelFields.networkName] ?? _networkName,
      networkCode: value[NetworkModelFields.networkCode] ?? _networkCode,
      description: value[NetworkModelFields.description] ?? _description,
    );
  }
}

class NetworkModelFields {
  NetworkModelFields._();

  static const String networkName = 'network_name';
  static const String networkCode = 'network_code';
  static const String description = 'description';
}

class NetworkModelPersistence implements ModelJson<NetworkModel> {
  @override
  List<NetworkModel> fromArrayJson(List arrJson) {
    return arrJson.map((e) => fromJson(Map<String, dynamic>.from(e))).toList();
  }

  @override
  NetworkModel fromJson(Map<String, dynamic> json) {
    return NetworkModel(
      networkName: json[NetworkModelFields.networkName] ?? '',
      networkCode: json[NetworkModelFields.networkCode] ?? '',
      description: json[NetworkModelFields.description] ?? '',
    );
  }

  @override
  Map<String, dynamic> toJson(NetworkModel json) {
    return {
      NetworkModelFields.networkName: json.networkName,
      NetworkModelFields.networkCode: json.networkCode,
      NetworkModelFields.description: json.description,
    };
  }
}
