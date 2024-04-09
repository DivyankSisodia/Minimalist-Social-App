import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/post_repository.dart';

final postProvider = Provider((ref) {
  return PostRepository();
});
