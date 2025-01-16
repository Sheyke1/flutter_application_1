import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,            // Indicamos que es modo oscuro
      primaryColor: Colors.black,             // Color primario
      scaffoldBackgroundColor: Colors.black,  // Fondo para pantallas (Scaffold)
      // Definimos una paleta de colores oscura
      colorScheme: const ColorScheme.dark(
        primary: Colors.deepOrange,           // Color principal (semilla)
        secondary: Colors.white,              // Color secundario (ej. para acentos)
      ),
      // Definimos el color para íconos de forma global
      iconTheme: const IconThemeData(
        color: Colors.white,
        
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,        // Texto e íconos en el AppBar
      ),
      textTheme: const TextTheme(
        // Ajusta los estilos de texto principales
        bodyLarge: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Colors.white),
        bodySmall: TextStyle(color: Colors.white),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.black,
    selectedItemColor: Colors.red,
    unselectedItemColor: Colors.white,
    type: BottomNavigationBarType.fixed,
    
  ),
    );
  }
}
