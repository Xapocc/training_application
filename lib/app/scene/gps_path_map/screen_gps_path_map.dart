import 'package:flutter/material.dart';

class ScreenGpsPathMap extends StatelessWidget {
  const ScreenGpsPathMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.map),
              ),
              Tab(
                icon: Icon(Icons.list),
              )
            ],
          ),
        ),
      ),
    );
  }
}
