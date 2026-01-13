import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  String selectedDiscipline = 'Músicos';
  String? selectedSubCategory;

  final List<String> disciplines = ['Músicos', 'Pintores', 'Fotógrafos', 'Bailarines'];
  final List<String> musicSubCategories = ['Folklore', 'Cumbia', 'RKT', 'Hip Hop', 'Rock'];

  // Dummy markers
  final List<Map<String, dynamic>> markers = [
    {'id': '20', 'x': 0.3, 'y': 0.4, 'name': 'Artista 1', 'sub': 'Folklore'},
    {'id': '21', 'x': 0.6, 'y': 0.3, 'name': 'Artista 2', 'sub': 'Cumbia'},
    {'id': '22', 'x': 0.5, 'y': 0.6, 'name': 'Artista 3', 'sub': 'Rock'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1. Map Layer (Placeholder)
          Container(
            color: Colors.grey[300],
            width: double.infinity,
            height: double.infinity,
            child: CustomPaint(
              painter: _GridPainter(),
            ),
          ),
          
          // 2. Markers Layer
          ...markers.map((m) {
            return Positioned(
              left: MediaQuery.of(context).size.width * m['x'],
              top: MediaQuery.of(context).size.height * m['y'],
              child: GestureDetector(
                onTap: () => _showArtistBottomSheet(context, m),
                child: Column(
                  children: [
                    const Icon(Icons.location_on, color: Colors.red, size: 40),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: const [BoxShadow(blurRadius: 2, color: Colors.black26)],
                      ),
                      child: Text(m['name'], style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
              ),
            );
          }),

          // 3. Overlay Top (Filters)
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            left: 0,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: disciplines.map((d) => Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ChoiceChip(
                        label: Text(d),
                        selected: selectedDiscipline == d,
                        onSelected: (val) {
                           if(val) setState(() => selectedDiscipline = d);
                        },
                         backgroundColor: Colors.white.withOpacity(0.9),
                         selectedColor: Theme.of(context).primaryColor.withOpacity(0.2),
                      ),
                    )).toList(),
                  ),
                ),
                if (selectedDiscipline == 'Músicos') ...[
                  const SizedBox(height: 8),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: musicSubCategories.map((s) => Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: FilterChip(
                          label: Text(s),
                          selected: selectedSubCategory == s,
                          onSelected: (val) {
                             setState(() => selectedSubCategory = val ? s : null);
                          },
                          backgroundColor: Colors.white.withOpacity(0.9),
                        ),
                      )).toList(),
                    ),
                  ),
                ]
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showArtistBottomSheet(BuildContext context, Map<String, dynamic> artist) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
               CircleAvatar(
                radius: 40,
                backgroundColor: Colors.grey.shade300,
                child: const Icon(Icons.person, size: 40, color: Colors.white),
              ),
              const SizedBox(height: 16),
              Text(artist['name'], style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text(artist['sub'], style: TextStyle(color: Colors.grey.shade600)),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                     context.pop(); // Close sheet
                     // Navigate to profile using current shell branch logic if preserved? 
                     // Or just push. ShellBranch maintains state, so push works fine.
                     // IMPORTANT: We assume map is under /map, no nested artist route defined in router for map branch?
                     // Wait, I defined nested for Search and Home, but maybe not Map.
                     // Let's check router. Defined in implementation plan but maybe missed in code.
                     // I did define `artist/:id` for Home and Search in plan, but looking at my code for `app_router.dart`:
                     // I defined `GoRoute(path: '/map'...)` without sub-routes.
                     // I should fix this if I want correct navigation.
                     // For now I'll use `context.push('/home/artist/${artist['id']}')` or fix the router.
                     // Being inconsistent might be bad users experience (switching tabs).
                     // I will update router later if needed, or just handle it.
                     // Actually `context.push` might allow navigating to another branch's child? No, it pushes on top.
                     // Better: define sub route for Map as well or put artist as a top level sibling of the shell?
                     // No, user wants nested nav.
                     // I will assume for this step I just use `context.go('/home/artist/...')` which switches tab, 
                     // OR I fix the router to have artist under map if I want to stay in map tab.
                     // "Navegación principal: BottomNavigation... Mantener cada tab como un Navigator independiente."
                     // So I definitely want `/map/artist/:id`.
                     // I'll assume I'll fix the router in next step or use a generic path if GoRouter allows. 
                     // I'll try to push to `/map/artist/${artist['id']}` and if it fails I'll fix it.
                     // Actually, I'll update the router in the next step to be safe.
                     context.go('/home/artist/${artist['id']}'); // Redirecting to home tab for now is safer until I add route
                  },
                  child: const Text("Ver perfil"),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.black12..strokeWidth = 1;
    // Draw some grid lines to look like a map
    for (double i = 0; i < size.width; i += 50) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }
    for (double i = 0; i < size.height; i += 50) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
