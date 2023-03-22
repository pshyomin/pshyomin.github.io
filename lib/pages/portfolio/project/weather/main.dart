import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '/blocs/weather/weather_bloc.dart';
import '/repositorys/weather/weather_repository.dart';
import '/utils/weather/api_client_manager.dart';
import 'home.dart';

class MyApp extends StatefulWidget {
  final WeatherRepository weatherRepository = WeatherRepository(
    apiClientManager: APIClientManager(
      client: http.Client(),
    ),
  );
  MyApp({Key? key}) : super(key: key);

  @override
  MainState createState() => MainState();
}

class MainState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) =>
              WeatherBloc(repository: widget.weatherRepository),
        ),
      ],
      child: const HomePage(),
    );
  }
}
