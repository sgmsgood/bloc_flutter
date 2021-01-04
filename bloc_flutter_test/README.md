# bloc_flutter_test
* Reference: https://pub.dev/packages/flutter_bloc

## Bloc Widget
##### BlocBuilder
1. 'BlocBuilder'는 Cubit과 builder 함수를 요합니다.
2. 'BlocBuilder'는 새로운 요청에 따른 응답으로 widget을 다룹니다.
3. 'BlocBuilder'는 StreamBuilder와 매우 유사하지만, bolierplate code의 양을 줄이는 훨씬 간단한 API를 가지고 있습니다.
4. builder 함수는 잠재적으로 여러번 호출될 수 있으므로 반드시 '순수함수(Pure fuction)'로 구현하여 상태에 따라 응답을 반환하도록 해야합니다.




