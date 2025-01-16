import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_theme.dart'; 
import 'CalendarScreen.dart'; 
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: AppTheme.darkTheme, // tema oscuro
        home: const MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  // Para manejar la pestaña seleccionada en el BottomNavigationBar
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<MyAppState>();
    final currentIndex = appState.selectedIndex;

    // Aquí definimos las diferentes pantallas según el índice seleccionado
    Widget screen;
     switch (currentIndex) {
  case 1:
    screen = const Center(child: Text('Hoy'));
    break;
  case 2:
    // Aquí mostramos el calendario
    screen = const CalendarScreen();
    break;
  case 3:
    screen = const Center(child: Text('Settings'));
    break;
  case 0:
  default:
    screen = const Center(child: Text('Hello World'));
}

    return Scaffold(
      appBar: AppBar(
        title: const Text('Menú abajo'),
      ),
      body: screen, // Mostramos la pantalla correspondiente

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Para mostrar más de 3 pestañas
        currentIndex: currentIndex,        
        //selectedItemColor: Colors.red,
        
        onTap: (index) {
          // Actualizamos la pestaña seleccionada en el estado
          appState.setSelectedIndex(index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Hoy',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Semana',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_view_week),
            label: 'Calendario',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_overscan),
            label: 'Settings',
          ),          
        ],
      ),
    );
  }
}
