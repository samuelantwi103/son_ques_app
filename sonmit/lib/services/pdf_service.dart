// services/pdf_service.dart
// import 'dart:io';

// Future<void> pickPdf() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['pdf'],
//     );

//     if (result != null) {
//       setState(() {
//         selectedPdf = File(result.files.single.path!);
//       });
//     }
//   }