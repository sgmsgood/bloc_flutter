# bloc_flutter_test
* Reference: https://pub.dev/packages/flutter_bloc

## Bloc Widget
### BlocBuilder
1. 'BlocBuilder'는 Cubit과 builder 함수를 요합니다.
2. 'BlocBuilder'는 새로운 요청에 따른 응답으로 widget을 다룹니다.
3. 'BlocBuilder'는 StreamBuilder와 매우 유사하지만, bolierplate code의 양을 줄이는 훨씬 간단한 API를 가지고 있습니다.
4. builder 함수는 잠재적으로 여러번 호출될 수 있으므로 반드시 '순수함수(Pure fuction)'로 구현하여 상태에 따라 응답을 반환하도록 해야합니다.

#### BlocListener
* 만약 당신이 '내비게이션'이나, '다이얼로그 보여주기'와 같은 상태 변화에 따른 응답으로 무언가를 하고 싶다면 BlocListener를 보세요.
* 만약 'BlocListener'이 생략되었다면, BlocBuilder는 자동으로 BlocProvider와 BuildContext를 사용하여 lookup을 수행합니다.

```dart
BlocBuilder<ThemeCubit, ThemeData>(
  builder: (_, theme) {
    /// ThemeCubit의 상태를 기반으로 Widget을 return 합니다.
    return MaterialApp(
      theme: theme,
      home: BlocProvider(
          create: (_) => CounterBloc(),
          child: CounterPage(),
      ),
    );
  },
)
```

#### cubit
* 단일 위젯만 영역으로 잡는 cubit을 제공하길 원한다면 cubit을 특정화하세요.
* 단, 이것은 부모의 BlocProvider와 현재의 BuildContext에 접근할 수 없습니다.
```dart
BlocBuilder<BlocA, BlocAState>(
  cubit: blocA, // provide the local bloc instance
  builder: (context, state) {
    // return widget here based on BlocA's state
  }
)
```

#### buildWhen
* 'buildWhen'는 과거와 현재의 cubit 상태를 취함으로써 boolean 값을 반환합니다.
* 'buildWhen' == true : builder는 rebuild될 state와 함께 요청됩니다.
* 'buildWhen' == false : builder는 state를 요청하지 않으며 rebuild도 발생하지 않습니다.
```dart
BlocBuilder<BlocA, BlocAState>(
  buildWhen: (previousState, state) {
    // return true/false to determine whether or not
    // to rebuild the widget with state
  },
  builder: (context, state) {
    // return widget here based on BlocA's state
  }
)
```

 


