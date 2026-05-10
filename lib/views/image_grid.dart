import 'package:flutter/material.dart';

class ImageGridViewScreen extends StatelessWidget {
  const ImageGridViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Grid View"),
        backgroundColor: const Color.fromARGB(255, 156, 141, 182),
      ),

      body: Padding(
        padding: const EdgeInsets.all(10),

        child: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.75,

          children: [
            _buildCard(image: "assets/images/momos.jpg", name: "momo"),

            _buildCard(image: "assets/images/pizza.jpg", name: "pizza"),

            _buildCard(
              image: "assets/images/panipuri.jpg",
              name: "panipuri",
            ),

            _buildCard(image: "assets/images/momos.jpg", name: "momos"),

            _buildCard(image: "assets/images/pizza.jpg", name: "pizza"),

            _buildCard(
              image: "assets/images/panipuri.jpg",
              name: "panipuri",
            ),

            _buildCard(image: "assets/images/momos.jpg", name: "momos"),

            // Card 8
            _buildCard(image: "assets/images/pizza.jpg", name: "pizza"),

            // Card 9
            _buildCard(
              image: "assets/images/panipuri.jpg",
              name: "panipuri",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({required String image, required String name}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),

      child: Column(
        children: [
          // Image
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(15),
              ),

              child: Image.asset(
                image,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Text
          Padding(
            padding: const EdgeInsets.all(8),

            child: Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}