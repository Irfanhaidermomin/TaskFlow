import 'package:flutter/material.dart';
import 'package:taskflow/database/custom_list_database.dart';
import 'package:taskflow/model/custom_list_model.dart';

class AddCustomList extends StatefulWidget {
  Function refreshLists;
  AddCustomList({required this.refreshLists});

  @override
  _AddCustomListState createState() => _AddCustomListState();
}

class _AddCustomListState extends State<AddCustomList> {
  TextEditingController listNameController = TextEditingController();
  List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.brown,
    Colors.green,
    Colors.pink,
    Colors.purple,
    Colors.orange,
  ];

  Color selectedColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff1F6F63),
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  if (listNameController.text.length == 0) {
                    } else {
                      var customList = list(
                          listName: listNameController.text,
                          color: selectedColor.value.toString());
                      ListDatabase.instance.create(customList);
                      widget.refreshLists();
                      Navigator.pop(context);
                    }
                },
                icon: Icon(
                  Icons.done,
                  color: Colors.white,
                ))
          ],
          backgroundColor: Color(0xff1F6F63),
          elevation: 0.0,
          title: Text(
            'Add Custom List',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 75.0,
                  width: MediaQuery.of(context).size.width - 40.0,
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    maxLength: 60,
                    controller: listNameController,
                    onFieldSubmitted: (value) {
                      listNameController.text = value;
                    },
                    decoration: InputDecoration(
                      hintText: 'List Name',
                      hintStyle: TextStyle(color: Colors.white),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.white60,
                          width: 2.0,
                        ),
                      ),
                      counterStyle: TextStyle(color: Colors.white),
                      prefixIcon: Icon(
                        Icons.title,
                        size: 24,
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                'Theme',
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50.0,
                  width: MediaQuery.of(context).size.width - 100.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: selectedColor),
                ),
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
            Expanded(
              child: Container(
                height: 10.0,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: colors.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedColor = colors[index];
                          print(selectedColor.value);
                        });
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 20.0,
                          ),
                          Container(
                            height: 40.0,
                            width: 40.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100.0),
                                color: colors[index]),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            // Flexible(
            //   child: Align(
            //     alignment: Alignment.bottomCenter,
            //     child: GestureDetector(
            //       onTap: () {
            //         if (listNameController.text.length == 0) {
            //         } else {
            //           var customList = list(
            //               listName: listNameController.text,
            //               color: selectedColor.value.toString());
            //           ListDatabase.instance.create(customList);
            //           widget.refreshLists();
            //           Navigator.pop(context);
            //         }
            //       },
            //       child: Container(
            //         child: Center(
            //           child: Text(
            //             'Create Task',
            //             style: TextStyle(
            //                 color: Colors.white,
            //                 fontSize: 20.0,
            //                 fontWeight: FontWeight.bold),
            //           ),
            //         ),
            //         height: 50.0,
            //         width: MediaQuery.of(context).size.width - 50.0,
            //         decoration: BoxDecoration(
            //             color: Colors.red,
            //             borderRadius: BorderRadius.all(Radius.circular(30.0))),
            //       ),
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 50.0,
            )
          ],
        ));
  }
}