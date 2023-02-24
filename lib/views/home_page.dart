import 'package:flutter/material.dart';
import 'package:memo/model/task.dart';
import 'package:memo/storage/storage.dart';
import 'package:memo/utils/color_map.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Task> localTaskList = [];

  Map<String, Color> colorTheme = ColorMap.light;

  bool darkMode = false;

  @override
  void initState() {
    localTaskList = Storage.taskLists;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30))),
        backgroundColor: colorTheme['primary'],
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: ListView(
            children: <Widget>[
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: colorTheme['text-primary'],
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const CircleAvatar(
                backgroundImage: AssetImage('asset/082111633057.jpg'),
                radius: 50,
              ),
              const SizedBox(
                height: 30,
              ),
              Align(
                child: Text(
                  "Mukhammad Rizki",
                  style: TextStyle(
                      color: colorTheme['text-primary'],
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Switch(
                  value: darkMode,
                  activeColor: Colors.white,
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: Colors.grey,
                  activeTrackColor: Colors.grey,
                  onChanged: (bool newValue) {
                    setState(() {
                      darkMode = newValue;
                    });

                    if (darkMode) {
                      setState(() {
                        colorTheme = ColorMap.dark;
                      });
                    } else {
                      setState(() {
                        colorTheme = ColorMap.light;
                      });
                    }
                  })
            ],
          ),
        ),
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black45),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
        backgroundColor: Colors.black,
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: SafeArea(
            minimum: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const Text(
                    "Hello, Rizki!",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "TODAY'S TASK",
                    style: TextStyle(color: Colors.black38, letterSpacing: 2),
                  ),
                  Container(
                    child: localTaskList.isEmpty
                        ? Container(
                            margin: const EdgeInsets.only(top: 30),
                            child: const Text(
                              "You Have No Task",
                              style: TextStyle(
                                  fontSize: 15, color: Colors.black38),
                              textAlign: TextAlign.center,
                            ),
                          )
                        : Container(
                            margin: const EdgeInsets.only(top: 15),
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: Storage.taskLists.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Dismissible(
                                    key: ValueKey<Task>(localTaskList[index]),
                                    onDismissed: (DismissDirection direction) {
                                      Storage.taskLists.removeAt(index);

                                      setState(() {
                                        localTaskList = Storage.taskLists;
                                      });
                                    },
                                    child: Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 20),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Card(
                                          child: Padding(
                                            padding: const EdgeInsets.all(30),
                                            child: Text(
                                                localTaskList[index].taskName),
                                          ),
                                        )),
                                  );
                                }),
                          ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
