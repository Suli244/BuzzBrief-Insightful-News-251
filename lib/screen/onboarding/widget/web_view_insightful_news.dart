import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebFFInsightfulNews extends StatefulWidget {
  final String url;
  final String title;

  const WebFFInsightfulNews({
    Key? key,
    required this.title,
    required this.url,
  }) : super(key: key);

  @override
  State<WebFFInsightfulNews> createState() => _WebFFInsightfulNewsState();
}

class _WebFFInsightfulNewsState extends State<WebFFInsightfulNews> {
  late WebViewController controller;
  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(
              child: WebViewWidget(
                controller: controller,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
