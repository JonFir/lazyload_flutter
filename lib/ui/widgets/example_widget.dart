import 'package:dart_lesson/domain/blocs/users_cubit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExampleWidget extends StatelessWidget {
  const ExampleWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              _AgeTitle(),
              _AgeIncrementWidget(),
              _AgeDecrementWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class _AgeTitle extends StatelessWidget {
  const _AgeTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UsersCubit>();
    return StreamBuilder<UsersState>(
      initialData: cubit.state,
      stream: cubit.stream,
      builder: (context, snapshot) {
        final age = snapshot.requireData.currentUser.age;
        return Text("$age");
      },
    );
  }
}

class _AgeIncrementWidget extends StatelessWidget {
  const _AgeIncrementWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UsersCubit>();
    return ElevatedButton(
      onPressed: cubit.incrementAge,
      child: const Text('+'),
    );
  }
}

class _AgeDecrementWidget extends StatelessWidget {
  const _AgeDecrementWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UsersCubit>();
    return ElevatedButton(
      onPressed: cubit.decrementAge,
      child: const Text('-'),
    );
  }
}
