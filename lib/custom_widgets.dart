import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'container_provider.dart';

// 1. Окремий кастомний віджет: секція із slider'ами
class SlidersSection extends StatelessWidget {
  const SlidersSection({super.key});

  @override
  Widget build(BuildContext context) {
    // context.watch підписує цей віджет на зміни в ContainerConfigProvider
    final config = context.watch<ContainerConfigProvider>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Слайдер ширини
        Row(
          children: [
            const Text('Width: '),
            Text(
              config.width.toStringAsFixed(2),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Slider(
          value: config.width,
          min: 50,
          max: 250,
          onChanged: (value) => context.read<ContainerConfigProvider>().setWidth(value),
        ),

        // Слайдер висоти
        Row(
          children: [
            const Text('Height: '),
            Text(
              config.height.toStringAsFixed(2),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Slider(
          value: config.height,
          min: 50,
          max: 250,
          onChanged: (value) => context.read<ContainerConfigProvider>().setHeight(value),
        ),

        // Слайдер радіуса верхнього правого кутка
        Row(
          children: [
            const Text('Top Right Radius: '),
            Text(
              config.topRightRadius.toStringAsFixed(2),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Slider(
          value: config.topRightRadius,
          min: 0,
          max: 125,
          onChanged: (value) =>
              context.read<ContainerConfigProvider>().setTopRightRadius(value),
        ),
      ],
    );
  }
}

// 2. Окремий кастомний віджет: червоний контейнер
class RedContainerPreview extends StatelessWidget {
  const RedContainerPreview({super.key});

  @override
  Widget build(BuildContext context) {
    // Отримуємо актуальні розміри та радіус з провайдера
    final config = context.watch<ContainerConfigProvider>();

    return Center(
      child: Container(
        width: config.width,
        height: config.height,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(config.topRightRadius),
          ),
        ),
      ),
    );
  }
}