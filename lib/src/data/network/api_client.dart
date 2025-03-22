import 'package:aconnec_1109_x/src/data/network/dio_client.dart';

class ApiClient {
  ApiClient(this.dioClient, {this.baseUrl});

  final DioClient dioClient;
  String? baseUrl;
}
