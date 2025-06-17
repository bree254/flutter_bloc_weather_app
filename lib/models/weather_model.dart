class WeatherModel{
  final double currentTemp;
  final String currentSky;
  final double currentPressure;
  final double currentWindSpeed;
  final double currentHumidity;

  final List<dynamic> rawHourlyData;

  const WeatherModel(
     {
    required this.currentTemp,
    required this.currentSky,
    required this.currentPressure,
    required this.currentWindSpeed,
    required this.currentHumidity,
       required this.rawHourlyData,
     });


  WeatherModel copyWith({
    double? currentTemp,
    String? currentSky,
    double? currentPressure,
    double? currentWindSpeed,
    double? currentHumidity,
  }) {
    return WeatherModel(
      currentTemp: currentTemp ?? this.currentTemp,
      currentSky: currentSky ?? this.currentSky,
      currentPressure: currentPressure ?? this.currentPressure,
      currentWindSpeed: currentWindSpeed ?? this.currentWindSpeed,
      currentHumidity: currentHumidity ?? this.currentHumidity,
      rawHourlyData: [],

    );
  }

  Map<String, dynamic> toMap() {
    return {
      'currentTemp': this.currentTemp,
      'currentSky': this.currentSky,
      'currentPressure': this.currentPressure,
      'currentWindSpeed': this.currentWindSpeed,
      'currentHumidity': this.currentHumidity,
    };
  }

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    final currentWeatherData = map['list'][0];

    return WeatherModel(
      currentTemp: (currentWeatherData['main']['temp'] as num).toDouble(),
      currentSky: currentWeatherData['weather'][0]['main'],
      currentPressure: (currentWeatherData['main']['pressure'] as num).toDouble(),
      currentWindSpeed: (currentWeatherData['wind']['speed'] as num).toDouble(),
      currentHumidity: (currentWeatherData['main']['humidity'] as num).toDouble(),
      rawHourlyData: map['list'],
    );
  }

  @override
  String toString() {
    return 'WeatherModel(currentTemp: $currentTemp, currentSky: $currentSky, currentPressure: $currentPressure, currentWindSpeed: $currentWindSpeed, currentHumidity: $currentHumidity)';
  }


}