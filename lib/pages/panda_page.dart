import 'package:coffeesoc/pages/widgets/neurobox.dart';
import 'package:flutter/material.dart';

class PandaPage extends StatefulWidget {
  const PandaPage({super.key});

  @override
  State<PandaPage> createState() => _PandaPageState();
}

class _PandaPageState extends State<PandaPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(children: [
        SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NeuromorphicBox(
                boomtitle: 'Services Section',
                subtext:
                    'Here you will find cool services provided by local people',
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
