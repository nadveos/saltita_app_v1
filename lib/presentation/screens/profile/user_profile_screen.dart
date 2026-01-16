import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:saltita/presentation/providers/providers.dart';
import 'package:saltita/presentation/providers/settings_provider.dart';

class UserProfileScreen extends ConsumerWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(authProvider);

    if (userState == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Mi Perfil')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               const Icon(Icons.account_circle, size: 100, color: Colors.grey),
               const SizedBox(height: 20),
               const Text('Inicia sesión para ver tu perfil', style: TextStyle(fontSize: 18)),
               const SizedBox(height: 30),
               FilledButton(
                onPressed: () {
                   context.push('/login');
                }, 
                child: const Text('Iniciar Sesión')
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  context.push('/register');
                }, 
                child: const Text('Registrarse')
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Mi Perfil')),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          // User Info
          Center(
            child: Column(
              children: [
                 const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.blueAccent,
                  child: Icon(Icons.person, size: 50, color: Colors.white),
                ),
                const SizedBox(height: 10),
                Text(userState.fullName, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text(userState.email, style: const TextStyle(color: Colors.grey)),
                TextButton(onPressed: (){}, child: const Text('Editar perfil'))
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Divider(),
          
          // Options
          ListTile(
            leading: const Icon(Icons.bookmark),
            title: const Text('Mis artistas guardados'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Configuración'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              _showConfigModal(context, ref);
            },
          ),
          ListTile(
            leading: const Icon(Icons.swap_horiz),
            title: const Text('Cambiar a modo Artista'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Cerrar sesión', style: TextStyle(color: Colors.red)),
            onTap: () {
               ref.read(authProvider.notifier).clearUser();
            },
          ),
        ],
      ),
    );
  }

  void _showConfigModal(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        final settings = ref.watch(settingsProvider);
        final settingsNotifier = ref.read(settingsProvider.notifier);

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Configuración',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                SwitchListTile(
                  title: const Text('Habilitar biometría'),
                  value: settings.isBiometricEnabled,
                  onChanged: (value) {
                    settingsNotifier.toggleBiometric(value);
                  },
                ),
                SwitchListTile(
                  title: const Text('Tema Oscuro'),
                  value: settings.isDark,
                  onChanged: (value) {
                    settingsNotifier.toggleTheme(value);
                  },
                ),
                SwitchListTile(
                  title: const Text('Alto Contraste'),
                  value: settings.isHighContrast,
                  onChanged: (value) {
                    settingsNotifier.toggleHighContrast(value);
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.delete_forever, color: Colors.red),
                  title: const Text('Eliminar cuenta permanentemente', style: TextStyle(color: Colors.red)),
                  onTap: () {
                    Navigator.pop(context); // Close modal first
                    _showDeleteAccountDialog(context, ref);
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showDeleteAccountDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Eliminar cuenta'),
        content: const Text('¿Estás seguro de que deseas eliminar tu cuenta permanentemente? Esta acción no se puede deshacer.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              // TODO: Implement actual delete logic
              ref.read(authProvider.notifier).clearUser();
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Cuenta eliminada')),
              );
            },
            child: const Text('Eliminar'),
          ),
        ],
      ),
    );
  }
}
