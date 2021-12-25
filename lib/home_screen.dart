import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool switchValue = false;
  List<bool> isSelected = [false, false, false];
  List<bool> isSelectedCheckBox = [false, false, false, false];
  bool checkBoxValue = false;
  dynamic radioValue = 0;
  PageController pageController = PageController(initialPage: 0);
  List<String> languages = [
    'Dart',
    'C',
    'C++',
    'Ruby',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Components"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Switch(
                activeColor: Colors.purple,
                activeTrackColor: Colors.purple,
                inactiveThumbColor: Colors.black,
                inactiveTrackColor: Colors.grey,
                value: switchValue,
                onChanged: (value) {
                  setState(() {
                    switchValue = value;
                  });
                }),
            ToggleButtons(
              children: [
                Icon(Icons.ac_unit),
                Icon(Icons.account_tree_sharp),
                Icon(Icons.add_alert_outlined),
              ],
              isSelected: isSelected,
              constraints: BoxConstraints(minHeight: 48, minWidth: 48),
              hoverColor: Colors.pink,
              fillColor: Colors.purple,
              selectedColor: Colors.white,
              direction: Axis.horizontal,
              onPressed: (index) {
                setState(() {
                  isSelected[index] = !isSelected[index];
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  activeColor: Colors.yellow,
                  checkColor: Colors.black,
                  hoverColor: Colors.pink,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  tristate: true,
                  value: checkBoxValue,
                  onChanged: (value) {
                    setState(() {
                      checkBoxValue = !checkBoxValue;
                    });
                  },
                ),
                Checkbox(
                  activeColor: Colors.orange,
                  checkColor: Colors.black,
                  hoverColor: Colors.pink,
                  value: checkBoxValue,
                  tristate: true,
                  onChanged: (value) {
                    setState(() {
                      checkBoxValue = !checkBoxValue;
                    });
                  },
                ),
                Checkbox(
                  activeColor: Colors.red,
                  checkColor: Colors.black,
                  hoverColor: Colors.pink,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  tristate: true,
                  value: checkBoxValue,
                  onChanged: (value) {
                    setState(() {
                      checkBoxValue = !checkBoxValue;
                    });
                  },
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(16.0),
              padding: EdgeInsets.all(8.0),
              height: 250,
              decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.teal, width: 1, style: BorderStyle.solid),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: ListView.builder(
                itemCount: languages.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: CheckboxListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        tileColor: Colors.teal.shade50,
                        checkColor: Colors.white,
                        activeColor: Colors.teal,
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text(languages[index]),
                        contentPadding: EdgeInsets.only(left: 50),
                        value: isSelectedCheckBox[index],
                        onChanged: (value) {
                          setState(() {
                            isSelectedCheckBox = [false, false, false, false];
                            isSelectedCheckBox[index] = value!;
                          });
                        }),
                  );
                },
              ),
            ),
            Container(
              color: Colors.amber.shade700,
              height: 100,
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (value) {
                  setState(() {
                    radioValue = value;
                  });
                },
                itemCount: languages.length,
                itemBuilder: (context, index) {
                  return Center(
                    child: Text(
                      languages[index],
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: languages.length,
                itemBuilder: (BuildContext context, int index) {
                  return Radio(
                    value: index,
                    groupValue: radioValue,
                    activeColor: Colors.amber,
                    onChanged: (value) {
                      setState(() {
                        radioValue = value;
                        pageController.animateToPage(value as int,
                            duration: Duration(seconds: 1),
                            curve: Curves.easeIn);
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
