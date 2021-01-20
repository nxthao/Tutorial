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
  final _saved = Set<WordPair>();
  bool _isFavorited = false;

  void _toggleFavorite(WordPair data) {
    setState(() {
      if (_isFavorited) {
        _saved.remove(data);
      } else {
        _saved.add(data);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Thao Nguyen application')),
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
    _isFavorited = _saved.contains(data);
    return ListTile(
      title: Text(
        data.asPascalCase,
        style: _biggerFont,
      ),
      trailing: IconButton(
        icon:
            (_isFavorited ? Icon(Icons.favorite) : Icon(Icons.favorite_border)),
      ),
      // onPressed: () => _toggleFavorite(data)),
      onTap: () {
        setState(() {
          if (_isFavorited) {
            _saved.remove(data);
          } else {
            _saved.add(data);
          }
        });
      },
    );
  }
}
