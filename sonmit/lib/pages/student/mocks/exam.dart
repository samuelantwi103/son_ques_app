// pages/student/mocks/exam.dart
// ignore_for_file: public_member_api_docs, sort_constructors_first
// pages/student/mocks/exam.dart

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:sonmit/components/button.dart';
import 'package:sonmit/components/custom_scaffold.dart';
import 'package:sonmit/components/pdf_viewer.dart';
import 'package:sonmit/components/progress_indicator.dart';
import 'package:sonmit/components/timer.dart';
import 'package:sonmit/services/callback.dart';
import 'package:sonmit/services/flags.dart';

class ExamPage extends ConsumerStatefulWidget {
  final String title;
  final bool isChecking; // Viewing Scores?

  const ExamPage({
    super.key,
    required this.title,
    this.isChecking = false,
  });

  @override
  ConsumerState<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends ConsumerState<ExamPage> {
  double progress = 1.0; // Initial progress is full (1.0)

  // answers from user
  bool isSubmitted = false;

  // Selected pdf
  File? selectedPdf;
  bool isClosing = false;

  @override
  void initState() {
    if (widget.isChecking) isSubmitted = true;
    if (Platform.isAndroid) disableFlags();
    if (widget.isChecking) isClosing = true;

    super.initState();
  }

  @override
  void dispose() {
    if (Platform.isAndroid) enableFlags();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String questionPDF = "https://pdfobject.com/pdf/sample.pdf";

    return PopScope(
      canPop: isClosing,
      onPopInvokedWithResult: (didPop, result) async {
        debugPrint("didPop: $didPop");
        debugPrint("result: $result");

        callDialog(
            context: context,
            content: Text(
                "Your current progress will be saved and submitted. \nYou will not be able to edit your responses after this."),
            title: "End exam?",
            onConfirm: () {
              Navigator.pop(context);
              debugPrint("isClosing: $isClosing");
              if (isClosing) {
                Navigator.pop(context);
              }
              Navigator.pop(context);
              setState(() {
                isClosing = true;
              });
            });
      },
      child: Scaffold(
        appBar: AppBar(
          leading: CupertinoNavigationBarBackButton(
            onPressed: () {
              widget.isChecking
                  ? Navigator.pop(context)
                  : callDialog(
                      context: context,
                      content: Text(
                          "Your current progress will be saved and submitted. \nYou will not be able to edit your responses after this."),
                      title: "End exam?",
                      onConfirm: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      });
              // Navigator.pop(context);
            },
          ),
          actions: widget.isChecking
              ? null
              : [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CountdownTimer(
                      hours: 1,
                      minutes: 1,
                      onProgress: (timerProgress) {
                        setState(() {
                          progress = timerProgress;
                        });
                      },
                      onTimerComplete: () {
                        // Put Submit Logic Here

                        // Custom Navigation: Do not touch
                        Navigator.pop(context);
                        callDialog(
                          context: context,
                          showTitle: false,
                          showCancel: false,
                          barrierDismissible: false,
                          content: SizedBox(
                            height: 100,
                            child: Center(
                              child: Text(
                                "Session ended!",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                          title: "",
                          showConfirm: false,
                          onConfirm: () {},
                          timeDialog: Duration(seconds: 3),
                        );
                      },
                    ),
                  ),
                ],
          bottom: widget.isChecking
              ? null
              : PreferredSize(
                  preferredSize: Size(double.maxFinite, 10),
                  child: SmoothProgressIndicator(
                    minHeight: 10,
                    value: progress,
                  ),
                ),
          title: Text(
            widget.title,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
          ),
          centerTitle: true,
        ),
        body: !widget.isChecking
            ? CustomScaffold(
                children: [
                  Expanded(
                      flex: 13,
                      child: Center(
                        child: ConstrainedBox(
                            constraints: BoxConstraints(
                              maxHeight: 1000,
                              // maxWidth: 500,
                            ),
                            child: PdfViewer(
                              selectedPdf: questionPDF,
                              // totalPages: _totalPages, currentPage: _currentPage, isPdfReady: _isPdfReady
                            )),
                      )),
                  Expanded(
                    flex: 7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 25),
                          child: !widget.isChecking
                              ? selectedPdf != null
                                  ? Text(
                                      "Added work: ${selectedPdf?.path.split('/').last}",
                                      style: GoogleFonts.dmSans(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13,
                                      ),
                                    )
                                  : Text(
                                      "No work added!!!",
                                      style: GoogleFonts.dmSans(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13,
                                      ),
                                    )
                              : null,
                        ),
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(16.0, 5, 16, 5),
                              child: widget.isChecking
                                  ? null
                                  : FullOutlineButton(
                                      onPressed: () {
                                        // add the PDF or handle remove pdf logic
                                        selectedPdf == null
                                            ? _pickPdf()
                                            : _removePdf(context);
                                      },
                                      text: selectedPdf == null
                                          ? 'Upload'
                                          : "Remove",
                                    ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(16.0, 0, 16, 10),
                              child: widget.isChecking
                                  ? null
                                  : FullButton(
                                      enabled: selectedPdf != null,
                                      onPressed: () {
                                        callDialog(
                                            context: context,
                                            content: Text(
                                                "You cannot edit your responses after this is done"),
                                            title: "Complete Exam?",
                                            onConfirm: () {
                                              setState(() {
                                                isSubmitted =
                                                    true; // Mark Exam as submitted
                                              });
                                              Navigator.pop(context);
                                              Navigator.pop(context);
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      content:
                                                          Text("Submitted")));
                                            });
                                      },
                                      text: 'Submit',
                                    ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )
            //Marked Script Section
            : Center(
                child: Text("Marked Script"),
              ),
        floatingActionButton: widget.isChecking
            ? FloatingActionButton.extended(
                onPressed: () {},
                label: Text("Score: 20"),
              )
            : null,
      ),
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
