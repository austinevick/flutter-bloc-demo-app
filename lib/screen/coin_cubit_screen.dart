import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/coin_cubit.dart';
import '../bloc/coin_state.dart';

class CoinCubitScreen extends StatelessWidget {
  const CoinCubitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Bloc demo'),
      ),
      body: BlocBuilder<CoinCubit, CoinState>(builder: (context, state) {
        if (state is CoinInitial) {
          context.read<CoinCubit>().fetchData();
          return const Center(child: CircularProgressIndicator());
        } else if (state is CoinLoading) {
          return ListView.builder(
              itemCount: state.data.length,
              itemBuilder: (ctx, i) {
                final data = state.data[i];
                return ListTile(
                  leading: CircleAvatar(child: Text(i.toString())),
                  title: Text(data.fullName!),
                );
              });
        } else if (state is CoinError) {
          return Center(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.message, textAlign: TextAlign.center),
                TextButton(
                    onPressed: () => context.read<CoinCubit>().fetchData(),
                    child: const Text('Retry'))
              ],
            ),
          ));
        } else {
          return const SizedBox.shrink();
        }
      }),
    );
  }
}
