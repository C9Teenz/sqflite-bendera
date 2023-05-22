import 'package:crud_bendera/bloc/edit_barang/edit_barang_bloc.dart';

import 'package:crud_bendera/ui/add_barang_page.dart';
import 'package:crud_bendera/ui/edit_barang_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home/home_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is HomeSuccessDelete) {
            context.read<HomeBloc>().add(GetBarangEvent());
          }
        },
        builder: (context, state) {
          return BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is HomeLoaded) {
                if (state.barang.isNotEmpty) {
                  final datas = state.barang;
                  return ListView.builder(
                    itemCount: datas.length,
                    itemBuilder: (context, index) {
                      final data = datas[index];
                      return GestureDetector(
                        onTap: () async {
                          context
                              .read<EditBarangBloc>()
                              .add(OneBarangEvent(data.id));
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => EditBarangPage(id: data.id),
                          ));
                        },
                        child: ListTile(
                          title:
                              Text('${data.name}--Suplayer:${data.suplayer}'),
                          subtitle: Text(
                              '${data.quantity!.toString()}--Harga${data.harga.toString()} '),
                          leading: const CircleAvatar(),
                          trailing: GestureDetector(
                              onTap: () {
                                context
                                    .read<HomeBloc>()
                                    .add(DeleteBarangEvent(data.id));
                              },
                              child: const Icon(Icons.delete)),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(child: Text("No data"));
                }
              }
              return const Center(child: Text("No data"));
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddBarangPage(),
            ),
          );
        },
        child: const Icon(Icons.add_chart),
      ),
    );
  }
}
