//import 'package:webview_flutter/webview_flutter.dart';
import 'package:berapp/components/bottom_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Text('Berachem ', style: Theme.of(context).textTheme.headlineMedium ),
      ),
      bottomNavigationBar: BottomAppBarCustom(selectedIndex: 0),
    );
  }
}
