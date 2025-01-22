// Paquet principal per a utilitzar flutter

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scan/providers/scan_list_provider.dart';
import 'package:qr_scan/providers/ui_provider.dart';

// Importar les pantalles principals de screens

import 'package:qr_scan/screens/home_screen.dart';
import 'package:qr_scan/screens/mapa_screen.dart';

// Inicialitza l'aplicació

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => UiProvider()),
      ChangeNotifierProvider(create: (_) => ScanListProvider()),
    ], child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Widged principal de l'aplicació

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR Reader', // Títol de l'aplicació
      initialRoute: 'home', // Ruta inicial
      routes: {
        'home': (_) => HomeScreen(), // Ruta a la pantalla HomeScreen
        'mapa': (_) => MapaScreen(), // Ruta a la pantalla MapaScreen
      },
      theme: ThemeData(
        // No es pot emprar colorPrimary des de l'actualització de Flutter

        colorScheme: ColorScheme.light().copyWith(
          primary: Colors.deepPurple,
        ),

        // Tema de l'aplicació

        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.deepPurple,
        ),
      ),
    );
  }
}
