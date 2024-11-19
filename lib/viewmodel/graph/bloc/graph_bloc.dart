import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:family_tree_test/models/person.dart';
import 'package:family_tree_test/repository/graph_repo/graph_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphview/GraphView.dart';
import 'package:isar/isar.dart';

part 'graph_event.dart';
part 'graph_state.dart';

class GraphBloc extends Bloc<GraphEvent, GraphState> {
  GraphBloc({required this.graphRepository}) : super(GraphInitial()) {
    on<GraphFetched>(_onFetched);
    on<GraphAdded>(_onAdded);
    on<GraphUpdated>(_onUpdated);
  }

  late Graph graph;
  final GraphRepository graphRepository;
  late List<Person> persons;

  FutureOr<void> _onFetched(
      GraphFetched event, Emitter<GraphState> emit) async {
    emit(GraphLoading());
    try {
      persons = await graphRepository.fetchDataFromIsar();
      graph = Graph()..isTree = true;
      for (final person in persons) {
        final fromId = person.parent;
        final toId = person.key;
        if (person.parent != null) {
          graph.addEdge(Node.Id(fromId), Node.Id(toId));
        }
      }
      emit(GraphSucceed(graph: graph, persons: persons));
    } catch (e) {
      emit(GraphFailed(error: e.toString()));
    }
  }

  FutureOr<void> _onAdded(GraphAdded event, Emitter<GraphState> emit) async {
    if (state is GraphSucceed) {
      try {
        final currentState = state as GraphSucceed;
        await graphRepository.addNodeToIsar(person: event.person);
        final newPerson = event.person;
        var node = Node.Id(newPerson.key);
        graph.addNode(node);
        if (newPerson.parent != null) {
          graph.addEdge(Node.Id(newPerson.parent), node);
        }
        final updatedPersons = List<Person>.from(currentState.persons)
          ..add(newPerson);
        emit(currentState.copyWith(
          graph: graph,
          persons: updatedPersons,
        ));
      } catch (e) {
        emit(GraphFailed(error: e.toString()));
      }
    }
  }

  FutureOr<void> _onUpdated(GraphUpdated event, Emitter<GraphState> emit) {}
}
