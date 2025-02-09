import 'package:flutter/material.dart';
import 'cart.dart';
import 'bookmarks.dart';
import 'profile.dart';
import 'homescreen.dart'; // Import the HomeScreen

void main() {
  runApp(BookstoreApp());
}

class BookstoreApp extends StatefulWidget {
  const BookstoreApp({super.key});

  @override
  _BookstoreAppState createState() => _BookstoreAppState();
}

class _BookstoreAppState extends State<BookstoreApp> {
  int _selectedIndex = 0;

  // Sample data for cart and bookmarks
  List<String> cartItems = [];
  List<String> bookmarkedBooks = [];
  String username = "User  123";
  String email = "user@example.com";

  // List of screens
  final List<Widget> _screens = [];

  @override
  void initState() {
    super.initState();
    _screens.add(HomeScreen()); // Add HomeScreen to the list
    _screens.add(Cart());
    _screens.add(BookmarkScreen());
    _screens.add(Profile());
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bookstore App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              label: 'Bookmarks',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.greenAccent,
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}