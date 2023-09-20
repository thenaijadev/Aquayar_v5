import 'dart:async';

import 'package:aquayar/features/payment/presentation/widgets/webview_stack.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:webview_flutter/webview_flutter.dart';

class PaymentWebView extends ConsumerStatefulWidget {
  const PaymentWebView({super.key, required this.url});
  final String url;

  @override
  ConsumerState<PaymentWebView> createState() => _WebViewAppState();
}

class _WebViewAppState extends ConsumerState<PaymentWebView> {
  late StreamSubscription<ConnectivityResult> subscription;

  Future<void> _launchUrl() async {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      if (result == ConnectivityResult.none) {
        // Navigator.pushNamed(context, Routes.noInternet);
      } else {}
    });
  }

  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    _launchUrl();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse(widget.url),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewStack(controller: controller),
    );
  }

  navBack() async {
    var urlString = ref.read(provider.notifier);

    if (urlString.state == widget.url) {
      return;
    }
    final messenger = ScaffoldMessenger.of(context);
    if (await controller.canGoBack()) {
      await controller.goBack();
    } else {
      messenger.showSnackBar(
        const SnackBar(content: Text('No back history item')),
      );
    }
  }
}
