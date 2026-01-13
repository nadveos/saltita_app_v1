import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedDiscipline = 'Músicos';
  String selectedSubCategory = 'Folklore';

  final List<String> disciplines = [
    'Músicos',
    'Pintores',
    'Fotógrafos',
    'Bailarines',
    'Escultores'
  ];
  final List<String> musicSubCategories = [
    'Folklore',
    'Cumbia',
    'RKT',
    'Hip Hop',
    'Tango',
    'Latino',
    'Rock',
    'Pop',
    'Ver todos'
  ];

  // Dummy Data for Carousel
  final List<Map<String, String>> featuredArtists = [
    {
      'id': '1',
      'name': 'Los Nocheros',
      'location': 'Salta, Capital',
      'tag': 'Folklore',
      'image': 'https://placewaifu.com/image/300/200?r=1' // Placeholder
    },
    {
      'id': '2',
      'name': 'La Delio Valdez',
      'location': 'Buenos Aires',
      'tag': 'Cumbia',
      'image': 'https://placewaifu.com/image/300/200?r=2'
    },
     {
      'id': '3',
      'name': 'Trueno',
      'location': 'La Boca',
      'tag': 'Hip Hop',
      'image': 'https://placewaifu.com/image/300/200?r=3'
    },
  ];

  // Dummy Data for List
  final List<Map<String, String>> otherArtists = [
    {
      'id': '4',
      'name': 'Chaqueño Palavecino',
      'category': 'Folklore',
      'location': 'Chaco',
      'image': 'https://placewaifu.com/image/100/100?r=4'
    },
    {
      'id': '5',
      'name': 'L-Gante',
      'category': 'RKT',
      'location': 'General Rodríguez',
      'image': 'https://placewaifu.com/image/100/100?r=5'
    },
    {
      'id': '6',
      'name': 'Astor Piazzolla',
      'category': 'Tango',
      'location': 'Mar del Plata',
      'image': 'https://placewaifu.com/image/100/100?r=6'
    },
    {
      'id': '7',
      'name': 'Maria Becerra',
      'category': 'Pop',
      'location': 'Quilmes',
      'image': 'https://placewaifu.com/image/100/100?r=7'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Descubrí artistas', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.tune), // Filters icon
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section 1: Carousel
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                'Destacados', 
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: featuredArtists.length,
                itemBuilder: (context, index) {
                  final artist = featuredArtists[index];
                  return _buildFeaturedCard(context, artist);
                },
              ),
            ),

            const SizedBox(height: 20),

            // Section 2: Discipline Selector
            SizedBox(
              height: 50,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: disciplines.length,
                separatorBuilder: (_, __) => const SizedBox(width: 10),
                itemBuilder: (context, index) {
                  final uiDiscipline = disciplines[index];
                  final isSelected = uiDiscipline == selectedDiscipline;
                  return ChoiceChip(
                    label: Text(uiDiscipline),
                    selected: isSelected,
                    onSelected: (selected) {
                      if (selected) {
                        setState(() {
                          selectedDiscipline = uiDiscipline;
                        });
                      }
                    },
                  );
                },
              ),
            ),

            const SizedBox(height: 10),

            // Section 3: Subcategories (Only if Músicos is selected)
            if (selectedDiscipline == 'Músicos')
              SizedBox(
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: musicSubCategories.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    final subCat = musicSubCategories[index];
                    final isSelected = subCat == selectedSubCategory;
                    return FilterChip(
                      label: Text(subCat),
                      selected: isSelected,
                      onSelected: (selected) {
                        setState(() {
                          selectedSubCategory = subCat;
                        });
                      },
                      visualDensity: VisualDensity.compact,
                    );
                  },
                ),
              ),

            const SizedBox(height: 20),

            // Section 4: Vertical List
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                'Artistas cerca tuyo', 
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(), // Scroll controlled by SingleChildScrollView
              shrinkWrap: true,
              itemCount: otherArtists.length,
              itemBuilder: (context, index) {
                final artist = otherArtists[index];
                return _buildArtistListCard(context, artist);
              },
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildFeaturedCard(BuildContext context, Map<String, String> artist) {
    return Container(
      width: 250,
      margin: const EdgeInsets.only(right: 12),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            // Placeholder Image using Container color if image fails or just colored box
            Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.grey.shade300,
               child: Icon(Icons.music_note, size: 50, color: Colors.grey.shade400,),
               // Image.network(artist['image']!, fit: BoxFit.cover, errorBuilder: (_,__,___) => const SizedBox()),
            ),
            // Gradient Overlay
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
                ),
              ),
            ),
            // Text Content
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                     child: Text(
                      artist['tag']!,
                      style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                   ),
                   const SizedBox(height: 4),
                   Text(
                    artist['name']!,
                    style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    artist['location']!,
                    style: const TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ),
            ),
             // Tap gesture
            Positioned.fill(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                     context.go('/home/artist/${artist['id']}');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildArtistListCard(BuildContext context, Map<String, String> artist) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            // Avatar
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey.shade300,
              child: const Icon(Icons.person, color: Colors.white),
               // backgroundImage: NetworkImage(artist['image']!),
            ),
            const SizedBox(width: 16),
            // Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    artist['name']!,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    '${artist['category']} • ${artist['location']}',
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                  ),
                ],
              ),
            ),
            // Action Button
            ElevatedButton(
              onPressed: () {
                 context.go('/home/artist/${artist['id']}');
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                minimumSize: const Size(0, 32),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
              ),
              child: const Text('Ver perfil', style: TextStyle(fontSize: 12)),
            ),
          ],
        ),
      ),
    );
  }
}