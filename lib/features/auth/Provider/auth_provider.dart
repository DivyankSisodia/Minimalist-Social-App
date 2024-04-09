import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_media_app/features/auth/repository/auth_repository.dart';

final authProvider = Provider((ref) {
  return AuthRepository();
});
