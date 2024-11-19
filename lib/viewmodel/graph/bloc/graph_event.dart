part of 'graph_bloc.dart';

sealed class GraphEvent extends Equatable {
  const GraphEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class GraphFetched extends GraphEvent {}

final class GraphAdded extends GraphEvent {
  final Person person;

  const GraphAdded({required this.person});
  @override
  // TODO: implement props
  List<Object?> get props => [person];
}

final class GraphUpdated extends GraphEvent {
  final Id id;
  final Person person;

  const GraphUpdated({required this.id, required this.person});
  @override
  // TODO: implement props
  List<Object?> get props => [id, person];
}
