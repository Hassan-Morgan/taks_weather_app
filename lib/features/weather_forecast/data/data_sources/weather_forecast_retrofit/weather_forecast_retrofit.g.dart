// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_forecast_retrofit.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _WeatherForecastRetrofit implements WeatherForecastRetrofit {
  _WeatherForecastRetrofit(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://api.weatherapi.com/v1';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<WeatherForecastModel> getWeatherForecast(apiKey, q, days) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'key': apiKey,
      r'q': q,
      r'days': days
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<WeatherForecastModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/forecast.json',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = WeatherForecastModel.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
