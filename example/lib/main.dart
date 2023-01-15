import 'package:flutter/material.dart';
import 'package:shape_builder/shape_builder.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Simple shapes')),
        body: const MyHomeBody(),
      ),
    );
  }
}

class MyHomeBody extends StatelessWidget {
  const MyHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // MyStack(
          //   children: [
          //     Rectangle(child: Text('1')),
          //     Text('2'),
          //   ],
          // )
          // IconButton(
          //   hoverColor: Colors.yellow,
          //   onPressed: () {},
          //   iconSize: 80,
          //   icon: Icon(
          //     Icons.favorite,
          //     // size: 80,
          //   ),
          // ),
          // const Divider(),

          // Material(
          //   color: Colors.transparent,
          //   child: InkWell(
          //     hoverColor: Colors.yellow,
          //     onTap: () {},
          //     child: Material(
          //       color: Colors.grey,
          //       type: MaterialType.circle,
          //       // shape: BoxShape.circle,
          //       // decoration: BoxDecoration(
          //       // ),
          //       child: SizedBox(
          //         width: 80,
          //         height: 80,
          //         child: Icon(Icons.favorite),
          //       ),
          //     ),
          //   ),
          // ),
          // const Divider(),
          // Material(
          //   color: Colors.transparent,
          //   child: InkWell(
          //     hoverColor: Colors.yellow,
          //     onTap: () {},
          //     child: Oval.circle(
          //       radius: 40,
          //       color: Colors.grey,
          //       childIsInTheForeground: true,
          //       child: Icon(Icons.favorite),
          //     ),
          //   ),
          // ),
          // const Divider(),

          // Material(
          //   color: Colors.teal[900],
          //   child: Center(
          //     child: Ink(
          //       color: Colors.yellow,
          //       width: 200.0,
          //       height: 100.0,
          //       child: InkWell(
          //           hoverColor: Colors.red,
          //           onTap: () {/* ... */},
          //           child: const Center(
          //             child: Icon(
          //               Icons.favorite,
          //               size: 36,
          //             ),
          //           )),
          //     ),
          //   ),
          // ),
          Icon(Icons.favorite)
              .foreground(
                clipBehavior: Clip.antiAlias,
                color: ColorWithGradient(
                  LinearGradient(colors: [Colors.red, Colors.transparent]),
                ),
              )
              .inkWell(
                InkWell(
                  // hoverColor: Colors.red,
                  onTap: () {},
                ),
              )
              .buildOval(width: 80, height: 80)
          // .colorize(),

          // Oval.circle(
          //   radius: 40,
          //   color: Colors.grey.withOpacity(.2),
          //   childIsInTheForeground: false,
          //   clipBehavior: Clip.antiAlias,
          //   inkWell: InkWell(
          //     splashColor: Colors.yellow,
          //     onTap: () {},
          //   ),
          //   child: Icon(Icons.favorite),
          // ),
          // Oval.circle(
          //   radius: 40,
          //   clipBehavior: Clip.antiAlias,
          //   // inkWell: InkWell(
          //   //   hoverColor: Colors.yellow,
          //   //   onTap: () {},
          //   // ),
          //   child: Image.network(
          //     'https://placebear.com/600/240',
          //     fit: BoxFit.cover,
          //   ),
          // )
          //     .background(
          //       color: Colors.transparent,
          //       // clipBehavior: Clip.antiAlias,
          //     )
          //     .inkWell(
          //       InkWell(
          //         splashColor: Colors.yellow,
          //         onTap: () {},
          //       ),
          //     )
          //     .buildCircle(
          //       radius: 40,
          //     ),
          // Container(
          //   color: Colors.teal[900],
          //   child: Center(
          //     child: Ink(
          //       color: Colors.yellow,
          //       width: 200.0,
          //       height: 100.0,
          //       child: InkWell(
          //           onTap: () {/* ... */},
          //           child: const Center(
          //             child: Text('YELLOW'),
          //           )),
          //     ),
          //   ),
          // ),
          // Material(
          //   color: Colors.grey[800],
          //   child: Center(
          //     child: Ink.image(
          //       image: const NetworkImage('https://placebear.com/600/240'),
          //       fit: BoxFit.cover,
          //       width: 300.0,
          //       height: 200.0,
          //       child: InkWell(
          //         onTap: () {/* ... */},
          //         child: const Align(
          //           alignment: Alignment.topLeft,
          //           child: Padding(
          //             padding: EdgeInsets.all(10.0),
          //             child: Text(
          //               'KITTEN',
          //               style: TextStyle(
          //                 fontWeight: FontWeight.w900,
          //                 color: Colors.white,
          //               ),
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          /////////////////////////////
          // Rectangle(
          //   child: const Text('This is A Rectangle').padding.all(),
          // ),
          // const SizedBox(height: 8),
          // const Text('This is A Rounded Rectangle')
          //     .padding
          //     .all()
          //     .background()
          //     .buildRRect(),
          // const SizedBox(height: 8),
          // RRectangle.capsule(
          //   width: double.infinity,
          //   child: const Text('This is A Capsule').padding.all(),
          // ),
          // const SizedBox(height: 8),
          // const Text('This is An Oval')
          //     .padding
          //     .all()
          //     .background()
          //     .buildOval(width: double.infinity),
          // const SizedBox(height: 8),
          // Rectangle.square(
          //   color: Colors.amber,
          //   side: 150,
          //   child: const Text('This is A Square').padding.all(),
          // ),
          // const SizedBox(height: 8),
          // const Text('This is A Circle')
          //     .background(color: Colors.amber)
          //     .buildCircle(radius: 75, swipeAngle: 5),
          // const SizedBox(height: 8),
          // const Text('This is A Circle')
          //     .background(
          //       color: Colors.amber,
          //       paintStyle: PaintStyle(
          //         style: PaintingStyle.stroke,
          //         strokeWidth: 4,
          //       ),
          //     )
          //     .buildCircle(
          //       radius: 75,
          //       swipeAngle: 5,
          //       shouldClosePathToCenter: true,
          //     ),
          // const SizedBox(height: 8),
          // const Text('This is A Circle')
          //     .background(
          //       color: ColorWithGradient(
          //         const RadialGradient(colors: [Colors.white, Colors.amber]),
          //       ),
          //     )
          //     .buildCircle(radius: 75),
          // const SizedBox(height: 8),
          // Oval.circle(
          //   radius: 75,
          //   boxShadow: const [BoxShadow(offset: Offset(4, 4), blurRadius: 6)],
          //   child: const Text('This is A Rectangle'),
          // ),
          // const SizedBox(height: 8),
          // Oval.circle(
          //   radius: 75,
          //   boxShadow: BoxShadowWithElevation(7, color: Colors.amber),
          //   child: const Text('This is A Rectangle'),
          // ),
        ],
      ).padding.all(),
    );
  }
}
