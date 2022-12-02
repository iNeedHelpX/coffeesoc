import 'package:coffeesoc/pages/widgets/neurobox.dart';
import 'package:flutter/material.dart';

class PandaPage extends StatelessWidget {
  const PandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Stack(
          children: [
            NeuromorphicBox(
                boomtitle: "Recommended by others",
                subtext: "shops visited recently"),
          ],
        ),
      ),
    );
  }
}
