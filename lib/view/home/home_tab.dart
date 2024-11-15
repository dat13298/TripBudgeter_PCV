import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final TextEditingController _searchController = TextEditingController();

  // Danh sách các địa điểm
  List<String> _items = [
    'Paris',
    'New York',
    'Tokyo',
    'London',
    'Berlin',
    'Sydney',
    'Singapore',
    'Barcelona',
    'Moscow',
    'Dubai',
  ];

  List<String> _filteredItems = [];

  int touchedIndex = -1;

  @override
  void initState() {
    super.initState();

    _searchController.addListener(() {
      filterSearchResults(_searchController.text);
    });
  }

  void filterSearchResults(String query) {
    if (query.isNotEmpty) {
      setState(() {
        _filteredItems = _items
            .where((item) => item.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    } else {
      setState(() {
        _filteredItems.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return CupertinoPageScaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/background_home2.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.6),
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: SingleChildScrollView(
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          SizedBox(height: screenHeight * 0.08),
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                                height: screenHeight * 0.11,
                                width: screenWidth * 0.4,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(0, 3),
                                      )
                                    ]),
                                child: Padding(
                                  padding: EdgeInsets.all(screenWidth * 0.02),
                                  child: Column(
                                    children: [
                                      const Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Current Trip",
                                          style: TextStyle(
                                            color: Color(0xFF9C9C9C),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Title",
                                          style: TextStyle(
                                              fontSize: screenWidth * 0.04,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Remaining Budget",
                                          style: TextStyle(
                                              color: const Color(0xFF9C9C9C),
                                              fontSize: screenWidth * 0.04),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "1240\$",
                                          style: TextStyle(
                                              fontSize: screenWidth * 0.04,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                          SizedBox(height: screenHeight * 0.08),
                          buildSearchField(screenWidth, screenHeight),
                          SizedBox(height: screenHeight * 0.02),
                          buildButtonRow(screenWidth),
                          SizedBox(height: screenHeight * 0.02),

                          /// Chart
                          Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(screenWidth * 0.05),
                                child: Column(
                                  children: [
                                    Text(
                                      "PieChart",
                                      style: TextStyle(
                                        fontSize: screenHeight * 0.025,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: screenHeight * 0.25,
                                      child: buildPieChart(),
                                    ),
                                    SizedBox(
                                      height: screenHeight * 0.14,
                                      child: buildLegend(),
                                    ),
                                  ],
                                ),
                              )),

                          SizedBox(height: screenHeight * 0.02),

                          ///Budget
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: screenHeight * 0.4,
                            child: SingleChildScrollView(
                                child: Padding(
                              padding: EdgeInsets.all(screenWidth * 0.05),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Text(
                                      "Remaining Budget",
                                      style: TextStyle(
                                        fontSize: screenHeight * 0.025,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  buildRecentRow(),
                                  Center(
                                    child: CupertinoButton(
                                      child: const Text("Show more"),
                                      onPressed: () {},
                                    ),
                                  ),
                                ],
                              ),
                            )),
                          )
                        ],
                      ),
                      if (_filteredItems.isNotEmpty)
                        Positioned(
                          top: screenHeight * 0.338,
                          left: screenWidth * 0.05,
                          right: screenWidth * 0.05,
                          child: buildSearchResults(screenWidth, screenHeight),
                        ),
                    ],
                  ),
                )),
          ],
        ));
  }

  Widget buildSearchField(double screenWidth, double screenHeight) {
    return Container(
      width: screenWidth * 0.9,
      height: screenHeight * 0.07,
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        border: Border.all(
          color: const Color(0xFFC0C0C0),
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(70),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: CupertinoTextField(
                controller: _searchController,
                placeholder: 'Search',
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                decoration: const BoxDecoration(
                  border: null,
                ),
                placeholderStyle: TextStyle(
                  color: const Color(0xFFC0C0C0),
                  fontSize: screenHeight * 0.02,
                ),
                style: TextStyle(
                  color: const Color(0xFF4B4B4B),
                  fontSize: screenHeight * 0.02,
                ),
              ),
            ),
          ),
          const Icon(
            CupertinoIcons.search,
            color: Color(0xFFC0C0C0),
          ),
          SizedBox(width: screenWidth * 0.02),
        ],
      ),
    );
  }

  Widget buildButtonRow(double screenWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildButton("Trips", CupertinoIcons.map, Colors.blue),
        buildButton("Budget", Icons.wallet, Colors.green),
        buildButton("Hotels", Icons.hotel, Colors.orange),
        buildButton("Transport", CupertinoIcons.airplane, Colors.red),
      ],
    );
  }

  Widget buildButton(String label, IconData icon, Color color) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenWidth * 0.2,
      height: screenWidth * 0.2,
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(10),
        child: CupertinoButton(
          color: Colors.white,
          onPressed: () {
            // Xử lý khi nhấn nút
            print("$label button pressed");
          },
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: color, size: screenWidth * 0.08),
              SizedBox(height: screenWidth * 0.01),
              Text(
                label,
                style: TextStyle(
                  color: color,
                  fontSize: screenWidth * 0.03,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRecentRow() {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(children: [
      buildRecentActivity("Lunch", "Note note note note", "123\$", () {
        print("Item tapped!");
      }),
      buildRecentActivity("Breakfast", "Note note note note", "123\$", () {
        print("Item tapped!");
      }),
      buildRecentActivity("Ticket", "Note note note note", "123\$", () {
        print("Item tapped!");
      }),
      buildRecentActivity("Flight", "Note note note note", "123\$", () {
        print("Item tapped!");
      }),
    ]);
  }

  Widget buildRecentActivity(
      String type, String note, String price, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey, width: 1.0)),
          ),
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(type,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(note),
                ],
              ),
              Text(price, style: const TextStyle(fontWeight: FontWeight.bold))
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPieChart() {
    return AspectRatio(
      aspectRatio: 1,
      child: PieChart(
        PieChartData(
          pieTouchData: PieTouchData(
            touchCallback: (FlTouchEvent event, pieTouchResponse) {
              setState(() {
                if (!event.isInterestedForInteractions ||
                    pieTouchResponse == null ||
                    pieTouchResponse.touchedSection == null) {
                  touchedIndex = -1;
                  return;
                }
                touchedIndex =
                    pieTouchResponse.touchedSection!.touchedSectionIndex;
              });
            },
          ),
          borderData: FlBorderData(show: false),
          sectionsSpace: 0,
          centerSpaceRadius: 40,
          sections: showingSections(),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(5, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];

      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.blue,
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.orange,
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: Colors.purple,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        case 3:
          return PieChartSectionData(
            color: Colors.green,
            value: 10,
            title: '10%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        case 4:
          return PieChartSectionData(
            color: Colors.grey,
            value: 5,
            title: '5%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        default:
          throw Error();
      }
    });
  }

  Widget buildLegend() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 20,
              height: 20,
              color: Colors.blue,
            ),
            SizedBox(width: 8),
            Text('Remaining Trip: 40%'),
          ],
        ),
        SizedBox(height: 4),
        Row(
          children: [
            Container(
              width: 20,
              height: 20,
              color: Colors.orange,
            ),
            SizedBox(width: 8),
            Text('Transport: 30%'),
          ],
        ),
        SizedBox(height: 4),
        Row(
          children: [
            Container(
              width: 20,
              height: 20,
              color: Colors.purple,
            ),
            SizedBox(width: 8),
            Text('Food Exspense: 15%'),
          ],
        ),
        SizedBox(height: 4),
        Row(
          children: [
            Container(
              width: 20,
              height: 20,
              color: Colors.green,
            ),
            SizedBox(width: 8),
            Text('Hotel: 10%'),
          ],
        ),
        SizedBox(height: 4),
        Row(
          children: [
            Container(
              width: 20,
              height: 20,
              color: Colors.grey,
            ),
            SizedBox(width: 8),
            Text('Other: 5%'),
          ],
        ),
      ],
    );
  }

  Widget buildSearchResults(double screenWidth, double screenHeight) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _filteredItems.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.015),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Color(0xFFC0C0C0), width: 1.0),
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  // Xử lý nhấn vào mục nếu cần
                  print('Tapped on ${_filteredItems[index]}');
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                  child: Text(
                    _filteredItems[index],
                    style: TextStyle(fontSize: screenWidth * 0.045),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
