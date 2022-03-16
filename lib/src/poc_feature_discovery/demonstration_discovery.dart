import 'package:flutter/material.dart';
import 'package:feature_discovery/feature_discovery.dart';
import 'package:poc_new_feature/src/shared/components/app_card.dart';

const String feature1 = 'feature1',
    feature2 = 'feature2',
    feature3 = 'feature3',
    feature4 = 'feature4',
    feature5 = 'feature5';

class DemonstrationDiscovery extends StatefulWidget {
  const DemonstrationDiscovery({Key? key}) : super(key: key);

  @override
  State<DemonstrationDiscovery> createState() => _DemonstrationDiscoveryState();
}

class _DemonstrationDiscoveryState extends State<DemonstrationDiscovery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feature Discovery'),
        centerTitle: true,
        leading: StatefulBuilder(
          builder:
              (BuildContext context, void Function(void Function()) setState) =>
                  DescribedFeatureOverlay(
            featureId: feature1,
            tapTarget: const Icon(Icons.menu),
            backgroundColor: Colors.teal,
            title: const Text('New Feature'),
            enablePulsingAnimation: false,
            child: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {},
            ),
          ),
        ),
        actions: <Widget>[
          DescribedFeatureOverlay(
            featureId: feature2,
            tapTarget: const Icon(Icons.search),
            backgroundColor: Colors.green,
            title: const Text('Search your compounds'),
            description: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                    'Tap the magnifying glass to quickly scan your compounds'),
                TextButton(
                  onPressed: () async =>
                      FeatureDiscovery.completeCurrentStep(context),
                  child: Text(
                    'Understood',
                    style: Theme.of(context)
                        .textTheme
                        .button!
                        .copyWith(color: Colors.white),
                  ),
                ),
                TextButton(
                  onPressed: () => FeatureDiscovery.dismissAll(context),
                  child: Text(
                    'Dismiss',
                    style: Theme.of(context)
                        .textTheme
                        .button!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
            child: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(
              height: 200,
            ),
            ContentTest(),
            //Content(),
          ],
        ),
      ),
      floatingActionButton: StatefulBuilder(
        builder:
            (BuildContext context, void Function(void Function()) setState) =>
                DescribedFeatureOverlay(
          featureId: feature3,
          tapTarget: const Icon(Icons.add),
          backgroundColor: Colors.green,
          overflowMode: OverflowMode.extendBackground,
          title: const Text('FAB feature'),
          description: Column(children: <Widget>[
            const Text(
                'This is overly long to test OverflowMode.extendBackground. The green circle should be large enough to cover all of the text.'),
            TextButton(
              onPressed: () {},
              child: Text('Add another item',
                  style: Theme.of(context)
                      .textTheme
                      .button!
                      .copyWith(color: Colors.white)),
            ),
          ]),
          child: FloatingActionButton(
            onPressed: () {},
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}

class ContentTest extends StatefulWidget {
  const ContentTest({Key? key}) : super(key: key);

  @override
  State<ContentTest> createState() => _ContentTestState();
}

class _ContentTestState extends State<ContentTest> {
  GlobalKey<EnsureVisibleState>? ensureKey;
  late bool wasViewed;

  @override
  void initState() {
    ensureKey = GlobalKey<EnsureVisibleState>();
    wasViewed = false;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
      child: Column(
        children: <Widget>[
          DescribedFeatureOverlay(
            featureId: feature4,
            tapTarget: const Icon(
              Icons.thumb_up_alt_outlined,
              color: Colors.lightBlue,
            ),
            backgroundColor: Colors.lightBlueAccent,
            enablePulsingAnimation: false,
            contentLocation: ContentLocation.trivial,
            title: const Text('Discover Features'),
            description: const Text('Description of new feature...'),
            child: EnsureVisible(
              key: ensureKey,
              child: AppCard(
                  id: '6',
                  label: 'Test Feature Discovery',
                  tag: 'New Feature',
                  tagColor: Colors.purpleAccent,
                  positionRight: 0,
                  actionPrimary: wasViewed
                      ? () {
                          Navigator.pop(context);
                        }
                      : () {
                          FeatureDiscovery.discoverFeatures(
                            context,
                            const <String>{
                              //feature1,
                              //feature2,
                              //feature3,
                              feature4,
                            },
                          );
                          setState(() {
                            wasViewed = true;
                          });
                        }),
            ),
          ),
        ],
      ),
    ));
  }
}
