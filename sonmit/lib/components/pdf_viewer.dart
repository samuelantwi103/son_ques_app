// components/pdf_viewer.dart
// ignore_for_file: public_member_api_docs, sort_constructors_first
// components/pdf_viewer.dart
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sonmit/themes/theme_provider.dart';

class PdfViewer extends ConsumerStatefulWidget {
  // Selected pdf
  File? selectedPdf;

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
              child: PDFView(
                filePath: widget.selectedPdf?.path,
                nightMode: isDark,
                pageSnap: false,
                pageFling: false,
                onRender: (pages) {
                  setState(() {
                    totalPages = pages ?? 0;
                    isPdfReady = true;
                  });
                },
                onViewCreated: (PDFViewController pdfViewController) {},
                onPageChanged: (currentPage, totalPages) {
                  setState(() {
                    currentPage = currentPage ?? 0;
                  });
                },
              ),
            ),
            if (widget.selectedPdf != null)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
                child: Text(
                  'Page ${currentPage + 1} of $totalPages',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      // fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              )
          ],
        ),
        if (!isPdfReady)
          const Center(child: CircularProgressIndicator()),
      ],
    );
  }
}
