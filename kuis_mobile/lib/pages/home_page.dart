import 'package:flutter/material.dart';

import '../stationery_item.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  final List<StationeryItem> stationeryItems;
  const HomePage({super.key, required this.stationeryItems});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toko Alat Tulis'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: widget.stationeryItems.length,
        itemBuilder: (context, index) {
          final item = widget.stationeryItems[index];
          return Card(
            child: ListTile(
              leading: Image.network(
                item.imageUrl,
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
              title: Text(
                item.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.description),
                  Text('Stok: ${item.stock}'),
                  Text('Harga: Rp. ${item.formattedPrice} / pcs'),
                ],
              ),
              trailing: Text(item.formattedPrice),
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(stationeryItem: item),
                  ),
                );
                setState(() {});
              },
            ),
          );
        },
      ),
    );
  }
}
