import 'package:plant_store/model/plant.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PlantService {
  final supabase = Supabase.instance.client;

  Future<List<Plant>> fetchPlants() async {
    try {
      final response = await supabase.from('plants').select();

      print('Supabase raw response: $response');

      if (response is List) {
        return response.map((json) => Plant.fromJson(json)).toList();
      } else {
        print("Unexpected response type: ${response.runtimeType}");
        return [];
      }
    } catch (e) {
      print("Error fetching plants: $e");
      return [];
    }
  }
}
