import 'package:flutter/material.dart';
import 'package:map_project/features/view/map_view.dart';
import 'package:provider/provider.dart';

import '../features/view_model/map_mode.dart';

class MapAPP extends StatelessWidget {
  const MapAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LocationViewModel(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Google Map",
        home: MapView(),
      ),
    );
  }
}
