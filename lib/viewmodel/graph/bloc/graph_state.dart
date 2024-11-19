part of 'graph_bloc.dart';

sealed class GraphState extends Equatable {
  const GraphState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class GraphInitial extends GraphState {}

final class GraphLoading extends GraphState {}

final class GraphSucceed extends GraphState {
  final Graph graph;
  final List<Person> persons;
  const GraphSucceed({required this.graph, required this.persons});

  @override
  List<Object> get props => [graph, persons];

  GraphSucceed copyWith({
    Graph? graph,
    List<Person>? persons,
  }) {
    return GraphSucceed(
      graph: graph ?? this.graph,
      persons: persons ?? this.persons,
    );
  }
}

final class GraphFailed extends GraphState {
  final String error;

  const GraphFailed({required this.error});
  @override
  List<Object> get props => [error];
}
