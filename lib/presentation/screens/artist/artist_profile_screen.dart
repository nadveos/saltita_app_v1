import 'package:flutter/material.dart';

class ArtistProfileScreen extends StatelessWidget {
  final String? artistId;
  const ArtistProfileScreen({super.key, this.artistId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Artista $artistId'),
              background: Container(
                color: Colors.grey.shade400,
                child: const Icon(Icons.music_note, size: 100, color: Colors.white54),
                // Image.network(..., fit: BoxFit.cover)
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Info
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Nombre del Artista', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                          Text('Subcategoría • Ubicación', style: TextStyle(color: Colors.grey.shade600)),
                        ],
                      ),
                       IconButton(onPressed: (){}, icon: const Icon(Icons.bookmark_border))
                    ],
                  ),
                  const SizedBox(height: 16),
                  
                  // Buttons
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.mail_outline),
                          label: const Text('Contactar'),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.share),
                          label: const Text('Compartir'),
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Section: Bio
                  const Text('Sobre mí', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                    style: TextStyle(color: Colors.black87),
                  ),
                  
                  const SizedBox(height: 24),

                  // Section: Social
                  const Text('Redes Sociales', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      _socialIcon(Icons.camera_alt, 'Instagram'), // Simulated
                      const SizedBox(width: 16),
                      _socialIcon(Icons.facebook, 'Facebook'), // Simulated
                      const SizedBox(width: 16),
                      _socialIcon(Icons.video_library, 'YouTube'), // Simulated
                    ],
                  ),

                  const SizedBox(height: 24),
                  
                  // Section: Gallery
                  const Text('Galería', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 100,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(4, (index) => Container(
                        width: 100,
                        margin: const EdgeInsets.only(right: 8),
                        color: Colors.grey.shade300,
                        child: const Icon(Icons.image, color: Colors.white),
                      )),
                    ),
                  ),

                  const SizedBox(height: 24),
                  
                  // Section: Agenda
                  const Text('Próximos eventos', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  // ... List of events
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.calendar_today),
                    title: const Text('Show en vivo'),
                    subtitle: const Text('15 de Octubre - 21:00 hs'),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _socialIcon(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(radius: 20, child: Icon(icon, size: 20)),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 10))
      ],
    );
  }
}
