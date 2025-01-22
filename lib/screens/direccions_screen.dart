import 'package:flutter/material.dart';
import 'package:qr_scan/widgets/scan_titles.dart';

class DireccionsScreen extends StatelessWidget {
  const DireccionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScanTitles(tipus: 'http');
  }
}
