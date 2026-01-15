import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:saltita/presentation/providers/providers.dart';

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
                   // TODO: Implement Login
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
            onTap: () {},
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
}
