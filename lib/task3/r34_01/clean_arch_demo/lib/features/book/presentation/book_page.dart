import 'package:flutter/material.dart';
import 'book_notifier.dart';

class UserPage extends StatelessWidget {
  final BookNotifier vm;
  const UserPage({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Users")),
      body: AnimatedBuilder(
        animation: vm,
        builder: (context, _) {
          if (vm.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (vm.users.isEmpty) return const Center(child: Text("No users"));
          return ListView.builder(
            itemCount: vm.users.length,
            itemBuilder: (_, i) => ListTile(
              title: Text(vm.users[i].name),
              subtitle: Text("ID: ${vm.users[i].id}"),
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
