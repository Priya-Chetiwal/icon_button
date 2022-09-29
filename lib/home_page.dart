import 'package:flutter/material.dart';

double _speakervolume = 0.0;
int _volume = 0;

class home_page extends StatefulWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  late Choice _selectedOption = choices[0];

  void _select(Choice choice) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("myapp"),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: IconButton(
                icon: Icon(Icons.volume_up),
                iconSize: 50,
                color: Colors.deepPurple,
                tooltip: "volume increase by 5",
                onPressed: () {
                  setState(() {
                    _speakervolume += 5;
                  });
                },
              ),
            ),
            Text("Speaker Volume : $_speakervolume"),
            Container(
              child: InkWell(
                splashColor: Colors.grey,
                highlightColor: Colors.green,
                child: Icon(Icons.ring_volume, size: 50),
                onTap: () {
                  setState(() {
                    _volume += 2;
                  });
                },
              ),
            ),
            Container(
              child: Text(
                _volume.toString(),
                style: TextStyle(fontSize: 50),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: ChoiceCard(choice: _selectedOption),
            ),
            Container(
              child: PopupMenuButton(
                onSelected: (value) {
                  return _select(_selectedOption);
                },
                itemBuilder: (BuildContext context) {
                  return choices.skip(0).map((Choice choice) {
                    return PopupMenuItem(
                      child: Text(choice.name),
                    );
                  }).toList();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Choice {
  const Choice({required this.name, required this.icon});

  final String name;
  final IconData icon;
}

List<Choice> choices = <Choice>[
  Choice(name: 'wifi', icon: Icons.wifi),
  Choice(name: 'Bluetooth', icon: Icons.bluetooth),
  Choice(name: 'battery', icon: Icons.battery_0_bar),
  Choice(name: 'storage', icon: Icons.storage),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key? key, required this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle? textStyle = Theme.of(context).textTheme.headline1;
    return Card(
      color: Colors.green,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(choice.icon, size: 115, color: textStyle?.color),
            Text(choice.name, style: textStyle),
          ],
        ),
      ),
    );
  }
}
