import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  late SharedPreferences sharedPreferences;
  static SharedPrefHelper? _instance;

  SharedPrefHelper._();
  

  /// Factory constructor to ensure a single instance of SharedPrefHelper
  factory SharedPrefHelper() {
    return _instance ??= SharedPrefHelper._();
  }
 
  /// Initialize the SharedPreferences instance
  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  /// Set a value for a given key in SharedPreferences
  void setValueForKey({required SharedPrefKeys key, required dynamic value}) {
    switch (value.runtimeType) {
      case String:
        sharedPreferences.setString(key.name, value);
        break;
      case int:
        sharedPreferences.setInt(key.name, value);
        break;
      case double:
        sharedPreferences.setDouble(key.name, value);
        break;
      case bool:
        sharedPreferences.setBool(key.name, value);
        break;
      
      default:
        throw Exception('Unsupported type: ${value.runtimeType}');
    }
  }

  /// Get a value for a given key in SharedPreferences with a default value
  T getValueForKey<T>({required SharedPrefKeys key, required T defaultValue}) {
    return sharedPreferences.get(key.name) as T? ?? defaultValue;
  }

  /// Get a value for a given key in SharedPreferences without a default value
  Future<void> removeKey({required SharedPrefKeys key}) async {
    await sharedPreferences.remove(key.name);
  }
  
  /// Clear all values in SharedPreferences
  Future<void> clearAll() async {
    await sharedPreferences.clear();
  }

}

/// Enum for SharedPreferences keys
enum SharedPrefKeys {
  isOnBoardingViewSeen,
  userData,
}