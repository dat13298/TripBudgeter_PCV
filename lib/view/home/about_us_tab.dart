import 'package:flutter/cupertino.dart';

class AboutUsTab extends StatefulWidget {
  const AboutUsTab({super.key});

  @override
  State<AboutUsTab> createState() => _AboutUsTabState();
}

class _AboutUsTabState extends State<AboutUsTab> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("About Us"),);
  }
}
