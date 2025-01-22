import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qr_scan/models/scan_model.dart';
import 'package:qr_scan/widgets/scan_titles.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapasScreen extends StatefulWidget {
  const MapasScreen({Key? key}) : super(key: key);

  @override
  State<MapasScreen> createState() => _MapasScreenState();
}

class _MapasScreenState extends State<MapasScreen> {
  Completer<GoogleMapController> _controller = Completer();
  @override
  Widget build(BuildContext context) {
    final CameraPosition _puntInicial = CameraPosition(
      target: LatLng(41.3818, 2.1685),
      zoom: 14.4746,
    );
    final ScanModel scan =
        ModalRoute.of(context)!.settings.arguments as ScanModel;
    return Scaffold(
        body: GoogleMap(
      mapType: MapType.hybrid,
      initialCameraPosition: _puntInicial,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    ));
  }
}
