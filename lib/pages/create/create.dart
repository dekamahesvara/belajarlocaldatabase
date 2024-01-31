import 'package:belajar_local_database/pages/create/controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CreatePage extends GetView<CreateController> {
  const CreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Note"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: controller.titleController,
              decoration: const InputDecoration(
                hintText: "Title",
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              controller: controller.contentController,
              decoration: const InputDecoration(
                hintText: "Content",
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                controller.onSubmit();
              },
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
