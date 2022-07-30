import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/todo_cubit.dart';
import '../cubit/todo_state.dart';

class TodoCubitScreen extends StatelessWidget {
  const TodoCubitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Bloc demo'),
      ),
      body: BlocBuilder<TodoCubit, TodoState>(builder: (context, state) {
        if (state is TodoInitial) {
          context.read<TodoCubit>().fetchData();
          return const Center(child: CircularProgressIndicator());
        } else if (state is TodoLoading) {
          return ListView.builder(
              itemCount: state.data.length,
              itemBuilder: (ctx, i) {
                final data = state.data[i];
                return ListTile(
                  leading: CircleAvatar(child: Text(i.toString())),
                  title: Text(data.title!),
                );
              });
        } else if (state is TodoError) {
          return Center(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.message, textAlign: TextAlign.center),
                TextButton(
                    onPressed: () => context.read<TodoCubit>().fetchData(),
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
