import 'package:family_tree_test/view/graph/widget/graph_node.dart';
import 'package:family_tree_test/viewmodel/graph/bloc/graph_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphview/GraphView.dart';

class GraphWidget extends StatefulWidget {
  const GraphWidget({super.key});

  @override
  State<GraphWidget> createState() => _GraphWidgetState();
}

class _GraphWidgetState extends State<GraphWidget> {
  late BuchheimWalkerConfiguration builder;
  late TransformationController _transformationController;

  @override
  void initState() {
    super.initState();
    _transformationController = TransformationController();
    builder = BuchheimWalkerConfiguration()
      ..siblingSeparation = (0)
      ..levelSeparation = (40)
      ..subtreeSeparation = (0)
      ..orientation = (BuchheimWalkerConfiguration.ORIENTATION_LEFT_RIGHT);
    _transformationController.value = Matrix4.identity()
      ..scale(0.4)
      ..setTranslationRaw(0, 0, 0);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _transformationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('graph'),
      ),
      body: BlocBuilder<GraphBloc, GraphState>(builder: (context, state) {
        if (state is GraphLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is GraphSucceed) {
          return RepaintBoundary(
            child: InteractiveViewer(
              transformationController: _transformationController,
              constrained: false,
              maxScale: 6,
              minScale: 0.1,
              boundaryMargin: EdgeInsets.all(50),
              child: GraphView(
                graph: state.graph,
                algorithm:
                    BuchheimWalkerAlgorithm(builder, TreeEdgeRenderer(builder)),
                paint: Paint()
                  ..color = Colors.grey
                  ..strokeWidth = 0.5
                  ..style = PaintingStyle.stroke,
                builder: (Node node) {
                  return GraphNode(
                    name: state.persons[node.key?.value - 1].title,
                    parent: node.key?.value,
                  );
                },
              ),
            ),
          );
        } else if (state is GraphFailed) {
          return Center(
            child: Text('error: ${state.error}'),
          );
        }
        return Center(
          child: Text('No data'),
        );
      }),
    );
  }
}
