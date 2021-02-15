import 'package:equatable/equatable.dart';

abstract class FilteredTodosEvent extends Equatable {
  const FilteredTodosEvent();
}

class UpdateFilter extends FilteredTodosEvent {
  final VisibilityFilter filter;
  const UpdateFilter(this.filter);

  @override
  List<Object> get props => [filter];

  @override
  String toString() => 'UpdateFilter { filter: $filter}';
}