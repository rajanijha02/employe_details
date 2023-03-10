import 'package:employe_details/app/data/models/docs_model.dart';
import 'package:employe_details/app/modules/home/controllers/home_controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DocsForm extends GetView<HomeController> {
  DocsForm({
    super.key,
    required this.index,
  });
  int index = 0;

  TextEditingController documentTitleController = TextEditingController();
  TextEditingController documentNameController = TextEditingController();
  String filePath = "";

  pickFile() async {
    FilePickerResult? filePickerResult = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );

    if (filePickerResult != null) {
      filePath = filePickerResult.files.single.path!;
    }
  }

  pushDataInController() {
    controller.docs.add(
      Docs(
        title: this.documentTitleController.text,
        docsName: this.documentNameController.text,
        path: "N/A",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Document $index'),
            const Divider(
              color: Colors.grey,
            ),
            TextFormField(
              controller: documentTitleController,
              decoration: const InputDecoration(
                labelText: 'Document Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              controller: documentNameController,
              decoration: const InputDecoration(
                labelText: 'Document Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            InkWell(
              onTap: () async {
                await pickFile();
              },
              child: Container(
                height: 50,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'Browse',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                pushDataInController();
                controller.docsWidget.removeAt(index);
              },
              child: const Text('Add to Document'),
            ),
            const Divider(
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
