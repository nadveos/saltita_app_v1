import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String selectedDiscipline = 'Músicos';
  String? selectedSubCategory;
  final TextEditingController _searchController = TextEditingController();

  final List<String> disciplines = ['Músicos', 'Pintores', 'Fotógrafos', 'Bailarines'];
  final List<String> musicSubCategories = ['Folklore', 'Cumbia', 'RKT', 'Hip Hop', 'Rock', 'Pop'];

  // Dummy results
  final List<Map<String, String>> searchResults = [
    {
      'id': '10',
      'name': 'Los Palmeras',
      'category': 'Cumbia',
      'location': 'Santa Fe',
    },
    {
      'id': '11',
      'name': 'Abel Pintos',
      'category': 'Folklore / Pop',
      'location': 'Bahía Blanca',
    },
    {
      'id': '12',
      'name': 'Wos',
      'category': 'Hip Hop',
      'location': 'Buenos Aires',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: _searchController,
            decoration: const InputDecoration(
              hintText: 'Buscar artistas...',
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search, color: Colors.grey),
              contentPadding: EdgeInsets.symmetric(vertical: 8),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.tune),
            onPressed: () {
              // Show advanced filters
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Filters Section
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Discipline Filter
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: disciplines.map((discipline) {
                      final isSelected = selectedDiscipline == discipline;
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: ChoiceChip(
                          label: Text(discipline),
                          selected: isSelected,
                          onSelected: (selected) {
                            if (selected) {
                              setState(() {
                                selectedDiscipline = discipline;
                                selectedSubCategory = null; // Reset subcat
                              });
                            }
                          },
                        ),
                      );
                    }).toList(),
                  ),
                ),
                
                const SizedBox(height: 8),

                // Subcategory Filter (Conditional)
                if (selectedDiscipline == 'Músicos')
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: musicSubCategories.map((subCat) {
                        final isSelected = selectedSubCategory == subCat;
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: FilterChip(
                            label: Text(subCat),
                            selected: isSelected,
                            onSelected: (selected) {
                              setState(() {
                                selectedSubCategory = selected ? subCat : null;
                              });
                            },
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  
                  const SizedBox(height: 8),
                  // Simple Sort/Location row placeholder
                  Row(
                    children: [
                       Text("Ordenar por: Relevancia", style: TextStyle(color: Colors.grey[700], fontSize: 12)),
                       const Icon(Icons.arrow_drop_down, size: 16, color: Colors.grey),
                       const Spacer(),
                       const Icon(Icons.location_on, size: 14, color: Colors.grey),
                       Text(" Ubicación: Todas", style: TextStyle(color: Colors.grey[700], fontSize: 12)),
                    ],
                  )
              ],
            ),
          ),
          
          const Divider(),

          // Results List
          Expanded(
            child: ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                final artist = searchResults[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey.shade300,
                      child: const Icon(Icons.person, color: Colors.white),
                    ),
                    title: Text(artist['name']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('${artist['category']} • ${artist['location']}'),
                    trailing: ElevatedButton(
                      onPressed: () {
                         context.go('/search/artist/${artist['id']}');
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                         minimumSize: const Size(0, 32),
                      ),
                      child: const Text('Ver perfil', style: TextStyle(fontSize: 12)),
                    ),
                    onTap: () {
                      context.go('/search/artist/${artist['id']}');
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
