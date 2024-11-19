import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/person.dart';
import '../../../viewmodel/graph/bloc/graph_bloc.dart';

class GraphNode extends StatelessWidget {
  const GraphNode({super.key, required this.name, required this.parent});
  final String name;
  final int parent;

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    return Row(
      children: [
        SizedBox(
          width: 20,
        ),
        Text('Name: $name'),
        IconButton(
            onPressed: () {
              showDialog<String>(
                context: context,
                builder: (BuildContext ctx) => AlertDialog(
                  title: const Text('Add New Person'),
                  content: Column(
                    children: [
                      TextField(
                        controller: nameController,
                      )
                    ],
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(ctx, 'Cancel'),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        context.read<GraphBloc>().add(
                              GraphAdded(
                                person: Person(
                                  name: nameController.text,
                                  title: 'abc',
                                  dept: 'abc',
                                  pic: 'abc',
                                  email: 'abc',
                                  phone: 'acb',
                                  parent: parent,
                                ),
                              ),
                            );
                        Navigator.pop(ctx);
                      },
                      child: const Text('Thêm'),
                    ),
                  ],
                ),
              );
            },
            icon: Icon(Icons.add))
      ],
    );
  }
}
