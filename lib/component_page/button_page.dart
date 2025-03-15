import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:math';

class ComponentDetailPage extends StatefulWidget {
  final String title;

  const ComponentDetailPage({Key? key, required this.title}) : super(key: key);

  @override
  _ComponentDetailPageState createState() => _ComponentDetailPageState();
}

class _ComponentDetailPageState extends State<ComponentDetailPage> {
  bool isSwitched = false;
  bool isLoading = false;
  String dropdownValue = "Option 1";
  bool isToggled = false;
  bool isIconRotated = false;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _buildComponentContent(widget.title),
      ),
    );
  }

  Widget _buildComponentContent(String title) {
    if (title.toLowerCase() == "button") {
      return GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: [
          _buildButton(
            "Gradient Button",
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.blue, Colors.purple]),
                borderRadius: BorderRadius.circular(16),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
                onPressed: () {},
                child: const Text("Gradient",
                    style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
          _buildButton(
            "Glassmorphism Button",
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                        color: Colors.white.withOpacity(0.3), width: 2),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Text("Glass", style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ),
          ),
          _buildButton(
            "3D Button",
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shadowColor: Colors.black,
                elevation: 10,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
              onPressed: () {},
              child: const Text("3D Button", style: TextStyle(fontSize: 18)),
            ),
          ),
          _buildButton(
            "Animated Icon Button",
            IconButton(
              icon: AnimatedRotation(
                turns: isIconRotated ? 0.5 : 0.0,
                duration: Duration(milliseconds: 500),
                child: Icon(Icons.refresh, color: Colors.blue, size: 32),
              ),
              onPressed: () {
                setState(() {
                  isIconRotated = !isIconRotated;
                });
              },
            ),
          ),
          _buildButton(
            "Hover Outlined Button",
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.teal, width: 2),
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
              onPressed: () {},
              child: const Text("Hover Me", style: TextStyle(fontSize: 18)),
            ),
          ),
          _buildButton(
            "Floating Icon Button",
            FloatingActionButton(
              backgroundColor: Colors.pink,
              onPressed: () {},
              child: Icon(Icons.favorite, color: Colors.white, size: 32),
            ),
          ),
          _buildButton(
            "Elevated Button",
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Elevated Button Clicked!")),
                );
              },
              child: const Text("Click"),
            ),
          ),
          _buildButton(
            "Toggle Switch",
            Switch(
              value: isSwitched,
              onChanged: (bool value) {
                setState(() {
                  isSwitched = value;
                });
              },
            ),
          ),
          _buildButton(
            "Dropdown Button",
            DropdownButton<String>(
              value: dropdownValue,
              items: ["Option 1", "Option 2", "Option 3"]
                  .map((String value) => DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      ))
                  .toList(),
              onChanged: (newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
            ),
          ),
          _buildButton(
            "Loading Button",
            ElevatedButton(
              onPressed: isLoading
                  ? null
                  : () {
                      setState(() {
                        isLoading = true;
                      });
                      Future.delayed(Duration(seconds: 2), () {
                        setState(() {
                          isLoading = false;
                        });
                      });
                    },
              child: isLoading
                  ? CircularProgressIndicator(color: Colors.white)
                  : Text("Load"),
            ),
          ),
          _buildButton(
            "Toggled Button",
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: isToggled ? Colors.green : Colors.red,
              ),
              onPressed: () {
                setState(() {
                  isToggled = !isToggled;
                });
              },
              child: Text(isToggled ? "ON" : "OFF"),
            ),
          ),
          _buildButton(
            "SnackBar Button",
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("SnackBar triggered!")),
                );
              },
              child: const Text("Show SnackBar"),
            ),
          ),
          _buildButton(
            "Glowing Button",
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                shadowColor: Colors.blueAccent,
                elevation: 20,
              ),
              onPressed: () {},
              child: const Text("Glow"),
            ),
          ),
          _buildButton(
            "Outline Gradient",
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 3,
                  color: Colors.purple,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextButton(
                onPressed: () {},
                child: Text("Gradient Border"),
              ),
            ),
          ),
          _buildButton(
            "Expanding Button",
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: isExpanded ? 200 : 100,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: Text("Expand", style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
          _buildButton(
            "Rotating Icon",
            IconButton(
              icon: AnimatedRotation(
                duration: Duration(milliseconds: 500),
                turns: isToggled ? 1 : 0,
                child: Icon(Icons.sync, color: Colors.green, size: 32),
              ),
              onPressed: () {
                setState(() {
                  isToggled = !isToggled;
                });
              },
            ),
          ),
          _buildButton(
            "Press Depth Button",
            GestureDetector(
              onTapDown: (_) => setState(() => isToggled = true),
              onTapUp: (_) => setState(() => isToggled = false),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 100),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: isToggled
                      ? []
                      : [BoxShadow(color: Colors.black45, blurRadius: 10)],
                ),
                child: Text("Press Me", style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
          _buildButton(
            "Border Animation",
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 3,
                  color: Colors
                      .primaries[Random().nextInt(Colors.primaries.length)],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextButton(
                onPressed: () {
                  setState(() {});
                },
                child: Text("Border Color"),
              ),
            ),
          ),
        ],
      );
    } else {
      return Center(child: Text("No preview available for $title"));
    }
  }

  Widget _buildButton(String label, Widget button) {
    return Card(
      color: Colors.white,
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            button,
          ],
        ),
      ),
    );
  }
}
