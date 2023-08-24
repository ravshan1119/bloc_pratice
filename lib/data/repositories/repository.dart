import 'package:bloc_pratice/data/api_sevice.dart';
import 'package:bloc_pratice/data/universal_data.dart';

class UserRepository {
  final ApiService apiService;

  UserRepository({required this.apiService});

  Future<UniversalData> getAllUsers() => apiService.getData();
}
