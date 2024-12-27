import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sonmit/components/button.dart';
import 'package:sonmit/components/card.dart';
import 'package:sonmit/components/custom_scaffold.dart';
import 'package:sonmit/components/pdf_viewer.dart';
import 'package:sonmit/services/callback.dart';
import 'package:sonmit/services/flags.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class AdminMockDetailsPage extends StatefulWidget {
  final String title;
  const AdminMockDetailsPage({super.key, required this.title});

  @override
  State<AdminMockDetailsPage> createState() => _AdminMockDetailsPageState();
}

class _AdminMockDetailsPageState extends State<AdminMockDetailsPage> {
  // answers from user
  bool isSubmitted = false;

  // Selected pdf
  File? selectedPdf;
  bool isClosing = false;
  // bool isReadyQues = false;
  // bool isReadyAns = false;

  @override
  void initState() {
    // if (widget.isChecking) isSubmitted = true;
    if (Platform.isAndroid) disableFlags();
    // if (widget.isChecking) isClosing = true;

    super.initState();
  }

  @override
  void dispose() {
    if (Platform.isAndroid) enableFlags();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String questionPDF = "https://www.sldttc.org/allpdf/21583473018.pdf";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
        leading: CupertinoNavigationBarBackButton(),
        title: Text("Physics: ${widget.title}"),
        centerTitle: true,
      ),
      body: CustomScaffold(
        children: [
          Expanded(
            flex: 13,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Questions",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: ElevatedCard(
                      borderRadius: BorderRadius.circular(0),
                        padding: EdgeInsets.all(5),
                        child: Center(
                          child: PdfViewer(
                            // getReadyState: (ready) {
                            //   // setState(() {
                            //     isReadyQues = ready;
                            //   // });
                            // },
                            height: 385,
                            selectedPdf: questionPDF,
                            scrollDirection: PdfScrollDirection.horizontal,
                            // totalPages: _totalPages, currentPage: _currentPage, isPdfReady: _isPdfReady
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Answers",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: ElevatedCard(
                      borderRadius: BorderRadius.circular(0),
                        padding: EdgeInsets.all(5),
                        child: Center(
                          child: PdfViewer(
                            // getReadyState: (ready) {
                            //   // setState(() {
                            //     isReadyAns = ready;
                            //   // });
                            // },
                            height: 385,
                            selectedPdf: questionPDF,
                            scrollDirection: PdfScrollDirection.horizontal,
                            // totalPages: _totalPages, currentPage: _currentPage, isPdfReady: _isPdfReady
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(width: double.maxFinite,decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainer
            ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Padding(
                  //   padding:
                  //       const EdgeInsets.symmetric(vertical: 8.0, horizontal: 25),
                  //   child: selectedPdf != null
                  //       ? Text(
                  //           "Added work: ${selectedPdf?.path.split('/').last}",
                  //           style: GoogleFonts.dmSans(
                  //             fontWeight: FontWeight.w600,
                  //             fontSize: 13,
                  //           ),
                  //         )
                  //       : Text(
                  //           "No work added!!!",
                  //           style: GoogleFonts.dmSans(
                  //             fontWeight: FontWeight.w600,
                  //             fontSize: 13,
                  //           ),
                  //         ),
                  // ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16.0, 5, 16, 5),
                        child: FullOutlineButton(
                          // enabled: selectedPdf != null,
                          onPressed: () {
                            // add the PDF or handle remove pdf logic
                            selectedPdf == null
                                ? _pickPdf()
                                : _removePdf(context);
                          },
                          text: selectedPdf == null ? 'Update' : "Remove",
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16.0, 0, 16, 10),
                        child: FullButton(
                          // enabled: selectedPdf == null,
                          onPressed: () {
                            callDialog(
                                context: context,
                                content: Text(
                                    "You cannot edit your responses after this is done"),
                                title: "Complete Exam?",
                                onConfirm: () {
                                  setState(() {
                                    isSubmitted = true; // Mark Exam as submitted
                                  });
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text("Submitted")));
                                });
                          },
                          text: 'Delete',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: Icon(Icons.add_comment_outlined),
      // ),
    );
  }

  Future<void> _pickPdf() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result != null) {
        String? path = result.files.single.path;
        if (path != null) {
          setState(() {
            selectedPdf = File(path);
          });
        }
      } else {
        debugPrint("User canceled the picker");
      }
    } catch (e) {
      debugPrint("Failed to pick a PDF file: $e");
    }
  }

  Future<void> _removePdf(BuildContext context) async {
    setState(() {
      selectedPdf = null;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("PDF removed")),
    );
  }
}
