# Tugas 7: Elemen Dasar Flutter

Feru Pratama Kartajaya (2106750351) - Kelas E

### `StatelessWidget` dan `StatefulWidget`

   `StatelessWidget` adalah widget yang tidak berubah setelah build program, sedangkan `StatefulWidget` adalah widget yang bersifat dinamis dan dapat berubah berdasarkan interaksi user dengan aplikasi. Sebuah `StatefulWidget` diasosiasikan dengan sebuah `State` yang mengandung segala informasi `widget` yang dapat diubah.

### Widget dalam Program `counter_7`
   
   Berikut menggunakan widget yang digunakan untuk menerapkan perubahan di Tugas 7:

   * `Text()` - Digunakan untuk menampilkan teks "GANJIL" dan "GENAP" berdasarkan nilai counter
   * `TextStyle()` - Digunakan untuk mengubah warna dari teks
   * `FloatingActionButton()` - Digunakan untuk membuat tombol + dan - yang digunakan untuk mengubah nilai counter
   * `Row()` - Digunakan untuk menata kedua tombol secara horizontal
   * `Padding()` - Digunakan untuk merapihkan posisi tombol di sebelah kiri
   * BONUS: `Visibility()` - Digunakan untuk menyembunyikan tombol - saat counter bernilai 0

### Fungsi `setState()`

   Saat nilai dari sebuah variabel mengalami perubahan, fungsi `setState()` akan memperingati program bahwa sebuah `State` telah berubah dan melakukan build ulang dari `StatefulWidget` yang bersangkutan. Apabila `setState()` tidak dipanggil saat mengubah variabel, `widget` tidak akan di-build ulang dan perubahan tidak akan ditampilkan di aplikasi. Di aplikasi `counter_7`, `setState()` digunakan saat mengubah variabel `_counter`. 

### Objek `const` dan `final`

   Dalam bahasa Dart, variabel dengan keyword `const` dan `final` memiliki kesamaan yaitu bersifat *immutable*. Perbedaan antara keduanya terletak pada kapan nilai dari variabel tersebut terinisialisasi. Variabel `const` merepresentasikan sebuah konstan dan harus memiliki nilai saat **compile time**, sedangkan nilai variabel `final` diberikan saat **runtime** dan tidak dapat diubah setelah nilai ditetapkan.

### Implementasi Aplikasi Sederhana `counter_7`

   1. **Membuat Program `counter_7`**

      Pada *command prompt*, jalankan perintah `flutter create counter_7`. Proyek flutter dengan nama yang sama akan di-*generate* di direktori yang ditunjuk oleh *command prompt*. Setelah masuk direktori proyek, perintah `flutter run` dijalankan untuk meng-compile dan menjalankan program di desktop atau emulator Android (jika sedang aktif).
    
   2. **Mengubah Tampilan Program**

      Buka file `main.dart` di folder `lib` untuk mengakses kode program. Pada class `MyApp`, ubah atribut `title` pada `const MyHomePage()` dengan judul "Program Counter"

      ```dart
      // Pada class MyApp...
      
      @override
      Widget build(BuildContext context) {
        return MaterialApp(
          [...]
          home: const MyHomePage(title: 'Program Counter'),
        );
      }
      ```

      Pada widget `build()` di class `_MyHomePageState`, ubah teks yang berada di atas counter dengan "GENAP". Gunakan atribut `style` dan widget `TextStyle` untuk mengubah warna dari teks menjadi merah. Mengubah antara teks "GENAP" dengan "GANJIL" akan dijelaskan di tahap selanjutnya.

      ```dart
      // Ubah widget Text ini...
      const Text(
        'You have clicked the button this many times:',
      )
      
      // dengan ini!
      const Text(
        "GENAP",
        style: TextStyle(color: Colors.red),
      )
      ```
      
      Tambahkan satu `FloatingActionButton` dengan icon "-". Sisipkan kedua button di dalam sebuah widget `Row` agar mereka tertata secara horizontal. Atribut `mainAxisAlignment` dan widget `Padding` digunakan untuk menyesuaikan posisi button pada layar.

      ```dart
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 32),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
            FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ],
        ),
      )
      ```

      Perubahan akan terlihat setelah `flutter run` dijalankan kembali. Apabila program sedang aktif, reload program dengan hotkey `r` di *command prompt*.

   3. **Logika Program**

      Logika tombol + sudah terimplementasi saat *generate* program. Untuk logika tombol -, buatlah fungsi `_decrementCounter()`di class `_MyHomePageState`. Apabila fungsi ini dipanggil, variabel `_counter` akan berkurang sebanyak satu. `_counter` hanya akan decrement apabila nilainya lebih dari 0. Jangan lupa untuk menyisipkan logika di dalam fungsi `setState()` agar program dapat *rebuild* tampilan di layar.

      ```dart
      // Pada class _MyHomePageState...
      void _decrementCounter() {
        setState(() {
          if (_counter > 0) {
            _counter--;
          }
        });
      }
      ```
      
      Hubungkan tombol - dengan fungsi `_decrementCounter()` menggunakan atribut `onPressed`.

      ```dart
      FloatingActionButton(
        onPressed: _decrementCounter,
        tooltip: 'Decrement',
        child: const Icon(Icons.remove),
      )
      ```

      Pada widget `build()` di class `_MyHomePageState`, tambahkan satu widget `Text` dengan teks "GANJIL" dengan warna biru. Untuk mengubah antara keduanya, kita dapat menggunakan ternary operator. Sebagai argumen, periksa apabila variabel `_counter` bernilai genap atau ganjil dengan operator modulo.

      ```dart
      children: <Widget>[
        (_counter % 2 == 0) ?
        const Text(
          "GENAP",
          style: TextStyle(color: Colors.red),
        ):
        const Text(
          "GANJIL",
          style: TextStyle(color: Colors.blue)
        ),
        Text(
          '$_counter',
          style: Theme.of(context).textTheme.headline4,
        ),
      ]
      ```

      Perubahan akan terimplemen setelah `flutter run` dijalankan kembali. Apabila program sedang aktif, reload program dengan hotkey `r` di *command prompt*.

   4. **BONUS: Menghilangkan Tombol -**

      Untuk menyembunyikan tombol -, kita dapat memanfaatkan widget `Visibility`. Sebagai argumen untuk atribut `visible`, periksa apabila variabel `_counter` bernilai 0.

      ```dart
      Visibility(
        visible: (_counter == 0) ? false : true,
        child: FloatingActionButton(
          onPressed: _decrementCounter,
          tooltip: 'Decrement',
          child: const Icon(Icons.remove),
        ),
      )
      ```

