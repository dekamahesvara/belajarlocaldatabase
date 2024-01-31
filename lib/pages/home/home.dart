import 'package:belajar_local_database/pages/home/controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.createNote();
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text("Notes"),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            itemCount: controller.notes.length,
            itemBuilder: (context, index) {
              return ListTile(
                  title: Text(controller.notes[index].title),
                  subtitle: Text(controller.notes[index].content),
                  trailing: PopupMenuButton(
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                          child: const Text("Edit"),
                          onTap: () => controller
                              .editNoteFromPopupMenu(controller.notes[index]),
                        ),
                        PopupMenuItem(
                          child: const Text("Delete"),
                          onTap: () => controller
                              .deleteNote(controller.notes[index].id!),
                        ),
                      ];
                    },
                  ));
            },
          );
        }
      }),
    );
  }
}
