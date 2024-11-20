import 'package:flutter/material.dart';
import 'package:minimalist_state/list_view_state.dart';
import 'package:minimalist_state/post.dart';
import 'package:minimalist_state/service_locator.dart';

class ListViewContainer extends StatelessWidget {
  const ListViewContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final state = getIt.get<ListViewState>();
    return ValueListenableBuilder<List<Post>>(
        valueListenable: state.postsNotifier,
        builder: (context, postsValue, _) {
          return ListView(
            children: postsValue
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
                    trailing: IconButton(
                      onPressed: () {
                        state.postsNotifier.removePostTapped(post);
                      },
                      icon: Icon(Icons.remove_circle),
                    ),
                  ),
                )
                .toList(),
          );
        });
  }
}
