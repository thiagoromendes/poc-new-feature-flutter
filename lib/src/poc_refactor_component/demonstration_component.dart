import 'package:flutter/material.dart';
import 'package:poc_new_feature/src/shared/components/app_card.dart';

class DemonstrationComponent extends StatefulWidget {
  const DemonstrationComponent({Key? key}) : super(key: key);

  @override
  State<DemonstrationComponent> createState() => _DemonstrationComponentState();
}

class _DemonstrationComponentState extends State<DemonstrationComponent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Refactor Components'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
          child: ListView(
            children: [
              const SizedBox(
                height: 200,
              ),
              AppCard(
                id: "1",
                label: 'Test Refactor Components - FeatureId 01',
                tag: 'Novo',
                tagColor: Colors.lightBlue,
                actionPrimary: () => Navigator.pop(context),
                positionRight: 0,
              ),
              const SizedBox(
                height: 20,
              ),
              AppCard(
                id: "2",
                label: 'Test Refactor Components - FeatureId 02',
                tag: 'Novidade',
                tagColor: Colors.lightGreen,
                actionPrimary: () => Navigator.pop(context),
                positionRight: 0,
              ),
              const SizedBox(
                height: 20,
              ),
              AppCard(
                id: "3",
                label: 'Test Refactor Components - FeatureId 03',
                tag: 'Nova Funcionalidade',
                tagColor: Colors.redAccent,
                actionPrimary: () => Navigator.pop(context),
                positionRight: 0,
              ),
              const SizedBox(
                height: 20,
              ),
              AppCard(
                id: "4",
                label: 'Test Refactor Components - FeatureId 04',
                tag: 'New Feature',
                tagColor: Colors.cyan,
                actionPrimary: () => Navigator.pop(context),
                positionRight: 0,
              ),
              const SizedBox(
                height: 20,
              ),
              AppCard(
                id: "5",
                label: 'Test Refactor Components - FeatureId 05',
                tag: 'New',
                tagColor: Colors.redAccent,
                actionPrimary: () => Navigator.pop(context),
                positionRight: 0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
