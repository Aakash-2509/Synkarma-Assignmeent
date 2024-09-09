import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  Widget buildHorizontalList() {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.asset(
                'assets/homeimage.jpg',
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildVerticalList() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image.asset(
              'assets/homeimage.jpg',
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }

  Widget buildGridView() {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: 4,
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Image.asset(
            'assets/homeimage.jpg',
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'List 1: Horizontal align image only with rounded corner',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            buildHorizontalList(),
            const SizedBox(height: 16.0),
            const Text(
              'List 2: Vertical align image only with rounded corner',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            buildVerticalList(),
            const SizedBox(height: 16.0),
            const Text(
              'List 3: Grid view image only with rounded corner',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            buildGridView(),
          ],
        ),
      ),
    );
  }
}
