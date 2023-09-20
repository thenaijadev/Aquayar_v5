import 'package:aquayar/core/widgets/text_widget.dart';
import 'package:aquayar/features/payment/presentation/widgets/navigation_controls.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:webview_flutter/webview_flutter.dart';

final provider = StateProvider((ref) => "");

class WebViewStack extends ConsumerStatefulWidget {
  const WebViewStack({
    required this.controller,
    super.key,
  });
  final WebViewController controller;

  @override
  ConsumerState<WebViewStack> createState() => _WebViewStackState();
}

class _WebViewStackState extends ConsumerState<WebViewStack> {
  var loadingPercentage = 0;

  bool isLoading = false;
  String theUrl = "";

  @override
  void initState() {
    super.initState();
    widget.controller
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            setState(() {
              loadingPercentage = 0;
            });
          },
          onProgress: (progress) {
            setState(() {
              isLoading = true;

              loadingPercentage = progress;
            });
          },
          onWebResourceError: (WebResourceError error) {
            if (error.isForMainFrame! == true ||
                error.errorCode.toString() == "-2" ||
                error.description.toString() ==
                    "net::ERR_INTERNET_DISCONNECTED") {
              // Navigator.popAndPushNamed(context, Routes.noInternet);
            }
          },
          onPageFinished: (url) {
            setState(() {
              isLoading = false;
              loadingPercentage = 100;
            });
          },
          onNavigationRequest: (navigation) {
            final host = Uri.parse(navigation.url).host;
            if (host.contains('youtube.com')) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Blocking navigation to $host',
                  ),
                ),
              );
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      // Modify from here...
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel(
        'SnackBar',
        onMessageReceived: (message) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(message.message)));
        },
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff0579CE),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo.png",
              width: 20,
            ),
            const SizedBox(
              width: 5,
            ),
            const TextWidget(
              text: 'Aquayar',
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
          ],
        ),
        centerTitle: true,
        // Add from here...
        actions: [
          NavigationControls(controller: widget.controller, url: theUrl),
        ],
        // ...to here.
      ),
      body: Stack(
        children: [
          WebViewWidget(
            controller: widget.controller,
          ),
          if (loadingPercentage < 100)
            LinearProgressIndicator(
              value: loadingPercentage / 100.0,
            ),
        ],
      ),
    );
  }
}
