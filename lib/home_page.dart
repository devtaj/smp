import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          double widthFactor;
          double heightFactor;
          double fontSize;

          if (constraints.maxWidth < 600) {
            // Small screen (Mobile)
            widthFactor = 0.9;
            heightFactor = 0.4;
            fontSize = 16;
          }else if (constraints.maxWidth < 750) {
            // Medium screen (Tablet)
            widthFactor = 0.7;
            heightFactor = 0.8;
            fontSize = 20;
          }
           else if (constraints.maxWidth < 1200) {
            // Medium screen (Tablet)
            widthFactor = 0.7;
            heightFactor = 0.8;
            fontSize = 20;
          } else {
            // Large screen (Desktop)
            widthFactor = 0.5;
            heightFactor = 0.3;
            fontSize = 24;
          }

          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 13, 33, 71),
            ),
            child: Center(
              child: FractionallySizedBox(
                widthFactor: widthFactor,
                heightFactor: heightFactor,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 15, 15, 17),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(radius: 50,backgroundImage: AssetImage('lib/sweta.jpg'),),
                        ),
                        _buildCodeLine(' Void', 'main', '( ) {', fontSize),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '      String',
                                style: TextStyle(color: Colors.white, fontSize: fontSize),
                              ),
                            ),
                            Text(
                              ' name',
                              style: TextStyle(color: Colors.lightBlue, fontSize: fontSize),
                            ),
                            Text(
                              ' =',
                              style: TextStyle(color: Colors.white, fontSize: fontSize), // Changed to yellow
                            ),
                            Text(
                              '  " Sweta Majhi " ',
                              style: TextStyle(color: Colors.red, fontSize: fontSize), // Added semicolon before value
                            ),
                            Text(
                              ' ;',
                              style: TextStyle(color: Colors.white, fontSize: fontSize), // Added semicolon before value
                            ),
                          ],
                        ),
                        _buildCodeLine('      print (', 'name', ') ;', fontSize),
                        _buildCodeLine(' }', "", "", fontSize),
                     
                        const Divider(color: Colors.white, thickness: 1),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text("Output:",style: TextStyle(color: Colors.yellow),),
                            Text("   Sweta Majhi",style: TextStyle(color: Colors.lightBlue),),
                            // Text("        Developed by:swetamajhi.com.np",style: TextStyle(color: Colors.lightBlue),),
                            ],
                          ),
                        ),
                        
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCodeLine(String type, String variable, String symbol, double fontSize, {bool highlightValue = false}) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            type,
            style: TextStyle(color: Colors.white, fontSize: fontSize),
          ),
        ),
        Text(
          variable,
          style: TextStyle(color: Colors.lightBlue, fontSize: fontSize),
        ),
        Text(
          ' $symbol',
          style: TextStyle(color: highlightValue ? Colors.red : Colors.white, fontSize: fontSize),
        ),
        
      ],
    );
  }
}
