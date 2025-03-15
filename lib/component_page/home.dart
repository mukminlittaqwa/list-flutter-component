import 'package:component_library/component_page/button_page.dart';
import 'package:flutter/material.dart';

var listing = ["button", "hero", "form", "image", "DatePicker", "slider"];

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = constraints.maxWidth;
          int crossAxisCount = screenWidth > 800 ? 3 : 2;

          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: screenWidth > 800 ? 3 : 1,
                        child: Container(
                          width: 900,
                          padding: const EdgeInsets.all(90),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 70),
                                child: Text(
                                  "Free Flutter Components for Learning & Development",
                                  style: TextStyle(
                                      fontSize: 34,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                  "I have created a collection of free, reusable Flutter components to help developers, students, and anyone who needs high-quality UI elements for their projects. These components are designed to be lightweight, customizable, and easy to integrate into any Flutter application."),
                            ],
                          ),
                        ),
                      ),
                      if (screenWidth > 800) const SizedBox(width: 16),
                      Expanded(
                        flex: 3,
                        child: Container(
                          height: 400,
                          child: Image.network(
                            "https://miro.medium.com/v2/resize:fit:3840/1*EFgOwZx2WKtZfOWTCRYoiA.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // list widget or component
                  ComponentGrid(
                    items: listing,
                    crossAxisCount: crossAxisCount,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ComponentGrid extends StatelessWidget {
  final List<String> items;
  final int crossAxisCount;

  const ComponentGrid({
    Key? key,
    required this.items,
    required this.crossAxisCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ComponentCard(title: items[index]);
      },
    );
  }
}

class ComponentCard extends StatelessWidget {
  final String title;

  const ComponentCard({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ComponentDetailPage(title: title),
          ),
        );
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.widgets, size: 90, color: Colors.blue),
              const SizedBox(height: 10),
              Text(
                "Component $title",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(
                "Reusable Flutter UI",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[700]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
