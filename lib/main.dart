import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/app_theme.dart';

import 'screens/dashboard/dashboard_screen.dart';
import 'screens/resume/resume_list_screen.dart';
import 'screens/application/search_filter_screen.dart';
import 'screens/application/application_entry_screen.dart';
import 'screens/resume/resume_builder_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  
  runApp(
    MultiProvider(
      providers: [
        // Providers will be added here in Phase 3
      ],
      child: const SmartResumeApp(),
    ),
  );
}

class SmartResumeApp extends StatelessWidget {
  const SmartResumeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Resume Tracker',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const DashboardScreen(),
    const ResumeListScreen(),
    const SearchFilterScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() => _selectedIndex = index);
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.dashboard_rounded), label: 'Dashboard'),
          NavigationDestination(icon: Icon(Icons.description_rounded), label: 'Resumes'),
          NavigationDestination(icon: Icon(Icons.work_rounded), label: 'Applications'),
        ],
      ),
      floatingActionButton: _selectedIndex == 2 
        ? FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ApplicationEntryScreen()),
              );
            },
            child: const Icon(Icons.add),
          )
        : null,
    );
  }
}
