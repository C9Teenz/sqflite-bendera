// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:crud_bendera/bloc/home/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/edit_barang/edit_barang_bloc.dart';
import 'home_page.dart';

class EditBarangPage extends StatefulWidget {
  final int id;
  const EditBarangPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<EditBarangPage> createState() => _EditBarangPageState();
}

class _EditBarangPageState extends State<EditBarangPage> {
  TextEditingController nameC = TextEditingController();
  TextEditingController quantityC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: BlocConsumer<EditBarangBloc, EditBarangState>(
            listener: (context, state) {
              if (state is EditBarangSuccess) {
                context.read<HomeBloc>().add(GetBarangEvent());
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ));
              }
            },
            builder: (context, state) {
              return BlocBuilder<EditBarangBloc, EditBarangState>(
                builder: (context, state) {
                  if (state is EditBarangLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is EditBarangLoaded) {
                    nameC.text = state.data.name!;
                    quantityC.text = state.data.quantity!.toString();
                    return Column(
                      children: [
                        const Text(
                          "Edit Barang",
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
                          decoration:
                              const InputDecoration(labelText: "Quantity"),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Map<String, dynamic> row = {};
                              if (nameC.text.isEmpty &&
                                  quantityC.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            "Nama Barang dan quantity tidak boleh kosong")));
                              } else if (nameC.text.isEmpty &&
                                  quantityC.text.isNotEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            "Nama Barang tidak boleh kosong")));
                              } else if (nameC.text.isNotEmpty &&
                                  quantityC.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            "Quantity tidak boleh kosong")));
                              } else {
                                row["_id"] = state.data.id;
                                row["name"] = nameC.text;
                                row["quantity"] = int.parse(quantityC.text);

                                context
                                    .read<EditBarangBloc>()
                                    .add(OnEditBarangEvent(row));
                              }
                            },
                            child: const Text("Edit Data Barang"))
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        const Text(
                          "Edit Barang",
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
                          decoration:
                              const InputDecoration(labelText: "Quantity"),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const ElevatedButton(
                            onPressed: null, child: Text("Edit Data Barang"))
                      ],
                    );
                  }
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
