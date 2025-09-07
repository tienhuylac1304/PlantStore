import 'package:plant_store/model/plant.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PlantService {
  final supabase = Supabase.instance.client;

  Future<List<Plant>> fetchPlants() async {
    try {
      final List<dynamic> response = await supabase.from('plants').select();

      print('Supabase raw response: $response');

      return response
          .map((json) => Plant.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print("Error fetching plants: $e");
      return [];
    }
  }

  Future<Plant?> fetchPlantDetail(String plantId) async {
    final response =
        await supabase.from('plants').select().eq('id', plantId).maybeSingle();

    if (response == null) return null;

    return Plant.fromJson(response);
  }
}
