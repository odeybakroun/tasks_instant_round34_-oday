import 'package:flutter/material.dart';
import 'post_notifier.dart';

class PostPage extends StatelessWidget {
  final PostNotifier vm;
  const PostPage({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Posts")),
      body: AnimatedBuilder(
        animation: vm,
        builder: (context, _) {
          if (vm.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (vm.posts.isEmpty) return const Center(child: Text("No users"));
          return ListView.builder(
            itemCount: vm.posts.length,
            itemBuilder: (_, i) => ListTile(
              title: Text(vm.posts[i].name),
              subtitle: Text("ID: ${vm.posts[i].id}"),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: vm.load,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
