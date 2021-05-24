import 'package:flutter/material.dart';

class Example extends StatelessWidget {
  Example({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            switch (index) {
              case 0:
                return Container(
                  color: Colors.green[100],
                  child: _Page(key: const PageStorageKey(1)),
                );
              case 1:
                return Container(
                  color: Colors.blue[100],
                  child: const Text('Blank Page'),
                );
              case 2:
                return Container(
                  color: Colors.red[100],
                  child: _Page(key: const PageStorageKey(2)),
                );
              default:
                throw '404';
            }
          },
        ),
      ),
    );
  }
}

class _MyPageStorageIdentifier {
  final Key key;
  final String name;

  _MyPageStorageIdentifier(this.key, this.name);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _MyPageStorageIdentifier &&
          runtimeType == other.runtimeType &&
          key == other.key &&
          name == other.name;

  @override
  int get hashCode => key.hashCode ^ name.hashCode;
}

class _Page extends StatefulWidget {
  _Page({Key? key}) : super(key: key);

  @override
  __PageState createState() => __PageState();
}

class __PageState extends State<_Page> {
  final _controller = TextEditingController();

  void setupValuePersistence() {
    final key = widget.key;
    if (key == null) return;
    final identifier = _MyPageStorageIdentifier(key, 'text');

    final dynamic value =
        PageStorage.of(context)?.readState(context, identifier: identifier);
    _controller.text = value is String ? value : '';
    _controller.addListener(() {
      PageStorage.of(context)
          ?.writeState(context, _controller.text, identifier: identifier);
    });
  }

  @override
  void initState() {
    super.initState();
    setupValuePersistence();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextField(controller: _controller),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
