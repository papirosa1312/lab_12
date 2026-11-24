import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'container_provider.dart';
import 'custom_widgets.dart';

void main() {
  runApp(
    // Огортаємо весь додаток у ChangeNotifierProvider, щоб стан був доступний всюди
    ChangeNotifierProvider(
      create: (context) => ContainerConfigProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 12',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const ConfiguratorPage(),
    );
  }
}

class ConfiguratorPage extends StatelessWidget {
  const ConfiguratorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab 12'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Виносимо секцію слайдерів та червоний контейнер як окремі віджети
            SlidersSection(),
            SizedBox(height: 32),
            Expanded(
              child: RedContainerPreview(),
            ),
          ],
        ),
      ),
    );
  }
}