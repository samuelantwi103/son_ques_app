import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:sonmit/services/callback.dart';
import 'package:permission_handler/permission_handler.dart';

class PdfCreator extends StatelessWidget {
  final List<File> imageFiles;

  const PdfCreator({super.key, required this.imageFiles});

  Future<void> createPdf(BuildContext context) async {
    if (imageFiles.isEmpty) {
      callDialog(
        context: context,
        showTitle: false,
        timeDialog: const Duration(seconds: 1),
        content: const Text("No images to create PDF"),
        title: "",
        onConfirm: () {},
      );
      return;
    }

    final pdf = pw.Document();
    for (var imageFile in imageFiles) {
      final image = pw.MemoryImage(imageFile.readAsBytesSync());
      pdf.addPage(pw.Page(build: (pw.Context context) => pw.Image(image)));
    }

    // Let the user select a location to save the PDF
    String? filePath = await _pickSaveLocation(context);
    if (filePath == null) {
      return;
    }

    // Create the file object using the selected path
    final file = File(filePath);
    await file.writeAsBytes(await pdf.save());

    // Notify user of saved PDF location
    callDialog(
      context: context,
      showTitle: false,
      timeDialog: const Duration(seconds: 1),
      content: Text("PDF saved to $filePath"),
      title: "",
      onConfirm: () {},
    );
  }

  Future<String?> _pickSaveLocation(BuildContext context) async {
    if (Platform.isAndroid) {
      // For Android, check if the app has permission to write to storage
      PermissionStatus permissionStatus = await Permission.storage.request();

      if (permissionStatus.isGranted) {
        final directory = await getExternalStorageDirectory();
        final downloadsDirectory = Directory('${directory?.parent.path}/Download');
        
        if (!await downloadsDirectory.exists()) {
          await downloadsDirectory.create();
        }

        // Return the file path for saving the PDF
        String filePath = '${downloadsDirectory.path}/images_pdf.pdf';
        return filePath; // Return the file path
      } else {
        // Permission denied
        callDialog(
          context: context,
          showTitle: false,
          timeDialog: const Duration(seconds: 1),
          content: const Text("Permission to access storage is required."),
          title: "",
          onConfirm: () {},
        );
        return null;
      }
    } else {
      // Use FilePicker for other platforms
      String? result = await FilePicker.platform.saveFile(
        dialogTitle: "Select a location to save the PDF",
        fileName: "images_pdf.pdf",
      );
      return result; // Return the selected file path or null if canceled
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => createPdf(context),
      child: const Text("Generate PDF"),
    );
  }
}