---

# Tugas 8: Flutter Form

Feru Pratama Kartajaya (2106750351) - Kelas E

### `Navigator.push()` dan `Navigator.pushReplacement()`

   `Navigator.push()` menampilkan halaman dengan melakukan push route baru ke dalam stack navigasi, sedangkan `Navigator.pushReplacement()` melakukan push route baru sekaligus pop route sebelumnya.

### Widget dalam Aplikasi *Budget Tracking*

   Berikut beberapa widget yang digunakan untuk menerapkan program di Tugas 8:

   * `Drawer` - Sub-menu untuk mengakses navigasi
   * `Navigator` dan `MaterialPageRoute` - Navigasi antara halaman-halaman aplikasi
   * `Form` - Definisi form data budget
   * `SingleChildScrollView` - Container untuk form
   * `GlobalKey` - Penanda unik untuk form
   * `TextFormField` - Input dalam bentuk teks karakter
   * `TextInputType` dan `FilteringTextInputFormatter` - Menentukan tipe data yang dapat diinput pada `TextFormField`
   * `TextEditingController` - Mengontrol nilai dari field teks
   * `DateTime` dan `DateFormat` - Memproses tanggal dan waktu
   * `DropdownButton` dan `DropdownMenuItem` - Membentuk pilihan form dalam format dropdown
   * `TextButton` - Tombol untuk menyimpan data budget
   * `SizedBox` -  Menciptakan jarak antara widget
   * `ListView` dan `Card` - Menyajikan setiap data budget yang tersimpan

### Flutter Events

   * `onPressed` dan `onTap`: Terpanggil saat sebuah widget ditekan pada layar
   * `onHover`: Terpanggil saat sebuah *pointer* menunjuk kepada widget yang bersangkutan
   * `onLongPress`: Terpanggil saat sebuah widget ditekan lama pada layar
   * `onFocusChange`: Terpanggil saat fokus berganti antara widget
   * `onChanged`: Terpanggil saat terdapat nilai dari suatu widget yang berubah
   * `onSaved`: Terpanggil saat data form disimpan

### Navigasi Menggunakan `Navigator`

   `Navigator` merupakan sebuah implementasi dari struktur data *stack* yang menyimpan beberapa objek yang disebut `route`. Sebuah `route` menunjuk kepada sebuah layar/halaman dari program dan `Navigator` digunakan untuk menyusun segala `route` yang ada. `Navigator` dapat melakukan `push()` untuk memindahkan `route` baru ke atas *stack* untuk ditampilkan di layar. `Navigator` juga dapat melakukan `pop()` untuk menghilangkan `route` yang ada di atas *stack* dan mengeluarkannya dari tampilan layar.

