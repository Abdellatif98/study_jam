import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Study Jam',
      theme: new ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: new Scaffold(body: new MyHomePage(title: 'STUDY JAM')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  double tileHeight;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {

  final List<ListTile> list = List<ListTile>();
  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
        centerTitle: true,
      ),
      body: ListView(
        children: list.toList(),
        controller: _scrollController,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _add(wordPair.asPascalCase),
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _add(String name) {
    setState(() {
      list.add(ListTile(
        title: Text(name),
        onTap: () => _tap(name),
      ));
    });
    _scrollController.animateTo(
      list.length > 9 ? 60.0 * (list.length - 9) : 0,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
    );
  }

  void _tap(String str) {
    final snackBar = SnackBar(content: Text(str));
    // Find the Scaffold in the Widget tree and use it to show a SnackBar
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
