import 'dart:convert';

import '../models/users.dart';
import 'package:http/http.dart' as http;

abstract class IUserRepository {
  Future<UserListResponse> fetchUserList();
}

class UserRepository implements IUserRepository {

  final _host = "https://localhost:44379/api/User/";
  final Map<String, String> _headers = {
    "Accept" : "application/json",
    "content-type": "application/json",
  };
  @override
  Future<UserListResponse> fetchUserList() async{
    var getAllUsersUrl = _host + "GetAll";
    var results = await http.get(Uri.parse(getAllUsersUrl), headers: _headers);
    final jsonObject = json.decode(results.body);
    var response = UserListResponse.fromJson(jsonObject);

    return response;
  }
}