### Implementasi Navigasi dan Form dalam Aplikasi *Budget Tracking*

   1. **Menambahkan `Drawer` + BONUS: Refactor Widget `Drawer`**

      Pada fungsi `build()` di class `_MyHomePageState`, tambahkan atribut `drawer` pada widget `Scaffold`. Nilai dari atribut tersebut adalah widget `Drawer` dengan susunan `Column`.

      ```dart
      @override
      Widget build(BuildContext context) {
        return Scaffold(   
          [...],
          drawer: Drawer(
            child: Column(),
          ),
          [...],
        )
      }
      ```

      Visual Studio Code menyediakan cara untuk melakukan *refactoring* dengan mudah. Klik kanan pada widget `Drawer` dan pilih `Refactor... > Extract Widget` untuk menciptakan class widget baru. Widget yang diciptakan akan muncul di bagian file paling bawah. Untuk aplikasi ini, widget yang dibuat dinamakan `NavDrawer`.

      ```dart
      class NavDrawer extends StatelessWidget {
        const NavDrawer({
          Key? key,
        }) : super(key: key);

        @override
        Widget build(BuildContext context) {
          return Drawer(
            child: Column(),
          );
        }
      }
      ```

      Di folder `lib`, buatlah file baru bernama `nav_drawer.dart` dan pindahkan widget NavDrawer ke file tersebut.

      ```dart
      import 'package:flutter/material.dart';

      class NavDrawer extends StatelessWidget {
        [...]
      }
      ```

      Di `main.dart`, import widget `NavDrawer` dan gunakan widget tersebut sebagai nilai atribut `drawer` pada fungsi `build()`.

      ```dart
      import 'package:counter_7/nav_drawer.dart';
      ```
      ```dart
      @override
      Widget build(BuildContext context) {
        return Scaffold(   
          [...],
          drawer: const NavDrawer(),
          [...],
        )
      }
      ```

      Sekarang, menu `Drawer` kosong dapat diakses melalui tombol di `AppBar` aplikasi.

   2. **Menambahkan Navigasi Halaman**

      Di folder `lib`, buatlah file baru bernama `budget_form.dart` dan `budget_data.dart`. Definisikan class `StatefulWidget` untuk kedua halaman beserta `State` dari halaman tersebut. Import widget `NavDrawer` agar dapat diletakkan pada kedua halaman tersebut.

      ```dart
      // Contoh: budget_form.dart

      import 'package:flutter/material.dart';
      import 'package:counter_7/nav_drawer.dart';

      class MyBudgetFormPage extends StatefulWidget {
        const MyBudgetFormPage({super.key});
        final String title = 'Form Budget';

        @override
        State<MyBudgetFormPage> createState() => _MyBudgetFormPageState();
      }

      class _MyBudgetFormPageState extends State<MyBudgetFormPage> {
        @override
        Widget build(BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
            ),
            drawer: const NavDrawer(),
          );
        }
      }
      ```

      Di `nav_drawer.dart`, import ketiga halaman aplikasi dan tambahkan opsi untuk setiap halaman di dalam drawer menggunakan widget `ListTile`. Gunakan widget `Navigator` untuk berpindah antara ketiga halaman saat opsi dipilih.

      ```dart
      import 'package:counter_7/main.dart';
      import 'package:counter_7/budget_form.dart';
      import 'package:counter_7/budget_data.dart';
      ```
      ```dart
      child: Column(
        children: [
          ListTile(
            title: const Text('counter_7'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage()),
              );
            },
          ),
          ListTile(
            title: const Text('Tambah Budget'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyBudgetFormPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Data Budget'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyBudgetDataPage()),
              );
            },
          ),
        ],
      )
      ```

      Sekarang, menu `Drawer` berisi opsi-opsi untuk navigasi antara ketiga halaman.

   3. **Menambahkan Halaman Form + BONUS: Date Picker**

      Pada class `_MyBudgetFormPageState` di `budget_form.dart`, buatlah sebuah widget `Form` untuk mengisi data budget. Buatlah juga sebuah variabel GlobalKey `_formKey` sebagai nilai atribut `key`. Field-field dari form akan disisipkan di dalam widget `Column`.

      ```dart
      final _formKey = GlobalKey<FormState>();

      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0), 
            child: Column(
              children: []
            ),
          )
        ),
      )
      ```

      Widget `TextFormField` dapat digunakan untuk menerima data judul, nominal, dan tanggal budget. Tambahkan juga variabel yang sesuai untuk menampung input. Atribut `decoration` digunakan untuk memberi border pada `TextFormField` dan memberikan teks petunjuk untuk setiap kolom data. Atribut `onChanged` dan `onSaved` digunakan untuk menyimpan input setiap ada perubahan. Atribut `validator` berlaku sebagai validasi input dan akan memberitahu user apabila input tidak valid.

      ```dart
      String _judulBudget = '';

      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          decoration: InputDecoration(
            hintText: "Judul",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          onChanged: (String? value) {
            setState(() {
              _judulBudget = value!;
            });
          },
          onSaved: (String? value) {
            setState(() {
              _judulBudget = value!;
            });
          },
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return 'Judul tidak dapat kosong. Coba lagi!';
            }
            return null;
          },
        ),
      )
      ```

      Kode yang sama digunakan untuk elemen input nominal budget, dengan sedikit perubahan untuk menyimpan nilai dalam tipe data `int`.

      ```dart
      import 'package:flutter/services.dart';
      ```
      ```dart
      int _nominalBudget = 0;

      // Input terbatas digit angka
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      ```
      ```dart
      // Menyimpan input dalam tipe data int
      onChanged: (String? value) {
        setState(() {
          _nominalBudget = int.parse(value!);
        });
      },
      ```

      Kode yang sama digunakan untuk elemen input tanggal budget, dengan sedikit perubahan untuk memilih input menggunakan widget `showDatePicker`.

      ```dart
      import 'package:intl/intl.dart'; // NOTE: Penggunaan package intl memerlukan update dependensi di pubspec.lock dan pubspec.yaml
      ```
      ```dart
      String _tanggalBudget = 'No date recorded';
      final TextEditingController _tanggalInput = TextEditingController();

      //Mengontrol display input pada TextFormField
      controller: _tanggalInput,
      ```
      ```dart
      // Mengisi dan menyimpan input tanggal
      readOnly: true,
      onTap: () {
        showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        ).then((date) {
          setState(() {
            _tanggalBudget = DateFormat('dd/MM/yyyy').format(date!);
            _tanggalInput.text = _tanggalBudget;
          });
        });
      }
      ```

      Widget `DropdownButton` dapat digunakan untu menerima data tipe budget. Sebuah list `listTipeBudget` menampung opsi tipe budget yang dapat dipilih oleh user.

      ```dart
      String? _tipeBudget;
      List<String> listTipeBudget = ['Pemasukan', 'Pengeluaran'];

      DropdownButton(
        value: tipeBudget,
        icon: const Icon(Icons.keyboard_arrow_down),
        hint: const Text('Pilih Jenis'),
        items: listTipeBudget.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            tipeBudget = newValue!;
          });
        },
      )
      ```

      Widget `TextButton` digunakan untuk meng-submit input form. Saat tombol ditekan, sebuah kotak dialog akan muncul yang menandakan bahwa data budget berhasil disimpan. Penyimpanan data input form oleh program akan dibahas di langkah berikutnya.

      ```dart
      TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue),
        ),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 15,
                  child: ListView(
                    padding: const EdgeInsets.only(top: 20),
                    shrinkWrap: true,
                    children: <Widget>[
                      const Center(child: Text('Data budget berhasil disimpan!')),
                      const SizedBox(height: 20),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Kembali'),
                      ), 
                    ],
                  ),
                );
              },
            );
          }
        },
        child: const Text(
          "Simpan",
          style: TextStyle(color: Colors.white),
        ),
      )
      ```

   4. **Menampilkan Halaman Data Budget + BONUS: Menampilkan Date Budget**

      Di `budget_data.dart`, buatlah sebuah variabel list `budgetData` dan import `budget_data.dart` di file `budget_form.dart`. Variabel ini berlaku sebagai tempat menyimpan data budget yang akan ditampilkan.

      ```dart
      // Di budget_data.dart...
      List budgetData = [];

      // Di budget_form.dart...
      import 'package:counter_7/budget_data.dart';
      ```

      Pada tombol untuk meng-submit form budget di `budget_form.dart`, tambahkan barisan kode untuk menyimpan semua data input dalam sebuah list dan menyisipkannya ke dalam `budgetData`.

      ```dart
      if (_formKey.currentState!.validate()) {
        budgetData.add([_judulBudget, _nominalBudget, _tanggalBudget, _tipeBudget]);
        showDialog(...)
      ```

      Di `budget_data.dart`, widget `Card` dan for loop dapat digunakan untuk menampilkan semua data budget yand ada dalam `budgetData`. `ListView` digunakan untuk menampung Card sehingga dapat meng-scroll layar apabila jumlah data cukup banyak.

      ```dart
      Center(
        child: ListView(
          children: [
            for (var data in budgetData)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        data[0],
                        style: const TextStyle(fontSize: 24),
                        textAlign: TextAlign.center,
                      ),
                      Text(data[2]),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(data[1].toString()),
                          Text(data[3]),
                        ],
                      ),
                    ],
                  ),
                )
              ),
          ],
        ),
      )
      ```