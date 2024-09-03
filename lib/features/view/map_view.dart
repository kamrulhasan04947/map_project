import 'package:flutter/material.dart';
import 'package:map_project/features/widgets/reent_loc_finder.dart';
import 'package:map_project/features/widgets/footer_widget.dart';
import 'package:map_project/features/widgets/map_type.dart';
import 'package:map_project/features/widgets/map_widget.dart';
import 'package:map_project/features/widgets/map_zoomer.dart';
import 'package:map_project/utils/app_assets.dart';
import 'package:map_project/wrappers/animation_loader.dart';
import 'package:provider/provider.dart';

import '../view_model/map_mode.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  @override
  void initState() {
    super.initState();
    context.read<LocationViewModel>().loadCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Real Time Location Tracker",
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF4770A2),
      ),
      body: Consumer<LocationViewModel>(
        builder: (_, locationViewModel, __) {
          if (locationViewModel.currentLocation == null) {
            return const Center(
              child: AnimationLoader(
                assetName: AppAssets.gpsAnimation,
                boxFit: BoxFit.contain,
              ),
            );
          }
          return Stack(
            children: [
              MapWidget(
                locationViewModel: locationViewModel
              ),
              MapTypeSelector(locationViewModel: locationViewModel),
              MapZoomer(locationViewModel: locationViewModel),
              CurrentLocationFinder(locationViewModel: locationViewModel),
              FooterWidget(locationViewModel: locationViewModel),
            ],
          );
        },
      ),
    );
  }
}
