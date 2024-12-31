// screens/home/homepage.dart
import 'package:flutter/material.dart';
import '../../models/servicemodels.dart'; // Import your ServiceModel

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex =
      0; // Track the selected index for the bottom navigation bar

  @override
  Widget build(BuildContext context) {
    // Get the list of placeholder services from the ServiceModel
    final List<ServiceModel> services = ServiceModel.getPlaceholderServices();

    return Scaffold(
        appBar: AppBar(
          title: Container(
            height: 40, // Set a fixed height for the search bar
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search), // Search icon
              ),
              onChanged: (value) {
                // Handle search logic here (optional)
              },
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Stack(
                children: [
                  IconButton(
                    icon: Icon(Icons.account_circle, size: 30), // Profile icon
                    onPressed: () {
                      // Navigate to profile screen or show profile options
                    },
                  ),
                  Positioned(
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      constraints: BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      child: Text(
                        '3', // Example badge count
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            // "All Featured" Text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('All Featured',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),

            // Categories Row with Custom Icons
            SingleChildScrollView(
              // Categories Row that can scroll horizontally
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.start, // Align buttons to start
                  children: [
                    CategoryIconButton(
                        imagePath: 'assets/icons/design.png', label: 'Design'),
                    SizedBox(width: 8), // Add spacing between buttons
                    CategoryIconButton(
                        imagePath: 'assets/icons/development.png',
                        label: 'Development'),
                    SizedBox(width: 8),
                    CategoryIconButton(
                        imagePath: 'assets/icons/marketing.png',
                        label: 'Marketing'),
                    SizedBox(width: 8),
                    CategoryIconButton(
                        imagePath: 'assets/icons/consulting.png',
                        label: 'Consulting'),
                  ],
                ),
              ),
            ),

            // Expanded Grid of Services
            Expanded(
              // Use Expanded here to take up remaining space
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two columns
                  childAspectRatio:
                      0.75, // Adjust the aspect ratio for better visuals
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount:
                    services.length, // Use the length of the services list
                itemBuilder: (context, index) {
                  final service = services[index];
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // Rounded corners
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.vertical(
                                top:
                                    Radius.circular(10)), // Rounded top corners
                            child: Image.asset(
                              'assets/images/${service.id}.png',
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(service.title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(service.description,
                              style: TextStyle(color: Colors.grey[600])),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('\$${service.price.toStringAsFixed(2)}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          // Add BottomNavigationBar here
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Settings"),
          ],
          currentIndex:
              _selectedIndex, // Set current index based on selected tab
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped, // Handle tap event to change tabs
        ));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
  }
}

class CategoryIconButton extends StatelessWidget {
  final String imagePath;
  final String label;

  const CategoryIconButton(
      {Key? key, required this.imagePath, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imagePath,
          width: 40,
          height: 40,
        ),
        SizedBox(height: 4), // Spacing between icon and text
        Text(label), // Label under the icon
      ],
    );
  }
}
