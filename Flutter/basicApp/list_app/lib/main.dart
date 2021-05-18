import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Thao Nguyen: First app - part 1",
      home: RandomWord(),
    ),
  );
}

class RandomWord extends StatefulWidget {
  @override
  _RandomWordState createState() => _RandomWordState();
}

class _RandomWordState extends State<RandomWord> {
  final _suggestions = <WordPair>[];
  final _biggerFont = TextStyle(fontSize: 18.0);
  final _saved = <WordPair>{};
  final _list = <WordPair>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thao Nguyen application'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ListScreen(
                    list: _list,
                  ),
                ),
              );
            },
          )
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: EdgeInsets.all(15.0),
      itemBuilder: (context, index) {
        if (index.isOdd) return Divider();
        _suggestions.addAll(generateWordPairs().take(10));
        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair data) {
    final _isFavorited = _saved.contains(data);
    void _toggleFavorite(WordPair data) {
      setState(() {
        // Objective: Toogle the _isFavorite - When icon is pressed, isFavorite need to change the state.
        if (_isFavorited) {
          // When setState _isFavorited is still true. In order to move to false, I need to remove data in _saved.
          _saved.remove(data);
          _list.remove(data);
        } else {
          _saved.add(data);
          _list.add(data);
        }
      });
    }

    return ListTile(
      title: Text(
        data.asPascalCase,
        style: _biggerFont,
      ),
      trailing: IconButton(
          icon: (_isFavorited
              ? Icon(Icons.favorite)
              : Icon(Icons.favorite_border)),
          color: Colors.red[500],
          onPressed: () => _toggleFavorite(data)),
    );
  }
}

class ListScreen extends StatelessWidget {
  // final list = <WordPair>[];
  final List<WordPair> list;

  ListScreen({Key key, @required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tiles = list.map(
      (WordPair pair) {
        return ListTile(
          title: Text(
            pair.asPascalCase,
          ),
        );
      },
    );
    final divided = ListTile.divideTiles(
      context: context,
      tiles: tiles,
    ).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("Second screen"),
      ),
      // body: ListView.builder(itemBuilder: (context, index) {
      //   return Container(
      //     height: 50,
      //     margin: EdgeInsets.all(2),
      //     color: Colors.green,
      //     child: Center(
      //       child: Text("${list[index]}"),

      //       // child: ListTile.divideTiles(tiles: Text("${list[index]}")).toList(),
      //       // child: Text("The list"),
      //     ),
      //   );
      // }),
      body: ListView(children: divided),
      // body: ListView(
      //   children: ListTile.divideTiles(
      //     tiles: list.map((WordPair word) {
      //       return ListTile(
      //         title: Text(word.asPascalCase),
      //       );
      //     }),
      //   ).toList(),
      // )
    );
  }
}
