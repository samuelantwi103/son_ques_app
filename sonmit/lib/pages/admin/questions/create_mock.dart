import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sonmit/components/button.dart';
import 'package:sonmit/components/camera/camera.dart';
import 'package:sonmit/components/card.dart';
import 'package:sonmit/components/collapsible.dart';
import 'package:sonmit/components/custom_scaffold.dart';
import 'package:sonmit/components/date_time.dart';
import 'package:sonmit/components/pdf/pdf_creator.dart';
import 'package:sonmit/components/pdf/pdf_viewer.dart';
import 'package:sonmit/components/text_field.dart';
import 'package:sonmit/services/callback.dart';
import 'package:sonmit/services/flags.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class CreateMockPage extends StatefulWidget {
  const CreateMockPage({super.key});

  @override
  State<CreateMockPage> createState() => _CreateMockPageState();
}

class _CreateMockPageState extends State<CreateMockPage> {
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
    // if (Platform.isAndroid) disableFlags();
    // if (widget.isChecking) isClosing = true;

    super.initState();
  }

  @override
  void dispose() {
    // if (Platform.isAndroid) enableFlags();
    super.dispose();
  }

  // List<File> _selectedImages = [];
  String? selectedTopic;
  List topics = [
    "States of Matter",
    "Organic Chemistry",
    "Rate of Reactions",
  ];

  @override
  Widget build(BuildContext context) {
    String questionPDF = "https://www.sldttc.org/allpdf/21583473018.pdf";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
        leading: CupertinoNavigationBarBackButton(),
        title: Text("Create Mock"),
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
                    "Topics",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ElevatedCollapsibleTile(
                            header: Text(topics[index]),
                            content: [
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: DebossedCard(
                                    padding: EdgeInsets.all(0),
                                    borderRadius: BorderRadius.circular(10),
                                    // color: Theme.of(context)
                                    //     .colorScheme
                                    //     .surfaceContainer,
                                    child: ListView.separated(
                                      shrinkWrap: true,
                                      itemCount: 3,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index3) {
                                        // final students = "quizzes[index2][]";
                                        return CreateMockCard(
                                          title: "Mock 23",

                                          questionPDF:
                                              "https://www.sldttc.org/allpdf/21583473018.pdf",
                                          onTap: (value) {
                                            // Navigator.push(context, slideLeftTransition(AdminMockDetailsPage(title: "Mock 23")));
                                          },
                                          // style: Theme.of(context)
                                          //     .textTheme
                                          //     .bodySmall,
                                        );
                                      },
                                      separatorBuilder: (context, index) {
                                        return Divider();
                                      },
                                    )),
                              )
                            ]);
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 30,
                        );
                      },
                      itemCount: topics.length),
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainer),
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
                            TextEditingController topicController =
                                TextEditingController();
                            // ScrollController scrollController =
                            // ScrollController();

                            callBottomSheet(
                              context: context,
                              title: "Add custom question",
                              content: StatefulBuilder(
                                builder: (context, setDialogState) {
                                  return Form(
                                    child: Column(
                                      children: [
                                        DropdownButtonFormField<String>(
                                          value: selectedTopic,
                                          items: topics.map((country) {
                                            return DropdownMenuItem<String>(
                                                value: country,
                                                child: Text(country));
                                          }).toList(),
                                          validator: (value) {
                                            // debugPrint(value.toString());
                                            if (value == null) {
                                              return "Select a city";
                                            }
                                            return null;
                                          },
                                          onChanged: (value) {
                                            setState(() {
                                              selectedTopic = value;
                                            });
                                          },
                                          // decoration: const InputDecoration(),
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          decoration: InputDecoration(
                                            labelText: 'Topic',
                                            filled: true,
                                            counter: const SizedBox(
                                              height: 0,
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                          ),
                                          // style: TextStyle(
                                          //   color: Theme.of(context).colorScheme.primary,
                                          // ),
                                        ),
                                        SizedBox(height: 20),
                                        selectedPdf != null
                                            ? Text(
                                                "Added PDF: ${selectedPdf?.path.split('/').last}",
                                                style: GoogleFonts.dmSans(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 13,
                                                ),
                                              )
                                            : SizedBox(),
                                        if (selectedPdf != null)
                                          SizedBox(height: 20),
                                        FullButton(
                                          text: selectedPdf == null
                                              ? "Select PDF"
                                              : "Remove",
                                          onPressed: () {
                                            if (selectedPdf == null) {
                                              _pickPdf().then((_) {
                                                setDialogState(
                                                    () {}); // Update dialog state
                                              });
                                            } else {
                                              _removePdf(context);
                                              setDialogState(
                                                  () {}); // Update dialog state
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            );

                            // add the PDF or handle remove pdf logic

                            // selectedPdf == null
                            //     ? _pickPdf()
                            //     : _removePdf(context);

                            // add the PDF or handle remove pdf logic
                            // selectedPdf == null
                            //     ? _pickPdf()
                            //     : _removePdf(context);
                          },
                          text: 'Add Custom Question',
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
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    // Row(
                                    //   children: [
                                    //     Text(
                                    //       "Set due date",
                                    //       style: Theme.of(context).textTheme.titleMedium,
                                    //     ),
                                    //   ],
                                    // ),
                                    DateTimePicker(
                                      onDateTimeSelected: (selectedDateTime) {
                                        // Do something with the selected date and time
                                        debugPrint(
                                          "Selected DateTime: $selectedDateTime",
                                        );
                                      },
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    DurationPicker(
                                      onDurationSelected: (duration) {
                                        // Do something with the selected duration
                                        debugPrint(
                                            "Selected Duration: ${duration.inHours}h ${duration.inMinutes % 60}m ${duration.inSeconds % 60}s");
                                      },
                                    ),
                                  ],
                                ),
                                title: "Create Mock Exam?",
                                onConfirm: () {
                                  setState(() {
                                    isSubmitted =
                                        true; // Mark Exam as submitted
                                  });
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text("Submitted")));
                                });
                          },
                          text: 'Create Mock Exam',
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
        if (kIsWeb) {
          Uint8List? fileBytes = result.files.single.bytes;
          if (fileBytes != null) {
            setState(() {
              selectedPdf = File.fromRawPath(fileBytes);
            });
          }
        } else {
          String? path = result.files.single.path;
          if (path != null) {
            setState(() {
              selectedPdf = File(path);
            });
          }
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
