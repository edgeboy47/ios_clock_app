import 'package:clock_app/world_clock/view/theme.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      home: Scaffold(
        body: SafeArea(
          child: Builder(builder: (BuildContext context) {
            return Container(
              color: Theme.of(context).primaryColor,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.tune_sharp),
                        Icon(
                          Icons.add_circle,
                          color: Theme.of(context).accentColor,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text('Newport Beach, USA | PST'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '6:20',
                              style: Theme.of(context).textTheme.headline1,
                            ),
                            RotatedBox(
                              quarterTurns: 3,
                              child: Text(
                                'PM',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
