import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]);
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Landing(),
    );
  }
}

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    final myAppBar = AppBar(
      title: Text('Responsive'),
    );
    final bodyHeigt = mediaQueryHeight -
        myAppBar.preferredSize.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;

    final bool isLansCape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return MaterialApp(
      home: Scaffold(
          appBar: myAppBar,
          body: Center(
              //Jika Lanscape
              child: (isLansCape)
                  ? Column(
                      children: [
                        Container(
                          color: Colors.red,
                          width: mediaQueryWidth,
                          height: bodyHeigt * 0.5,
                        ),
                        Container(
                          // margin: EdgeInsets.all(40),
                          height: bodyHeigt * 0.5,
                          color: Colors.amber,
                          child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2),
                              itemCount: 20,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: CircleAvatar(),
                                  title: Text("Data Kamu"),
                                );
                              }),
                        )
                      ],
                    )
                  // Jika Potrait
                  : Column(
                      children: [
                        Container(
                          color: Colors.red,
                          width: mediaQueryWidth,
                          height: bodyHeigt * 0.3,
                        ),
                        Container(
                          // margin: EdgeInsets.all(40),
                          height: bodyHeigt * 0.7,
                          color: Colors.amber,
                          child: ListView.builder(
                              itemCount: 100,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: CircleAvatar(),
                                  title: Text("Data Kamu"),
                                );
                              }),
                        )
                      ],
                    ))),
      //
    );
  }
}
