import 'package:flutter/material.dart';
import 'package:minimalist_state/post.dart';

class ListViewState {
  MyListViewNotifier<Post> postsNotifier = MyListViewNotifier([
    Post(
        userId: 1,
        id: 1,
        title:
            "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
        body:
            "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"),
    Post(
        userId: 1,
        id: 2,
        title: "qui est esse",
        body:
            "est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non debitis possimus qui neque nisi nulla"),
    Post(
      userId: 1,
      id: 3,
      title: "ea molestias quasi exercitationem repellat qui ipsa sit aut",
      body:
          "et iusto sed quo iure\nvoluptatem occaecati omnis eligendi aut ad\nvoluptatem doloribus vel accusantium quis pariatur\nmolestiae porro eius odio et labore et velit aut",
    ),
    Post(
      userId: 1,
      id: 4,
      title: "eum et est occaecati",
      body:
          "ullam et saepe reiciendis voluptatem adipisci\nsit amet autem assumenda provident rerum culpa\nquis hic commodi nesciunt rem tenetur doloremque ipsam iure\nquis sunt voluptatem rerum illo velit",
    ),
  ]);
}

class MyListViewNotifier<T> extends ValueNotifier<List<T>> {
  MyListViewNotifier(super.value);
  void removePostTapped(T post) {
    value.remove(post);
    notifyListeners();
  }

  void addPostTapped(T post) {
    value.add(post);
    notifyListeners();
  }
}
