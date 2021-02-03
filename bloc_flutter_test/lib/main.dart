import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  var _counterCubit1 = CounterCubit();
  var _counterCubit2 = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (_, theme) {
          return MaterialApp(
              theme: theme,
              home: BlocProvider(
                create: (_) => CounterCubit(),
                child: Column(
                  children: [
                    Expanded(
                      child: Scaffold(
                        appBar: AppBar(title: const Text('Counter')),
                        body: BlocBuilder<CounterCubit, int>(
                          builder: (_, count) {
                            log("@!!count: $count");
                            return Column(
                              children: [
                                Center(
                                  child: Text('$count',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline1),
                                ),
                              ],
                            );
                          },
                        ),
                        floatingActionButton: CounterPage(),
                      ),
                    ),
                    Expanded(
                      child: Scaffold(
                        appBar: AppBar(title: const Text('Counter')),
                        body: BlocBuilder<CounterCubit, int>(
                          cubit: _counterCubit1,
                          builder: (_, count) {
                            log("@!!count: $count");
                            return Column(
                              children: [
                                Center(
                                  child: Text('$count',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline1),
                                ),
                              ],
                            );
                          },
                        ),
                        floatingActionButton: CounterPage(),
                      ),
                    ),
                  ],
                ),
              ));
        },
      ),
    );
  }
}

class CounterPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              context.read<CounterCubit>().increment();
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: FloatingActionButton(
            child: const Icon(Icons.remove),
            onPressed: () {
              context.read<CounterCubit>().decrement();
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: FloatingActionButton(
            child: const Icon(Icons.brightness_6),
            onPressed: () => context.read<ThemeCubit>().toggleTheme(),
          ),
        ),
      ],
    );
  }
}

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => {log("@!!state: $state"), emit(state + 1)};

  void decrement() => {log("@!!state: $state"), emit(state - 1)};
}

class ThemeCubit extends Cubit<ThemeData> {
  /// {@macro brightness_cubit}
  ThemeCubit() : super(_lightTheme);

  static final _lightTheme = ThemeData(
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
    ),
    brightness: Brightness.light,
  );

  static final _darkTheme = ThemeData(
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.black,
    ),
    brightness: Brightness.dark,
  );

  /// Toggles the current brightness between light and dark.
  void toggleTheme() {
    emit(state.brightness == Brightness.dark ? _lightTheme : _darkTheme);
  }
}
