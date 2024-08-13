// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:todo_app/models/task.dart';
import 'package:http/http.dart' as http;

class ApiHandler {
  final String baseUri = "https://192.168.0.194/api/tasks";

  // Method to get data from database.
  Future<List<Task>> getTaskData() async {
    List<Task> data = [];
    final uri = Uri.parse(baseUri);

    try {
      // storing api response:
      final response = await http.get(
        uri,
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8'
        },
      );

      if (response.statusCode >= 200 && response.statusCode <= 299) {
        print("response status => ${response.statusCode}");
        final List<dynamic> jsonData = json.decode(response.body);

        // converting json data into Task model object
        data = jsonData.map((json) => Task.fromJson(json)).toList();
      }
    } catch (e) {
      print("Exception occured: $e");
      return data;
    }

    return data;
  }

  // Method to update data in database.
  Future<http.Response> updateTask({
    required int taskId,
    required Task task,
  }) async {
    final uri = Uri.parse("$baseUri/$taskId");
    late http.Response response;
    try {
      response = await http.put(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=utf-8'
        },
        body: json.encode(task),
      );
    } catch (e) {
      return response;
    }

    return response;
  }

  // Method to add data in database.
  Future<http.Response> addTask({required Task task}) async {
    final uri = Uri.parse(baseUri);
    late http.Response response;

    try {
      response = await http.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=utf-8',
        },
        body: json.encode(task),
      );
    } catch (e) {
      return response;
    }
    return response;
  }

  // Method to delete data from database.
  Future<http.Response> deleteTask({required int taskId}) async {
    final uri = Uri.parse("$baseUri/$taskId");
    late http.Response response;

    try {
      response = await http.delete(uri, headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      });
    } catch (e) {
      return response;
    }

    return response;
  }

  // Method to get data from database with primary key.
  Future<Task> getUserById({required int userId}) async {
    final uri = Uri.parse("$baseUri/$userId");
    Task? task;
    try {
      final response = await http.get(
        uri,
        headers: <String, String>{
          // 'Content-type': 'application/json; charset=UTF-8',
          'Content-Type': 'application/json; charset=utf-8',
        },
      );
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        task = Task.fromJson(jsonData);
      }
    } catch (e) {
      return task!;
    }
    return task!;
  }
}
