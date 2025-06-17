import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_weather_app/models/weather_model.dart';
import '../data/repository/weather_repository.dart';
part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc(this.weatherRepository) : super(WeatherInitial()) {
    on<WeatherEvent>(_getCurrentWeather);
  }

  void _getCurrentWeather(
      WeatherEvent event,
      Emitter<WeatherState>emit) async{
    // TODO: implement event handler
    emit(WeatherLoading());
    try{
      final weather = await weatherRepository.getCurrentWeather();
      emit(WeatherSuccess(weatherModel: weather));
      print('weather data **** $weather');
    }catch(e){
      emit(WeatherFailure('failed to get weather ${e.toString()}'));

    }
  }
}
