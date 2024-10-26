// pages/student/mocks/exam.dart

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_file/open_file.dart';
import 'package:sonmit/components/button.dart';
import 'package:sonmit/components/progress_indicator.dart';
import 'package:sonmit/components/timer.dart';
import 'package:sonmit/services/callback.dart';

class ExamPage extends StatefulWidget {
  final String title;
  final bool isChecking; // Viewing Scores?

  const ExamPage({
    super.key,
    required this.title,
    this.isChecking = false,
  });

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  double progress = 1.0; // Initial progress is full (1.0)

  // answers from user
  bool isSubmitted = false;

  // Selected pdf
  File? selectedPdf;

  @override
  void initState() {
    if (widget.isChecking) isSubmitted = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.medium(
            pinned: true,
            leading: CupertinoNavigationBarBackButton(
              onPressed: () {
                callDialog(
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
                        hours: 0,
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
                            content: Text(
                              "Session ended!",
                              style: TextStyle(fontSize: 20),
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
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                widget.title,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              centerTitle: true,
            ),
            centerTitle: true,
          ),
          SliverToBoxAdapter(
              child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * 0.1,
              vertical: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (selectedPdf != null) ...[
                  Text(
                    "Selected PDF: ${selectedPdf!.path.split('/').last}",
                    style: GoogleFonts.dmSans(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () async {
                      OpenFile.open(selectedPdf!.path);
                    },
                    child: Text("View PDF"),
                  ),
                ] else
                  Text(
                    "No PDF selected",
                    style: GoogleFonts.dmSans(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        selectedPdf == null ? _pickPdf() : _removePdf();
                      },
                      child:
                          Text(selectedPdf == null ? "Add PDF" : "Remove PDF"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (selectedPdf != null) {
                          // Submit the PDF or handle submission logic
                          selectedPdf == null ? _pickPdf() : _removePdf();

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("PDF submitted")),
                          );
                        }
                      },
                      child: Text("Submit PDF"),
                    ),
                  ],
                ),
              ],
            ),
          )),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: widget.isChecking
                  ? null
                  : FullOutlineButton(
                      onPressed: () {
                        if (selectedPdf != null) {
                          // Submit the PDF or handle submission logic
                          selectedPdf == null ? _pickPdf() : _removePdf();
                          
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(selectedPdf != null?"PDF added":"PDF removed")),
                          );
                        }
                      },
                      text:selectedPdf == null? 'Add your work':"Remove",
                    ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: widget.isChecking
                  ? null
                  : FullButton(
                      onPressed: () {
                        callDialog(
                            context: context,
                            content: Text(
                                "You cannot edit your responses after this is done"),
                            title: "Complete Exam",
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
                      text: 'Submit',
                    ),
            ),
          ),
          // if (isSubmitted) // Show score after submission
          //   SliverToBoxAdapter(
          //     child: Padding(
          //       padding: const EdgeInsets.all(16.0),
          //       child: Text(
          //         'Your score is ${calculateScore(
          //           questions: questions,
          //           selectedAnswers: selectedAnswers,
          //         )} out of ${questions.length}.',
          //         style: const TextStyle(
          //           fontSize: 18,
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //     ),
          //   ),
        ],
      ),
      floatingActionButton: widget.isChecking
          ? FloatingActionButton.extended(
              onPressed: () {},
              label: Text("Score: 20"),
            )
          : null,
    );
  }

  Future<void> _pickPdf() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        selectedPdf = File(result.files.single.path!);
      });
    }
  }

  Future<void> _removePdf() async {
    setState(() {
      selectedPdf = null;
    });
  }
}
