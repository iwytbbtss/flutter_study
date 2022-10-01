import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatelessWidget {
  WebViewController? controller;

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sun'),
        centerTitle: true,
        backgroundColor: Colors.orange,
        actions: [
          IconButton(onPressed: () {
            if(controller == null) {
              return;
            }
            else {
              controller!.loadUrl('https://www.naver.com');
            }
          }, icon: Icon(Icons.home))
        ],
      ),
      body: WebView(
        onWebViewCreated: (WebViewController controller) {
          this.controller = controller;
        },
        initialUrl: 'https://blog.codefactory.ai',
        javascriptMode: JavascriptMode.unrestricted,
      )
    );
  }
}
