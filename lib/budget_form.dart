import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:counter_7/nav_drawer.dart';
import 'package:counter_7/budget_data.dart';

class MyBudgetFormPage extends StatefulWidget {
  const MyBudgetFormPage({super.key});
  final String title = 'Form Budget';

  @override
  State<MyBudgetFormPage> createState() => _MyBudgetFormPageState();
}

class _MyBudgetFormPageState extends State<MyBudgetFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _judulBudget = '';
  int _nominalBudget = 0;
  String? _tipeBudget;
  List<String> listTipeBudget = ['Pemasukan', 'Pengeluaran'];

  String _tanggalBudget = 'No date recorded';
  final TextEditingController _tanggalInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: const NavDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0), 
            child: Column(
              children: [
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
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Nominal",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    // Menambahkan behavior saat nama diketik 
                    onChanged: (String? value) {
                      setState(() {
                        _nominalBudget = int.parse(value!);
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _nominalBudget = int.parse(value!);
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Nominal tidak dapat kosong. Coba lagi!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _tanggalInput,
                    decoration: InputDecoration(
                      hintText: "Tanggal",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    readOnly: true,
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      ).then((date) {  //tambahkan setState dan panggil variabel _dateTime.
                        setState(() {
                          _tanggalBudget = DateFormat('dd/MM/yyyy').format(date!);
                          _tanggalInput.text = _tanggalBudget;
                        });
                      });
                    },
                  ),
                ),
                DropdownButton(
                  value: _tipeBudget,
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
                      _tipeBudget = newValue!;
                    });
                  },
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      budgetData.add([_judulBudget, _nominalBudget, _tanggalBudget, _tipeBudget]);
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
                ),
              ]
            ),
          )
        ),
      ),
    );
  }
}