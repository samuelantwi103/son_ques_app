// components/pdf_viewer.dart
// ignore_for_file: public_member_api_docs, sort_constructors_first
// components/pdf_viewer.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sonmit/themes/theme_provider.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewer extends ConsumerStatefulWidget {
  // Selected pdf
  String selectedPdf;

  // bool isDark;

  PdfViewer({
    super.key,
    required this.selectedPdf,
    // required this.totalPages,
    // required this.currentPage,
    // required this.isPdfReady,
    // this.isDark = false,
  });

  @override
  ConsumerState<PdfViewer> createState() => _PdfViewerState();
}

class _PdfViewerState extends ConsumerState<PdfViewer> {
  int totalPages = 0;
  int currentPage = 0;
  bool isPdfReady = false;

  @override
  Widget build(BuildContext context) {
    // Theme
    final themeState = ref.watch(themeNotifierProvider);
    bool isDark = themeState == ThemeMode.dark;
    return Stack(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.8),
              child: SfTheme(
                data: SfThemeData(
                    brightness: isDark ? Brightness.dark : Brightness.light,
                    pdfViewerThemeData: SfPdfViewerThemeData(
                      backgroundColor: Theme.of(context).colorScheme.surface,
                    )),
                child: SfPdfViewer.network(
                  widget.selectedPdf,
                  canShowTextSelectionMenu: false,
                  enableTextSelection: false,
                  enableDocumentLinkAnnotation: false,
                  onDocumentLoaded: (details) {
                    setState(() {
                      totalPages = details.document.pages.count;
                      isPdfReady = true;
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
        if (!isPdfReady) const Center(child: CircularProgressIndicator()),
      ],
    );
  }
}
