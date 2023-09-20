import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:webview_flutter/webview_flutter.dart';

class NavigationControls extends ConsumerStatefulWidget {
  const NavigationControls(
      {required this.controller, super.key, required this.url});

  final WebViewController controller;
  final String url;

  @override
  ConsumerState<NavigationControls> createState() => _NavigationControlsState();
}

class _NavigationControlsState extends ConsumerState<NavigationControls> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
          icon: const Icon(Icons.replay),
          onPressed: () {
            widget.controller.reload();
          },
        ),
      ],
    );
  }
}
