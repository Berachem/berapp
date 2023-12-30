//import 'package:webview_flutter/webview_flutter.dart';
import 'package:berapp/components/bottom_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accueil'),
      ),
      body: /* const WebView(
        initialUrl: 'https://flutter.io',
        javascriptMode: JavascriptMode.unrestricted,
      ), */  Center(
        child: Text('Accueil', style: Theme.of(context).textTheme.headlineMedium ),
      ),
      bottomNavigationBar: const BottomAppBarCustom(),
    );
  }
}
