import 'package:flutter/material.dart';
import 'package:nid_notes/helper/database.dart';
import 'package:nid_notes/models/note.dart';
import 'package:nid_notes/models/user.dart';
import 'package:nid_notes/blocs/user_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> notes = [];

  @override
  void initState() {
    super.initState();
    refreshList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          Note note = Note("Nota di prova", "Contenuto di prova");
          DatabaseHelper db = DatabaseHelper();
          await db.insert(note);
          refreshList();
        },
      ),
      body: Column(
        children: [
          Expanded(
            flex: 10,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: GridView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: notes.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return Card(
                      child: Column(
                        children: [
                          Text(notes[index]["id"].toString() +
                              ' ' +
                              notes[index]["title"].toString()),
                          Text(notes[index]["content"].toString())
                        ],
                      ),
                    );
                  }),
            ),
          ),
          Flexible(
            flex: 1,
            child: ElevatedButton(
              onPressed: () {
                userBloc.logout();
                Navigator.of(context).pushReplacementNamed('/login');
              },
              child: Text('Logout'),
            ),
          )
        ],
      ),
    );
  }

  refreshList() async {
    DatabaseHelper db = DatabaseHelper();
    notes = await db.queryAllRows();
    setState(() {});
  }
}
