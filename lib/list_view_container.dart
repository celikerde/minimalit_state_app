import 'package:flutter/material.dart';
import 'package:minimalist_state/list_view_state.dart';
import 'package:minimalist_state/service_locator.dart';

class ListViewContainer extends StatelessWidget {
  const ListViewContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final state = getIt.get<ListViewState>();
    return ListView(
      children: state.posts
          .map(
            (post) => ListTile(
              leading: CircleAvatar(
                child: Text("${post.id}"),
              ),
              title: Text(
                post.title,
                style: TextStyle(color: Colors.red),
              ),
              subtitle: Text(post.body),
            ),
          )
          .toList(),
    );
  }
}
