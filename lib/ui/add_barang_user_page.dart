// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:crud_bendera/bloc/barang_user/barang_user_bloc.dart';
import 'package:crud_bendera/bloc/list_barang_user/list_barang_user_bloc.dart';
import 'package:crud_bendera/ui/list_user_barang.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/edit_barang/edit_barang_bloc.dart';

class AddBarangUserPage extends StatelessWidget {
  final String x;
  const AddBarangUserPage({
    Key? key,
    required this.x,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocBuilder<EditBarangBloc, EditBarangState>(
            builder: (context, state) {
              if (state is EditBarangLoaded) {
                return Column(
                  children: [
                    const Text(
                      "Barang: ",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nama: ${state.data.name}",
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w400),
                          ),
                          Container(
                            width: double.infinity,
                            height: 1,
                            color: Colors.grey[200],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Quantity: ${state.data.quantity}",
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w400),
                          ),
                          Container(
                            width: double.infinity,
                            height: 1,
                            color: Colors.grey[200],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Harga: ${state.data.harga}",
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w400),
                          ),
                          Container(
                            width: double.infinity,
                            height: 1,
                            color: Colors.grey[200],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Suplayer: ${state.data.suplayer} ",
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w400),
                          ),
                          Container(
                            width: double.infinity,
                            height: 1,
                            color: Colors.grey[200],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: Align(
                      alignment: Alignment.bottomCenter,
                      child: BlocListener<BarangUserBloc, BarangUserState>(
                        listener: (context, state) {
                          if (state is BarangUserSuccess) {
                            context
                                  .read<ListBarangUserBloc>()
                                  .add(OnListBarangUserEvent(name: x));
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) => const ListBarangUser(),
                            ));
                          }
                        },
                        child: ElevatedButton(
                            onPressed: () {
                              context
                                  .read<ListBarangUserBloc>()
                                  .add(OnListBarangUserEvent(name: x));
                              context.read<BarangUserBloc>().add(
                                  AddBarangUserEvent(
                                      name: x, barang: state.data));
                            },
                            child: const Text("add barang")),
                      ),
                    ))
                  ],
                );
              } else if (state is EditBarangLoading) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return const Center(child: Text("No data"));
              }
            },
          ),
        ),
      ),
    );
  }
}
