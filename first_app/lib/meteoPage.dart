import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class MeteoPage extends StatefulWidget {
  const MeteoPage({super.key});

  @override
  State<MeteoPage> createState() => _MeteoPageState();
}

class _MeteoPageState extends State<MeteoPage> {
  String _city = '';
  String _temperature = '';
  String _description = '';
  String _iconCode = '';

  void _updateCity(String newCity) {
    setState(() {
      _city = newCity;
    });
  }

  Future<void> _fetchWeatherData() async {
    const apiKey = 'b42f0292aada63ef6a5b1f736d943bdf'; 
    final apiUrl =
        'https://api.openweathermap.org/data/2.5/weather?q=$_city&appid=$apiKey&units=metric';

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _temperature = '${data['main']['temp']}°C';
          _description = data['weather'][0]['description'];
          _iconCode = data['weather'][0]['icon'];
        });
      } else {
        setState(() {
          _temperature = '';
          _description = 'Failed to fetch weather data';
          _iconCode = '';
        });
      }
    } catch (e) {
      setState(() {
        _temperature = '';
        _description = 'Error: $e';
        _iconCode = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter city name',
                hintText: 'e.g., Mohammadia',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: _updateCity,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _city.isNotEmpty ? _fetchWeatherData : null,
              child: const Text('Get Weather'),
            ),
            const SizedBox(height: 20),
            if (_temperature.isNotEmpty)
              Column(
                children: [
                  Text(
                    'Temperature: $_temperature',
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Description: $_description',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  Image.network(
                    'https://openweathermap.org/img/w/$_iconCode.png',
                    width: 80,
                    height: 80,
                  ),
                ],
              )
            else
              const Text('Enter a city to get weather information'),
          ],
        ),
      ),
    );
  }
}