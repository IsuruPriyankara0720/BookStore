import 'package:flutter/material.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        backgroundColor: Colors.greenAccent[700], // Blue app bar
        titleTextStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold ,fontSize: 24),
        iconTheme: const IconThemeData(color: Colors.white),
        
        
        title: const Text('BookMarks'), // You can customize the title
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Saved Items', // Changed title to "Saved Items" or similar
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.7, // Adjust as needed
                ),
                itemCount: 4, // Replace with actual bookmark count
                itemBuilder: (context, index) {
                  return _buildBookmarkItem(context, index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBookmarkItem(BuildContext context, int index) {
    // Replace with actual bookmark data
    final List<String> titles = [
      'DRACULA', // Example bookmark titles
      'BIRD BOX',
      'THE HUNGER',
      'LORD OF SCOUNDRELS',
    ];

    final List<String> prices = [
      'Rs 2000.00', // Example prices
      'Rs 1500.00',
      'Rs 1800.00',
      'Rs 2000.00',
    ];

    final List<String> images = [
      'assets/image1.jpg', // Replace with your image paths
      'assets/image2.jpg',
      'assets/image3.jpg',
      'assets/image5.jpg', // Placeholder image
    ];


    return GestureDetector(
      onTap: () {
        // Handle bookmark item tap (e.g., view details)
        debugPrint('Tapped on bookmark item $index');
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.asset(images[index], fit: BoxFit.cover), // Display image
              // Or use Image.network if you have image URLs:
              // child: Image.network(imageUrls[index], fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titles[index],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(prices[index]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}