import 'package:basic_flutter_app/scan_qr.dart';
import 'package:flutter/material.dart';
import 'dog_model.dart';
import 'dog_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// MaterialApp is the base Widget for your Flutter Application
    /// Gives us access to routing, context, and meta info functionality.
    return MaterialApp(
      title: 'We Rate Dogs',
      // Make all our text default to white
      // and backgrounds default to dark
      theme: ThemeData(brightness: Brightness.dark),
      home: MyHomePage(title: 'We Rate Dogs'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
    List<Dog> initialDogs = []
      ..add(Dog('Ruby', 'Portland, OR, USA',
          'Ruby is a very good girl. Yes: Fetch, loungin\'. No: Dogs who get on furniture.'))
      ..add(Dog('R1', 'Portland, OR, USA',
          'Ruby is a very good girl. Yes: Fetch, loungin\'. No: Dogs who get on furniture.'))
      ..add(Dog('Rex', 'Seattle, WA, USA', 'Best in Show 1999'))
      ..add(Dog('RS1', 'Seattle, WA, USA', 'Best in Show 1999'))
      ..add(Dog('RJ', 'Seattle, WA, USA', 'Best in Show 1999'))
      ..add(Dog('HZ', 'Seattle, WA, USA', 'Best in Show 1999'))
      ..add(Dog('Rod Stewart', 'Prague, CZ',
          'Star good boy on international snooze team.'))
      ..add(Dog('Herbert', 'Dallas, TX, USA', 'A Very Good Boy'))
      ..add(Dog('Buddy', 'North Pole, Earth', 'Self proclaimed human lover.'));
    

    Future _showQRCodeScanner() async {
      // push a new route like you did in the last section
      Dog newDog = await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) {
            return ScanScreenPage();
          },
        ),
      );
      // A null check, to make sure that the user didn't abandon the form.
      if (newDog != null) {
        // Add a newDog to our mock dog array.
        initialDogs.add(newDog);
      }
    }
    
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Colors.black87,
           actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: _showQRCodeScanner,
            ),
      ],
        ),
        body: Container(
          // Add box decoration
          decoration: buildBoxDecoration(),
          child: Center(
            child: DogList(initialDogs),
          ),
        ),
      );
    }

    BoxDecoration buildBoxDecoration() {
      return BoxDecoration(
          // Box decoration takes a gradient
          gradient: LinearGradient(
            // Where the linear gradient begins and ends
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            // Add one stop for each color. Stops should increase from 0 to 1
            stops: [0.1, 0.5, 0.7, 0.9],
            colors: [
              // Colors are easy thanks to Flutter's Colors class.
              Colors.indigo[800],
              Colors.indigo[700],
              Colors.indigo[600],
              Colors.indigo[400],
            ],
          ),
        );
    }
}