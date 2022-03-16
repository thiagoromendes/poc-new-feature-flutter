import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter/material.dart';
import 'package:poc_new_feature/src/poc_feature_discovery/demonstration_discovery.dart';
import 'package:poc_new_feature/src/poc_refactor_component/demonstration_component.dart';
import 'package:poc_new_feature/src/router/app_router.dart';
import 'package:poc_new_feature/src/shared/components/app_card.dart';
import 'package:poc_new_feature/src/version_control/version_control.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final VersionControl versionControl = VersionControl();

  @override
  void initState() {
    super.initState();
    setVersionControl();
  }

  Future<void> setVersionControl() async {
    if (!await versionControl.hasList()) {
      versionControl.setListFeatureId();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
          child: ListView(
            children: [
              const Text(
                'Estratégias POC',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.lightBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              const SizedBox(
                height: 50,
              ),
              AppCard(
                label: 'POC Refactor Components',
                tag: 'Refactor',
                tagColor: Colors.redAccent,
                actionPrimary: () =>
                    AppRouter.push(context, const DemonstrationComponent()),
                positionRight: 0,
                iconLeft: const Icon(
                  Icons.auto_awesome_motion_outlined,
                  color: Colors.redAccent,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              AppCard(
                label: 'POC Feature Discovery',
                tag: 'New Lib',
                tagColor: Colors.purpleAccent,
                positionRight: 0,
                actionPrimary: () => AppRouter.push(
                  context,
                  const FeatureDiscovery.withProvider(
                    persistenceProvider: NoPersistenceProvider(),
                    child: DemonstrationDiscovery(),
                  ),
                ),
                iconLeft: const Icon(
                  Icons.chrome_reader_mode_outlined,
                  color: Colors.purpleAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
