import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvClient {
  EnvClient._();

  static final String baseUrl = dotenv.env['BASE_URL']!;
}
