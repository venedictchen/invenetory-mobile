# Invenetory Mobile App

A new Mobile App.

- [Tugas 7](#tugas-7)
- [Tugas 8](#tugas-8)


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

## Tugas 8

1. Jelaskan perbedaan antara `Navigator.push()` dan `Navigator.pushReplacement()`, disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!

  - `Navigator.push()` adalah method routing yang berfungsi untuk menambahkan suatu route ke dalam stack routing. Sedangkan `Navigator.pushReplacement()` adalah method routing yang menambahkan suatu route ke dalam stack routing, tetapi mengganti. `Navigator.push()` dapat digunakan untuk kasus jika ingin pengguna kembali ke halaman sebelumnya. Namun, untuk mencegah pengguna kembali ke halaman sebelumnya dapat menggunakan `Navigator.pushReplacement()`.

2. Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!

    - Column: Widget ini digunakan untuk menyusun children secara vertikal.

    - Align: Widget yang berfungsi untuk menyusun children di dalamnya.

    - Row : Widget ini digunakan untuk menyusun children secara horizontal.

    - Container: Widget yang membungkus child dan megatur tata letaknya.

    - Center : Widget yang berfungsi untuk meletakkan children ke tengah.

    - Expanded : Widget yang berfungsi untuk ekspansi children dari Row dan Column untuk mengisi space yang kosong.

    - Baseline: Widget yang berfungsi untuk posisikan widget sesuai dengan titik awal parent widget.

    - SizedBox: Widget yang berfungsi untuk memberikan ukuran spesifik.
    
    - LimitedBox: Widget yang berfungsi untuk memberikan ukuran maksimal.

    - Padding : Widget untuk memberikan padding pada child.
    
    - GridView: Widget untuk menampilkan children dalam bentuk array dua dimensi.

3.  Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!

    - Pada tugas kali ini saya menggunakan `TextFormField` untuk menerima input berupa `name` `amount` `code` `price` `description`. Lalu, saya melakukan validasi input dari pengguna sesuai dengan ketentuan tipe dari masing-masing input.

4. Bagaimana penerapan clean architecture pada aplikasi Flutter?

  - Clean architecture adalah desain software yang menggunakan separation of concerns. Tujuannya untuk menciptakan kode yang modular, scalable, dan testable. Pada flutter clean architecture terdiri atas:
    
    - Presentation Layer (UI) yang berisi komponen user interface, seperti widgets, screens, dan views.

    - Domain Layer (Business Logic) yang berisi logika bisnis inti aplikasi. Bagian ini berisi use cases, entities, dan business rules.

    - Data Layer yang berisi data untuk pengambilan dan penyimpanan. Bagian ini terdiri dari repositori dan sumber data. Repositori menyediakan lapisan abstraksi untuk mengakses dan memanipulasi data.

5. Step-by-Step

    <details>
    <summary>Membuat halaman form</summary>

    1. Membuat file `inventory_form.dart` yang berisi input-input yang dibutuhkan menggunakan `TextFormField` dan menambahkan `validasi`  saat save `onpressed` untuk setiap tipe data input. Apabila, save berhasil maka akan ada pop up data yang diinput menggunakan `AlertDialog`

        ```dart
        import 'package:flutter/material.dart';
        import 'package:invenetory_mobile/widgets/left_drawer.dart';

        class InventoryFormPage extends StatefulWidget {
          const InventoryFormPage({super.key});

          @override
          State<InventoryFormPage> createState() => _InventoryFormPageState();
        }

        class _InventoryFormPageState extends State<InventoryFormPage> {
          final _formKey = GlobalKey<FormState>();
          String _name = "";
          int _amount = 0;
          String _description = "";
          int _code = 0;
          int _price = 0;

          @override
          Widget build(BuildContext context) {
            return Scaffold(
              appBar: AppBar(
                title: const Center(
                  child: Text(
                    'Add Item Form',
                  ),
                ),
                backgroundColor: Colors.white,
                foregroundColor: Colors.grey,
              ),
              drawer: const LeftDrawer(),
              body: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Nama Item",
                            labelText: "Nama Item",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              _name = value!;
                            });
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "Nama tidak boleh kosong!";
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Jumlah",
                            labelText: "Jumlah",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              _amount = int.parse(value!);
                            });
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "Jumlah tidak boleh kosong!";
                            }
                            if (int.tryParse(value) == null) {
                              return "Jumlah harus berupa angka!";
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Kode Item",
                            labelText: "Kode Item",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              _code = int.parse(value!);
                            });
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "Kode tidak boleh kosong!";
                            }
                            if (int.tryParse(value) == null) {
                              return "Kode harus berupa angka!";
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Price",
                            labelText: "Price",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              _price = int.parse(value!);
                            });
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "Harga tidak boleh kosong!";
                            }
                            if (int.tryParse(value) == null) {
                              return "Harga harus berupa angka!";
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Deskripsi",
                            labelText: "Deskripsi",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              _description = value!;
                            });
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "Deskripsi tidak boleh kosong!";
                            }
                            return null;
                          },
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.green.shade700),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text('Item berhasil tersimpan'),
                                      content: SingleChildScrollView(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Nama: $_name'),
                                            Text('Jumlah: $_amount'),
                                            Text('Harga: $_price'),
                                            Text('Kode: $_code'),
                                            Text('Deskripsi: $_description'),
                                          ],
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                          child: const Text('OK'),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                                _formKey.currentState!.reset();
                              }
                            },
                            child: const Text(
                              "Save",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        }

        
        ```    
    </details>

    <details>
    <summary>Menambahkan Navigator untuk Lihat Item</summary>

    1. Menambahkan if tambahan di `inventory_card.dart` untuk ke `Lihat Item`.

        ```dart
        ...
        if(item.name == 'Lihat Item'){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => InventoryListPage()));
              }
        ...
        ```

    </details>

    <details>
    <summary>Membuat halaman drawer</summary>

    1. Membuat file `left_drawer.dart` dan membuat routing menggunakan `Navigator.push()` untuk ke `Tambah Item` dan `Navigator.pushReplacement()` untuk kembali ke `Halaman Utama`.  

        ```dart
        import 'package:flutter/material.dart';
        import 'package:invenetory_mobile/screens/inventory_list.dart';
        import 'package:invenetory_mobile/screens/menu.dart';
        import 'package:invenetory_mobile/screens/inventory_form.dart';

        class LeftDrawer extends StatelessWidget {
          const LeftDrawer({super.key});

          @override
          Widget build(BuildContext context) {
            return Drawer(
              child: ListView(
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.green,
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Invenetory',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(10)),
                        Text(
                          "Track seluruh stok barang kamu disini!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.home_outlined),
                    title: const Text('Halaman Utama'),
                    // Bagian redirection ke MyHomePage
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyHomePage(),
                          ));
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.add_shopping_cart),
                    title: const Text('Tambah Item'),
                    // Bagian redirection ke InventoryFormPage
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const InventoryFormPage()));
                    },
                  ),
                ],
              ),
            );
          }
        }

        
        ```
    </details>
    
    <details>
    <summary>Mengerjakan Bonus untuk Halaman List Item</summary>


    1. Membuat static list di `inventory_item.dart` dan menambahkan ketika save di form.

    ```dart
    import 'package:flutter/material.dart';
    class Item {
      static final List<Item> dummy = [
        Item(
          'Item 1',
          10,
          12345,
          50,
          'This is the description for item 1.',
        ),
        Item(
          'Item 2',
          25,
          67890,
          50,
          'This is the description for item 2',
        ),
        Item(
          'Item 3',
          15,
          11110,
          50,
          'This is the description for item 3.',
        ),
      ];
      final String name;
      final int amount;
      final int code;
      final int price;
      final String description;

      Item(this.name, this.amount, this.code, this.price, this.description);
    }

    class InventoryItem extends StatelessWidget {
      final Item item;

      const InventoryItem(this.item, {super.key});

      @override
      Widget build(BuildContext context) {
        return Material(
          color: Colors.grey.shade100,
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.black, fontSize: 24,fontWeight: FontWeight.bold),

                  overflow: TextOverflow.ellipsis,
                ),
                
                const Padding(padding: EdgeInsets.all(5)),
                Text(
                  'Jumlah: ${item.amount.toString()}',
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                ),
                const Padding(padding: EdgeInsets.all(1)),
                Text(
                  'Code: ${item.code.toString()}',
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                  overflow: TextOverflow.ellipsis,
                ),
                const Padding(padding: EdgeInsets.all(1)),
                Text(
                  'Price: ${item.price.toString()}',
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                  overflow: TextOverflow.ellipsis,
                ),
                const Padding(padding: EdgeInsets.all(1)),
                Text(
                  item.description,
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                  overflow: TextOverflow.ellipsis,
                ),
                const Padding(padding: EdgeInsets.all(1)),
              ],
            ),
          ),
        );
      }
    }

    
    ```
    ```dart
       onPressed: () {
          if (_formKey.currentState!.validate()) {
            Item.dummy.add(Item(
                _name, _amount, _code, _price, _description));
            showDialog(
              ...
            )
            ...
          }
       }
    
    
    ```
    2. Membuat halaman `inventory_list.dart` untuk menampilkan item-item yang ada untuk saat ini menggunakan model list sebelumnya.

        ```dart
        import 'package:flutter/material.dart';
        import 'package:invenetory_mobile/widgets/left_drawer.dart';
        import 'package:invenetory_mobile/widgets/inventory_item.dart';

        class InventoryListPage extends StatelessWidget {
          const InventoryListPage({super.key});

          @override
          Widget build(BuildContext context) {
            return Scaffold(
              appBar: AppBar(
                title: const Text(
                  'Inventory',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 20, 
                    fontWeight: FontWeight.bold,
                  ),
                ),
                backgroundColor: Colors.white,
              ),
              drawer: const LeftDrawer(),
              body: 
              Padding(
                padding: const EdgeInsets.all(10.0),
                
                child: Column(
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Text(
                        'Your Items',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30, 
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: ListView(
                          shrinkWrap: true,
                          children: Item.dummy.map((Item item) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0),
                              child: InventoryItem(item),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        }

        
        ```

    3. Membuat widget `inventory_item.dart` untuk card di halaman `invetory_list.dart` dan menambahkan `TextOverflow.Ellipsis` untuk kata yang terlalu panjang.

        ```dart
        import 'package:flutter/material.dart';
        class Item {
          final String name;
          final int amount;
          final int code;
          final int price;
          final String description;

          Item(this.name, this.amount, this.code, this.price, this.description);
        }

        class InventoryItem extends StatelessWidget {
          final Item item;

          const InventoryItem(this.item, {super.key});

          @override
          Widget build(BuildContext context) {
            return Material(
              color: Colors.grey.shade100,
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    Text(
                      item.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.black, fontSize: 24),
                      overflow: TextOverflow.ellipsis,
                    ),
                    
                    const Padding(padding: EdgeInsets.all(5)),
                    Text(
                      'Jumlah: ${item.amount.toString()}',
                      style: const TextStyle(color: Colors.black, fontSize: 12),
                    ),
                    const Padding(padding: EdgeInsets.all(1)),
                    Text(
                      'Code: ${item.code.toString()}',
                      style: const TextStyle(color: Colors.black, fontSize: 12),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Padding(padding: EdgeInsets.all(1)),
                    Text(
                      'Price: ${item.price.toString()}',
                      style: const TextStyle(color: Colors.black, fontSize: 12),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Padding(padding: EdgeInsets.all(1)),
                    Text(
                      item.description,
                      style: const TextStyle(color: Colors.black, fontSize: 12),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Padding(padding: EdgeInsets.all(1)),
                  ],
                ),
              ),
            );
          }
        }

        
        
        
        ```

    4. Menambahkan navigasi di `left_drawer.dart`.

        ```dart
        ...
        // left Drawer
        ListTile(
          leading: const Icon(Icons.inventory_rounded),
          title: const Text('Lihat Item'),
          // Bagian redirection ke InventoryListPage
          onTap: () {
            Navigator.push(context,
            MaterialPageRoute(builder: (context) => InventoryListPage()));
            },
        ),

        ...
        ```

    </details>

  
  