import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nasa_files/models/photo_response.dart';

class NasaService {
  String _baseUrl = 'api.nasa.gov';
  String _apiKey = '';
  String _feedType = 'json';
  String _ver = '1.0';

  NasaService() {
    getPhotoDay();
  }

  Future<PhotoResponse> getPhotoDay() async {
    var url = Uri.https(_baseUrl, '/planetary/apod', {
      'api_key': _apiKey,
    });

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return PhotoResponse.fromRawJson(response.body);
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return PhotoResponse.fromRawJson(response.body);
    }
  }
}
