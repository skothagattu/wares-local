import 'package:wares/models/users.dart';
import 'package:wares/repositories/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
final userRepositoryProvider = Provider<IUserRepository>((ref) => UserRepository());

final userList = FutureProvider.autoDispose<UserListResponse>((ref) async{
  final repository = ref.watch(userRepositoryProvider);
  return repository.fetchUserList();
});
