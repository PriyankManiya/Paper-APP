import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:paper_app/helper/model/Weather.dart';
import 'package:paper_app/helper/service/temp_service.dart';

class TempController extends GetxController {
  var isLoading = true.obs;
  var weather = Weather().obs;

  @override
  void onInit() {
    super.onInit();
    getWeather();
  }

  @override
  void onClose() {}

  Future<void> getWeather() async {
    isLoading(true);
    try {
      try {
       
       GetStorage getStorage = GetStorage();
       var lat = getStorage.read("clatitude");
       var lon = getStorage.read("clongitude");
       
       print("Lat : $lat Lon : $lon");
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

        var getWeatherResponse = await GetWeatherService.getWeather(
          lat: lat == null ? "${position.latitude}" : lat.toString() ,
          lon: lon == null ? "${position.longitude}" : lon.toString(),
        );

        print("Lat : ${lat == null ? "${position.latitude}" : lat.toString()} Lon : ${lon == null ? "${position.longitude}" : lon.toString()}");

        weather(Weather.fromJson(getWeatherResponse));
      
      } catch (e) {
        print("API ERROR" + e);
      }
      isLoading(false);
    } catch (e) {
      isLoading(false);
      print("ERROR ****** ERROR");
      print("ERROR WHILE FETCHING DATA WEATHER : $e");
    }
  }
}
