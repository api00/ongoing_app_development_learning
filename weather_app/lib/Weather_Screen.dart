import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weather_app/Hourly_forecast_item.dart';
import 'package:http/http.dart' as http;


// ignore: camel_case_types
class Weather_Screen extends StatefulWidget {
  const Weather_Screen({super.key});

  @override
  State<Weather_Screen> createState() => _Weather_ScreenState();
}

// ignore: camel_case_types
class _Weather_ScreenState extends State<Weather_Screen> {

  @override
  void initState() {
    super.initState();
    getCurrentWeather();
  }
  Future getCurrentWeather() async{
  final res = await http.get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=London,uk&APPID=73660b356071bfc6c8915d9936725123"));
  print(res.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
        titleTextStyle: const TextStyle(
            fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.refresh))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          //name card
          SizedBox(
            width: double.infinity,
            child: Card(
              elevation: 9,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          "300K",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          Icons.cloud,
                          size: 58,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Rain",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Weather Forecast",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          //weather forecast card
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                HourlyForecast(
                  time: "9:00",
                  icon: Icons.cloud,
                  value: "320.22",
                ),
                HourlyForecast(
                  time: "10:00",
                  icon: Icons.sunny,
                  value: "300",
                ),
                HourlyForecast(
                  time: "11:00",
                  icon: Icons.cloud_sync_sharp,
                  value: "310.91",
                ),
                HourlyForecast(
                  time: "12:00",
                  icon: Icons.cloud,
                  value: "200.22",
                ),
                HourlyForecast(
                  time: "1:00",
                  icon: Icons.sunny_snowing,
                  value: "300.12",
                ),
                HourlyForecast(
                  time: "2:00",
                  icon: Icons.cloud,
                  value: "302.12",
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),
          //additional info
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Additional Information",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              HourlyForecasItem(
                icon: Icons.water_drop,
                label: "Humidity",
                value: "94",
              ),
              HourlyForecasItem(
                icon: Icons.air,
                label: "Wind Speed",
                value: "7.5",
              ),
              HourlyForecasItem(
                icon: Icons.beach_access,
                label: "Pressure",
                value: "1006",
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

class HourlyForecast extends StatelessWidget {
  final String time;
  final IconData icon;
  final String value;
  const HourlyForecast({
    super.key,
    required this.time,
    required this.icon,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Card(
        elevation: 6,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              Text(
                time,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Icon(
                icon,
                size: 30,
              ),
              const SizedBox(height: 6),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
