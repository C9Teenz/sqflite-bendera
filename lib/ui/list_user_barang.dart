import 'package:crud_bendera/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/list_barang_user/list_barang_user_bloc.dart';

class ListBarangUser extends StatelessWidget {
  const ListBarangUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const HomePage(),
              ));
            },
            icon: const Icon(Icons.home),
          ),
        ],
      ),
      body: BlocBuilder<ListBarangUserBloc, ListBarangUserState>(
        builder: (context, state) {
          if (state is ListBarangUserloaded) {
            final datas = state.barangUser;
            return ListView.builder(
              itemCount: datas.length,
              itemBuilder: (context, index) {
                final data = datas[index];
                return ListTile(
                  title: Text('${data.name}--Suplayer:${data.suplayer}'),
                  subtitle: Text(
                      '${data.quantity!.toString()}--Harga${data.harga.toString()} '),
                  leading: const CircleAvatar(),
                );
              },
            );
          } else if (state is ListBarangUserLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Center(
              child: Text("Data Kosong"),
            );
          }
        },
      ),
    );
  }
}
