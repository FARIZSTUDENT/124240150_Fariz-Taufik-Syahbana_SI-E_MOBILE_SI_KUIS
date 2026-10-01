import 'package:flutter/material.dart';

import '../stationery_item.dart';

class DetailPage extends StatefulWidget {
  final StationeryItem stationeryItem;

  const DetailPage({super.key, required this.stationeryItem});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late TextEditingController stockController;
  late TextEditingController priceController;
  late TextEditingController descriptionController;

  int jumlah = 0;

  @override
  void initState() {
    super.initState();
    jumlah = widget.stationeryItem.stock;
    stockController = TextEditingController(text: jumlah.toString());
    priceController = TextEditingController(
      text: widget.stationeryItem.price.toString(),
    );
    descriptionController = TextEditingController(
      text: widget.stationeryItem.description,
    );
  }

  @override
  Widget build(BuildContext context) {
    StationeryItem stationeryItem = widget.stationeryItem;

    return Scaffold(
      appBar: AppBar(
        title: Text(stationeryItem.name),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Image.network(
            stationeryItem.imageUrl,
            height: 200,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 16),

          Text(
            stationeryItem.name,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Text(
            'Rp ${stationeryItem.formattedPrice} / pcs',
            style: const TextStyle(color: Colors.blue),
          ),
          const SizedBox(height: 8),
          Text(stationeryItem.description),
          const SizedBox(height: 16),

          TextField(
            controller: stockController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Jumlah (pcs)',
              border: OutlineInputBorder(),
            ),
            onChanged: (text) {
              setState(() {
                jumlah = int.tryParse(text) ?? 0;
              });
            },
          ),
          TextField(
            controller: priceController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Harga (Rp)',
              border: OutlineInputBorder(),
            ),
            onChanged: (text) {
              setState(() {
                widget.stationeryItem.price = int.tryParse(text) ?? 0;
              });
            },
          ),
          TextField(
            controller: descriptionController,
            keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(
              labelText: 'Deskripsi',
              border: OutlineInputBorder(),
            ),
            onChanged: (text) {
              setState(() {
                widget.stationeryItem.description = text;
              });
            },
          ),
          const SizedBox(height: 16),
          const SizedBox(height: 24),

          // Tombol simpan
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.all(14),
            ),
            onPressed: () {
              widget.stationeryItem.stock = jumlah;
              Navigator.pop(context);
            },
            child: const Text('Simpan Perubahan'),
          ),
        ],
      ),
    );
  }
}
