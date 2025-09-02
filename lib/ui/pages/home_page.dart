import 'package:flutter/material.dart';
import 'package:plant_store/commons/app_colors.dart';
import 'package:plant_store/model/plant.dart';
import 'package:plant_store/service/plant_service.dart';
import 'package:plant_store/ui/component/home/listview_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PlantScreen extends StatefulWidget {
  const PlantScreen({super.key});

  @override
  State<PlantScreen> createState() => _PlantScreenState();
}

class _PlantScreenState extends State<PlantScreen> {
  bool _isIndoorSelected = true;
  late Future<List<Plant>> _plantsFuture;

  @override
  void initState() {
    super.initState();
    _fetchPlants();
  }

  void _fetchPlants() {
    _plantsFuture = PlantService().fetchPlants();
  }

  void _toggleIndoor(bool indoor) {
    setState(() {
      _isIndoorSelected = indoor;
    });
  }

  Future<void> _refreshData() async {
    _fetchPlants();
    setState(() {});
    await _plantsFuture;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Column(
          children: [
            _PlantHeader(
              isIndoorSelected: _isIndoorSelected,
              onToggle: _toggleIndoor,
            ),
            Expanded(
              child: _PlantList(
                plantsFuture: _plantsFuture,
                isIndoorSelected: _isIndoorSelected,
                onRefresh: _refreshData,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// ---------------- Widget Header ----------------
class _PlantHeader extends StatelessWidget {
  final bool isIndoorSelected;
  final ValueChanged<bool> onToggle;

  const _PlantHeader({required this.isIndoorSelected, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.homeTitle,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: AppColors.backgroundLight,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child:
                    isIndoorSelected
                        ? ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            AppLocalizations.of(context)!.indoorPlants,
                          ),
                        )
                        : OutlinedButton(
                          onPressed: () => onToggle(true),
                          child: Text(
                            AppLocalizations.of(context)!.indoorPlants,
                          ),
                        ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child:
                    !isIndoorSelected
                        ? ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            AppLocalizations.of(context)!.outdoorPlants,
                          ),
                        )
                        : OutlinedButton(
                          onPressed: () => onToggle(false),
                          child: Text(
                            AppLocalizations.of(context)!.outdoorPlants,
                          ),
                        ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// ---------------- Widget List ----------------
class _PlantList extends StatelessWidget {
  final Future<List<Plant>> plantsFuture;
  final bool isIndoorSelected;
  final Future<void> Function() onRefresh;

  const _PlantList({
    required this.plantsFuture,
    required this.isIndoorSelected,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: FutureBuilder<List<Plant>>(
        future: plantsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Lỗi: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("Không có cây nào"));
          }

          final plants =
              snapshot.data!
                  .where((p) => p.isIndoor == isIndoorSelected)
                  .toList();

          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            itemCount: plants.length,
            itemBuilder: (context, index) {
              return ListViewPlantCard(plant: plants[index]);
            },
          );
        },
      ),
    );
  }
}
