import 'dart:convert';

List<String> categoriesModeFromJson(String str) => List<String>.from(json.decode(str).map((x) => x));

String categoriesModeToJson(List<String> data) => json.encode(List<dynamic>.from(data.map((x) => x)));