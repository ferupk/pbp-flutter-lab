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