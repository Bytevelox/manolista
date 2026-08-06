import 'package:flutter/material.dart';
import 'package:manolista/core/core.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      appBar: AppBar(
        title: const Text('Servicios y Categorías'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _ServiceTile(
            title: 'Electricidad',
            subtitle: 'Instalaciones, reparaciones y tableros',
            icon: Icons.electric_bolt,
          ),
          _ServiceTile(
            title: 'Plomería',
            subtitle: 'Fugas, grifería y tuberías',
            icon: Icons.water_drop,
          ),
          _ServiceTile(
            title: 'Refrigeración & A/C',
            subtitle: 'Mantenimiento e instalación de aires',
            icon: Icons.ac_unit,
          ),
          _ServiceTile(
            title: 'Pintura & Remodelación',
            subtitle: 'Pintura interior y exterior',
            icon: Icons.format_paint,
          ),
        ],
      ),
    );
  }
}

class _ServiceTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const _ServiceTile({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.colors.surface,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: context.colors.primary.withValues(alpha: 0.1),
          child: Icon(icon, color: context.colors.primary),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: context.colors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(color: context.colors.textSecondary),
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          context.go(RouteNames.search);
        },
      ),
    );
  }
}
