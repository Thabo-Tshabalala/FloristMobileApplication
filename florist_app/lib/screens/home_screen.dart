import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/flower.dart';
import '../provider/cart_provider.dart';
import '../screens/flower_detail_screen.dart';
import '../screens/navigation_screens/profile.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<String> _titles = <String>[
    'Home',
    'Catalogues',
    'Cart',
    'Profile',
  ];

  final List<Flower> flowers = [
    Flower(
      name: 'Rose',
      description: 'A beautiful red rose.',
      price: 10.0,
      imageUrl: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pexels.com%2Fsearch%2Fbeautiful%2520flowers%2F&psig=AOvVaw0-0vrBQ7MJLOGmfmSwrQ_9&ust=1722799601173000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCNDntePG2YcDFQAAAAAdAAAAABAE',
    ),
    Flower(
      name: 'Tulip',
      description: 'A vibrant yellow tulip.',
      price: 8.0,
      imageUrl: 'https://example.com/tulip.jpg',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _widgetOptions = <Widget>[
      ListView.builder(
        itemCount: flowers.length,
        itemBuilder: (context, index) {
          final flower = flowers[index];
          return ListTile(
            leading: Image.network(flower.imageUrl),
            title: Text(flower.name),
            subtitle: Text('\$${flower.price.toStringAsFixed(2)}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FlowerDetailsScreen(flower: flower),
                ),
              );
            },
          );
        },
      ),
      const Center(child: Text('Catalogues Screen', style: TextStyle(fontSize: 24))),
      const Center(child: Text('Cart Screen', style: TextStyle(fontSize: 24))),
      const ProfileScreen(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
        backgroundColor: Colors.green,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Catalogues',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green[800],
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        enableFeedback: true,
      ),
    );
  }
}
