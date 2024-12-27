// components/pdf_viewer.dart
// ignore_for_file: public_member_api_docs, sort_constructors_first
// components/pdf_viewer.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sonmit/themes/theme_provider.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewer extends StatefulWidget {
  // Selected pdf
  String selectedPdf;
  final PdfScrollDirection? scrollDirection;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final Function(bool ready)? getReadyState;

  // bool isDark;

  PdfViewer({
    super.key,
    required this.selectedPdf,
    this.scrollDirection,
    this.height,
    this.padding,
    this.getReadyState,
    // required this.totalPages,
    // required this.currentPage,
    // required this.isPdfReady,
    // this.isDark = false,
  });

  @override
  State<PdfViewer> createState() => _PdfViewerState();
}

class _PdfViewerState extends State<PdfViewer> {
  int totalPages = 0;
  int currentPage = 0;
  bool isPdfReady = false;
  @override
  void initState() {
    if (widget.getReadyState != null) {
      // setState(() {
        widget.getReadyState!(isPdfReady);
      // });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ThemeNotifier>(context, listen: true).isDarkMode;

    return Stack(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              constraints: BoxConstraints(
                  maxHeight: widget.height ??
                      MediaQuery.of(context).size.height * 0.8),
              child: SfTheme(
                data: SfThemeData(
                    brightness: isDark ? Brightness.dark : Brightness.light,
                    pdfViewerThemeData: SfPdfViewerThemeData(
                      backgroundColor: Theme.of(context).colorScheme.surface,
                    )),
                child: SfPdfViewer.network(
                  widget.selectedPdf,
                  canShowTextSelectionMenu: false,
                  scrollDirection: widget.scrollDirection,
                  enableTextSelection: false,
                  enableDocumentLinkAnnotation: false,
                  onDocumentLoaded: (details) {
                    setState(() {
                      totalPages = details.document.pages.count;
                      isPdfReady = true;
                      if (widget.getReadyState != null) {
                        widget.getReadyState!(isPdfReady);
                      }
                    });
                  },
                  onPageChanged: (details) {
                    setState(() {
                      currentPage = details.newPageNumber - 1;
                    });
                  },
                ),
              ),
            ),
            // if (widget.selectedPdf != null)
            //   Padding(
            //     padding:
            //         const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
            //     child: Text(
            //       'Page ${currentPage + 1} of $totalPages',
            //       style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            //           // fontSize: 16,
            //           fontWeight: FontWeight.bold),
            //     ),
            //   )
          ],
        ),
        // if (!isPdfReady) Container(height: double.maxFinite,constraints: BoxConstraints(
        //   maxHeight: 200
        // ),child: const Center(child: CircularProgressIndicator())),
      ],
    );
  }
  // getReadyState(isPdfReady){
  //   return isPdfReady;
  // }
}
