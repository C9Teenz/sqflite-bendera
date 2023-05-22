import 'package:crud_bendera/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/add_barang/barang_bloc.dart';
import '../bloc/home/home_bloc.dart';

class AddBarangPage extends StatefulWidget {
  const AddBarangPage({super.key});

  @override
  State<AddBarangPage> createState() => _AddBarangPageState();
}

class _AddBarangPageState extends State<AddBarangPage> {
  TextEditingController nameC = TextEditingController();
  TextEditingController quantityC = TextEditingController();
  TextEditingController hargaC = TextEditingController();
  TextEditingController suplayerC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const Text(
                "Add Barang",
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(
                height: 32,
              ),
              TextFormField(
                controller: nameC,
                decoration: const InputDecoration(labelText: "Name"),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: quantityC,
                decoration: const InputDecoration(labelText: "Quantity"),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: hargaC,
                decoration: const InputDecoration(labelText: "Harga"),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: suplayerC,
                decoration: const InputDecoration(labelText: "Suplayer"),
              ),
              const SizedBox(
                height: 16,
              ),
              BlocListener<BarangBloc, BarangState>(
                listener: (context, state) {
                  if (state is BarangLoaded) {
                    nameC.clear();
                    quantityC.clear();
                    context.read<HomeBloc>().add(GetBarangEvent());
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ));
                  }
                },
                child: ElevatedButton(
                    onPressed: () {
                      Map<String, dynamic> row = {
                        "name": nameC.text,
                        "quantity": int.parse(quantityC.text),
                        "harga": int.parse(hargaC.text),
                        "suplayer": suplayerC.text
                      };
                      context.read<BarangBloc>().add(AddBarangEvent(row));
                    },
                    child: const Text("Add barang")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
