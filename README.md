# Invenetory Mobile App

A new Mobile App.

## Tugas 7

1. Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?

   - State adalah representasi data yang dapat berubah sepanjang waktu atau dinamis. Stateful widget bersifat dinamis sehingga tampilannya dapat berubah sesuai interaksi dari user. Sedangkan, Stateless Widget bersifat statis sehingga tampilannya tidak dapat berubah sesuai interaksi dari user.

2. Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.

   - Berikut adalah beberapa widget yang digunakan pada tugas kali ini:

     - Material App : Widget yang berfungsi untuk tema dari aplikasi yang memiliki default styling Material UI.

     - Scaffold: Widget yang berfungsi sebagai kanvas atau struktur visual dasar untuk widget-widget lain.
     - AppBar: Widget untuk menampilkan bagian atas aplikasi.

     - SingleChildScrollView: Widget yang berfugsi untuk widget wrapper yang dapat di scroll.

     - Padding: Widget untuk memberikan padding pada child.

     - Column: Widget untuk menampilkan children dalam bentuk kolom.

     - Text: Widget untuk menampilkan text.

     - Gridview: Widget untuk menampilkan children dalam bentuk array dua dimensi.

     - Icon: Widget untuk menampilkan Icon.

     - Center: Widget untuk mengatur posisi child ke tengah

     - InkWell: Widget untuk memberikan efeck sentuhan saat ditekan.

     - SnackBar: Widget untuk menampilkan pop up dari bawah aplikasi.

     - Container: Widget yang membungkus child dan megatur tata letaknya.

3. Step by Step

   <details>
   <summary>Initialize Flutter App</summary>

   ```sh
   flutter create invenetory_mobile
   ```

   </details>

   <details>
   <summary>Membuat file menu.dart pada folder lib dan membuat 3 tombol horizontal</summary>

   ```dart
   import 'package:flutter/material.dart';

    class InventoryItem {
    final String name;
    final IconData icon;
    final Color color;

    InventoryItem(this.name, this.icon,this.color);
    }

    class MyHomePage extends StatelessWidget {
    MyHomePage({Key? key}) : super(key: key);
    final List<InventoryItem> items = [
        InventoryItem("Lihat Item", Icons.inventory_rounded,Colors.pink),
        InventoryItem("Tambah Item", Icons.add_box_rounded,Colors.yellow.shade800),
        InventoryItem("Logout", Icons.logout,Colors.green.shade400),
    ];

    @override
    Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(
            title: const Text(
            'Invenetory',
            style: TextStyle(
                color: Colors.green,
                fontSize: 40,
                fontWeight: FontWeight.bold,
            ),

            ),

            backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
            // Widget wrapper yang dapat discroll
            child: Padding(
            padding: const EdgeInsets.all(10.0), // Set padding dari halaman
            child: Column(
                // Widget untuk menampilkan children secara vertikal
                children: <Widget>[
                const Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                    child: Text(
                    'Invenetory', // Text yang menandakan toko
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                    ),
                    ),
                ),
                // Grid layout
                GridView.count(
                    // Container pada card kita.
                    primary: true,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    children: items.map((InventoryItem item) {
                    // Iterasi untuk setiap item
                    return InventoryCard(item);
                    }).toList(),
                ),
                ],
            ),
            ),
        ),
        );
    }
    }

    class InventoryCard extends StatelessWidget {
    final InventoryItem item;

    const InventoryCard(this.item, {super.key}); // Constructor

    @override
    Widget build(BuildContext context) {
        return Material(
        color: item.color,

        );
    }
    }
   ```

   </details>

   <details>
   <summary>Menambahkan Snackbar pada Tombol dengan pesan tiap tombol memanfaatkan InkWell Widget</summary>

   ```dart
   ...

   child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
        },
        child: Container(
          // Container Icon dan Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    ...
   ```

   </details>

    <details>
    <summary>Menggabungkan dengan main.dart </summary>

   ```dart
   import 'package:flutter/material.dart';
   import 'package:invenetory_mobile/menu.dart';

   void main() {
   runApp(const MyApp());
   }

   class MyApp extends StatelessWidget {
   const MyApp({super.key});

   // This widget is the root of your application.
   @override
   Widget build(BuildContext context) {
       return MaterialApp(
       title: 'Invenetory',
       theme: ThemeData(
           colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
           useMaterial3: true,
       ),
       home: MyHomePage(),
       );
   }
   }
   ```

    </details>

   <details>
    <summary>Menambahkan Atribut Color pada Inventory Item</summary>

   ```dart
   class InventoryItem {
   final String name;
   final IconData icon;
   final Color color;

   InventoryItem(this.name, this.icon,this.color);
   }

   class MyHomePage extends StatelessWidget {
   MyHomePage({Key? key}) : super(key: key);
   final List<InventoryItem> items = [
       InventoryItem("Lihat Item", Icons.inventory_rounded,Colors.pink),
       InventoryItem("Tambah Item", Icons.add_box_rounded,Colors.yellow.shade800),
       InventoryItem("Logout", Icons.logout,Colors.green.shade400),
   ];
   ...
   }
   ```

    </details>
    
    <details>
    <summary>Mengganti color dari card menjadi item.color</summary>
    
    ```dart
     Widget build(BuildContext context) {
        return Material(
        color: item.color,
        child: InkWell(
            onTap: () {
            ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(
                    content: Text("Kamu telah menekan tombol ${item.name}!")));
            },
            ...
        )
        )
     }
    ```
    </details>
