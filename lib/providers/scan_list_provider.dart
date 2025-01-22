import 'package:flutter/material.dart';
import 'package:qr_scan/models/scan_model.dart';
import 'package:qr_scan/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String tipusSeleccionat = 'http';

  Future<ScanModel> nouScan(String valor) async {
    final nouScan = ScanModel(valor: valor);
    final id = await DBProvider.db.insertScan(nouScan);
    nouScan.id = id;

    if (nouScan.tipus == tipusSeleccionat) {
      this.scans.add(nouScan);
      notifyListeners();
    }

    return nouScan;
  }

  carregaScans() async {
    final scans = await DBProvider.db.getAllScans();
    this.scans = [...scans];
    notifyListeners();
  }

  carregaScansPerTipus(String tipus) async {
    final scans = await DBProvider.db.getScanperTipus(tipus);
    this.scans = scans is Iterable ? [...scans] : [];
    this.tipusSeleccionat = tipus;
    notifyListeners();
  }

  esborraTots() async {
    await DBProvider.db.deleteAllScans();
    this.scans = [];
    notifyListeners();
  }

  esborraPerId(int id) async {
    await DBProvider.db.deleteScan(id);
    carregaScansPerTipus(this.tipusSeleccionat);
  }
}
