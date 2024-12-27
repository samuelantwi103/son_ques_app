import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomWebView extends StatefulWidget {
  

  String url = '';
  
  // double progress = 0;
  
  

   CustomWebView({
    super.key,
    required this.url,
  });

  @override
  State<CustomWebView> createState() => _CustomWebViewState();
}

class _CustomWebViewState extends State<CustomWebView> {

  double progress= 0;
  String title = '';
  final GlobalKey webViewKey = GlobalKey();
  bool? isSecure;
  InAppWebViewController? webViewController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        progress < 1.0
            ? Center(
                child: Padding(
                  padding: EdgeInsets.all(0.2*MediaQuery.sizeOf(context).width),
                  child: LinearProgressIndicator(
                  value: progress,
                  minHeight: 20,
                  borderRadius: BorderRadius.circular(50),
                  
                                ),
                ))
            : Container(),
        InAppWebView(
          key: webViewKey,
          initialUrlRequest: URLRequest(url: WebUri(widget.url)),
          gestureRecognizers: Set()
            ..add(Factory<VerticalDragGestureRecognizer>(
                () => VerticalDragGestureRecognizer())),
          // onScrollChanged: (controller, x, y) {

          // },
          initialSettings: InAppWebViewSettings(
            transparentBackground: true,
            safeBrowsingEnabled: true,
            isFraudulentWebsiteWarningEnabled: true,
          ),
          onWebViewCreated: (controller) async {
            webViewController = controller;
            if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
              await controller.startSafeBrowsing();
            }
          },
          onLoadStart: (controller, url) {
            if (url != null) {
              setState(() {
                widget.url = url.toString();
                isSecure = urlIsSecure(url);
              });
            }
          },
          headlessWebView: HeadlessInAppWebView(),

          onLoadStop: (controller, url) async {
            if (url != null) {
              setState(() {
                widget.url = url.toString();
              });
            }

            final sslCertificate = await controller.getCertificate();
            setState(() {
              isSecure =
                  sslCertificate != null || (url != null && urlIsSecure(url));
            });
          },
          onUpdateVisitedHistory: (controller, url, isReload) {
            if (url != null) {
              setState(() {
                widget.url = url.toString();
              });
            }
          },
          onTitleChanged: (controller, title) {
            if (title != null) {
              setState(() {
                this.title = title;
              });
            }
          },
          onProgressChanged: (controller, progress) {
            setState(() {
              this.progress = progress / 100;
            });
          },
          shouldOverrideUrlLoading: (controller, navigationAction) async {
            final url = navigationAction.request.url;
            if (navigationAction.isForMainFrame &&
                url != null &&
                ![
                  'http',
                  'https',
                  'file',
                  'chrome',
                  'data',
                  'javascript',
                  'about'
                ].contains(url.scheme)) {
              if (await canLaunchUrl(url)) {
                launchUrl(url);
                return NavigationActionPolicy.CANCEL;
              }
            }
            return NavigationActionPolicy.ALLOW;
          },
        ),
      ],
    );
  }

  static bool urlIsSecure(Uri url) {
    return (url.scheme == "https") || isLocalizedContent(url);
  }

  static bool isLocalizedContent(Uri url) {
    return (url.scheme == "file" ||
        url.scheme == "chrome" ||
        url.scheme == "data" ||
        url.scheme == "javascript" ||
        url.scheme == "about");
  }
}
