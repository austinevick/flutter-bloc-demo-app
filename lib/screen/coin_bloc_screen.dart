import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/bloc/coin_bloc.dart';
import 'package:flutter_bloc_app/bloc/coin_event.dart';

import '../bloc/coin_state.dart';

class CoinBlocScreen extends StatelessWidget {
  const CoinBlocScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Bloc demo'),
      ),
      body: BlocBuilder<CoinBloc, CoinState>(builder: (context, state) {
        if (state is CoinInitial) {
          context.read<CoinBloc>().add(AppStarted());
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
                    onPressed: () => context.read<CoinBloc>().add(AppStarted()),
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
