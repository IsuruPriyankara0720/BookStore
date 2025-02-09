import 'package:flutter/material.dart';

void main() {
  runApp(const BookstoreApp());
}

class BookstoreApp extends StatelessWidget {
  const BookstoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bookstore',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          titleMedium: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
          bodyMedium: TextStyle(fontSize: 16, color: Colors.black54),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        backgroundColor: Colors.greenAccent[700], // Blue app bar
        titleTextStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold ,fontSize: 24),
        iconTheme: const IconThemeData(color: Colors.white),
        
        
        title: const Text('Book Store'), // You can customize the title
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildBookItem(
              context: context,
              image: 'assets/image1.jpg',
              title: 'DRACULA',
              author: 'BRAM STOKER',
              price: 'Rs 2000',
              details: "Dracula tells the story of Count Dracula's attempt to move from Transylvania to England to spread the undead curse. The novel is presented in an epistolary format, consisting of letters, diary entries, and newspaper articles. It follows Jonathan Harker, Mina Harker, Dr. John Seward, and Professor Abraham Van Helsing as they confront the terrifying presence of Dracula and seek to stop his reign of terror.",
            ),
            _buildBookItem(
              context: context,
              image: 'assets/image2.jpg',
              title: 'BIRD BOX',  
              author: 'JOSH MALERMAN',
              price: 'Rs 1500',
              details: "In a post-apocalyptic world, an unseen entity drives people to madness and suicide upon sight. The story follows Malorie and her two children as they navigate a dangerous journey to safety while blindfolded, relying on their other senses to survive. The novel explores themes of fear, survival, and the instinct to protect one's family.",
            ),
            _buildBookItem(
              context: context,
              image: 'assets/image3.jpg',
              title: 'THE HUNGER',
              author: 'ALMA KATSU', // Add author
              price: 'Rs 1800',
              details: "Set in the winter of 1846, 'The Hunger' is a fictionalized account of the ill-fated Donner Party, a group of American pioneers who set out for California but became trapped in the Sierra Nevada mountains. As the group struggles to survive against the harsh conditions, they begin to experience strange occurrences and a growing sense of dread. The novel blends historical fiction with horror, exploring themes of desperation, survival, and the dark side of human nature.",
            ),
            _buildBookItem(
              context: context,
              image: 'assets/image4.jpg',
              title: 'A LOVE STORY',
              author: ' Erich Segal', // Add author
              price: 'Rs 2000',
              details: 'A poignant tale of love and longing,  explores the complexities of relationships, the challenges of communication, and the impact of choices on the lives of its characters. Through moments of joy and heartbreak, the narrative delves into the depths of human emotion, ultimately revealing the transformative power of love.',
            ),
            _buildBookItem(
              context: context,
              image: 'assets/image5.jpg',
              title: 'LORD OF SCOUNDRELS',
              author: 'Loretta Chase', // Add author
              price: 'Rs 2000',
              details: 'Set in Regency England,  follows the story of the dashing and notorious Lord Dain, who is known for his scandalous reputation. When he crosses paths with the strong-willed and intelligent Jessica Trent, sparks fly. Jessica is determined to save her brother from Dains influence, but as she gets to know him, she discovers that there is more to the lord than meets the eye. The novel is a delightful blend of romance, wit, and adventure, exploring themes of love, redemption, and the complexities of societal expectations.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBookItem({
    required BuildContext context,
    required String image,
    required String title,
    required String author,
    required String price,
    required String details,
  }) {
    return GestureDetector(
      onTap: () {
        _showBookDetailsBottomSheet(context, image, title, author, details);
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: 16.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Title
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),

              // Author
              Text(
                "By $author",
                style: const TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),

              // Cover Photo
              Center(
                child: Image.asset(
                  image,
                  width: 150,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 8),

              // Price and Button Row
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .center, // Center-align the row horizontally
                children: [
                  // Price Text
                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 16), // Gap between price and button

                  // Add to Cart Button
                  ElevatedButton(
                    onPressed: () {
                      print("Added $title to cart!");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent,
                      foregroundColor: Colors.black,
                    ),
                    child: const Text('Add to Cart'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showBookDetailsBottomSheet(BuildContext context, String image,
      String title, String author, String details) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.5,
          minChildSize: 0.5,
          maxChildSize: 0.9,
          builder: (context, scrollController) {
            return Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        image,
                        width: 200,
                        height: 250,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "By $author",
                      style: const TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      details,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          print("Added $title to cart!");
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Add to Cart'),
                      ),
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Close'),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}