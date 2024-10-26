// pages/student/mocks/exam.dart
// ignore_for_file: public_member_api_docs, sort_constructors_first
// pages/student/mocks/exam.dart

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:sonmit/components/button.dart';
import 'package:sonmit/components/custom_scaffold.dart';
import 'package:sonmit/components/pdf_viewer.dart';
import 'package:sonmit/components/progress_indicator.dart';
import 'package:sonmit/components/timer.dart';
import 'package:sonmit/services/callback.dart';
import 'package:sonmit/themes/theme_provider.dart';

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
  int _totalPages = 0;
  int _currentPage = 0;
  bool _isPdfReady = false;

  // isDark
  final container = ProviderContainer();

  @override
  void initState() {
    if (widget.isChecking) isSubmitted = true;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Theme
    final themeState = ref.watch(themeNotifierProvider);
    bool isDark = themeState == ThemeMode.dark;
    // debugPrint("$themeState");

    return Scaffold(
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
                          child: Text(
                            "Session ended!",
                            style: TextStyle(fontSize: 20),
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
                  child: selectedPdf != null
                      ? Center(
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              maxHeight: 1000,
                              maxWidth: 500,
                            ),
                            child: PdfViewer(
                              selectedPdf: selectedPdf,
                              // totalPages: _totalPages, currentPage: _currentPage, isPdfReady: _isPdfReady
                              )
                          ),
                        )
                      : Center(
                          child: Text(
                            "No PDF available",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Theme.of(context).colorScheme.error,
                            ),
                          ),
                        ),
                ),
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
                            padding: const EdgeInsets.fromLTRB(16.0, 5, 16, 5),
                            child: widget.isChecking
                                ? null
                                : FullOutlineButton(
                                    onPressed: () {
                                      // add the PDF or handle remove pdf logic
                                      selectedPdf == null
                                          ? _pickPdf(context)
                                          : _removePdf(context);
                                    },
                                    text: selectedPdf == null
                                        ? 'Add your work'
                                        : "Remove",
                                  ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16.0, 0, 16, 10),
                            child: widget.isChecking
                                ? null
                                : FullButton(
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
    );
  }

  Future<void> _pickPdf(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        selectedPdf = File(result.files.single.path!);
        _isPdfReady = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("PDF added")),
      );
    }
  }

  Future<void> _removePdf(BuildContext context) async {
    setState(() {
      selectedPdf = null;
      _isPdfReady = false;
      _currentPage = 0;
      _totalPages = 0;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("PDF removed")),
    );
  }
}
