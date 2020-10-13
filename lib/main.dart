import 'package:flutter/material.dart';
import 'package:untitled4/auto_widget/auto_model.dart';
import 'package:untitled4/auto_widget/auto_widget.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: new Main(),
    );
  }
}

List<AutoModel> list = [
  AutoModel(1, 'Москва'),
  AutoModel(2, 'Париж'),
  AutoModel(3, 'Лондон'),
  AutoModel(4, 'Бейрут'),
  AutoModel(5, 'Стокгольм'),
  AutoModel(6, 'Женева'),
  AutoModel(7, 'Пекин'),
  AutoModel(8, 'Сидней'),
  AutoModel(9, 'Ливерпуль'),
  AutoModel(10, 'Страсбург'),
  AutoModel(11, 'Кельн'),
  AutoModel(12, 'Торонто'),
  AutoModel(13, 'Лос-Анджелес'),
  AutoModel(14, 'Кейптаун'),
  AutoModel(15, 'Ларнака'),
  AutoModel(16, 'Сиэтл'),
  AutoModel(17, 'Пермь'),
  AutoModel(18, 'Екатеринбург'),
  AutoModel(19, 'Вильнюс'),
  AutoModel(20, 'Варшава'),
  AutoModel(21, 'Минск'),
  AutoModel(22, 'Киев'),
  AutoModel(23, 'Ростов'),
  AutoModel(24, 'Новгород'),
  AutoModel(25, 'Ярославль'),
  AutoModel(26, 'Владивосток'),
  AutoModel(27, 'Шанхай'),
  AutoModel(28, 'Березники'),
  AutoModel(29, 'Полазна'),
  AutoModel(30, 'Кондратово'),
];

class Main extends StatefulWidget {
  @override
  _MainState createState() => new _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.info_outline), onPressed: null),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AutoWidget(autoList: list),
      ),
    );
  }
}

