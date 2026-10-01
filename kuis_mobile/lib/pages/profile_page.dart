import 'package:flutter/material.dart';

import '../stationery_item.dart';

class ProfilePage extends StatelessWidget {
  final List<StationeryItem> stationeryItems;

  const ProfilePage({super.key, required this.stationeryItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 45,
              backgroundColor: Colors.blue,
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),
            SizedBox(height: 12),
            Text(
              'Fariz Taufik Syahbana',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text('Pemilik Toko Alat Tulis'),
            SizedBox(height: 24),

            Card(
              child: ListTile(
                leading: Icon(Icons.local_library, color: Colors.blue),
                title: Text('Barang Toko'),
                subtitle: Text('Pesan alat tulis favorit Anda dengan mudah.'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
