// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:shape_builder/shape_builder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      // home: const WorkShop(),
      // home: const FrameExample(),
      // home: const FrameExample1(),
      // home: const OverlayExample(),
      // home: const CircleExample(),
      // home: const RectangleExample(),
      // home: const RRectangleExample(),
      // home: const FavoriteExample(),
      // home: const ClipExample(),
      // home: const ImageClipper(),
      // home: const GradientColorExample(),
      // home: const MyCoranWidget(),
      home: const AdaptiveLayout(),
    );
  }
}

class AdaptiveLayout extends StatelessWidget {
  const AdaptiveLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: //
          //     Column(
          //   children: [
          //     SizedBox(
          //       width: 280,
          //       height: 180,
          //       child: FittedBox(
          //         fit: BoxFit.contain,
          //         child: LimitedBox(
          //           // maxHeight: height ?? constraints.maxHeight,
          //           // maxWidth: width ?? constraints.maxWidth,
          //           child: Text('lh'),
          //         ),
          //       ).colorize(),
          //     ),
          //     Text('lh').resize().fixed(width: 280, height: 180).colorize(),

          //   ],
          // ),
          //         Column(
          //   children: [
          //     SizedBox(
          //         height: 150,
          //         child: TextField().colorize(Colors.amber.withOpacity(0.2))),
          //     SizedBox(
          //       height: 12,
          //     ),
          //     Padding(
          //         padding: const EdgeInsets.all(80.0),
          //         child: TextField()
          //             .colorize(Colors.red)
          //             .resize(respectAspectRatio: true)
          //             .fixed(
          //               // width: 250,
          //               height: 180,
          //             )
          //         // .colorize(),
          //         ).colorize(Colors.amber),
          //     Text('l44'),
          //   ],
          // )
          // .resize(respectAspectRatio: true) //
          // .fixed()
          // .colorize(Colors.amber),
          //
          //

          Column(
        children: [
          SizedBox(
            width: 600,
            height: 200,
            child: FittedBox(
              fit: BoxFit.contain,
              child: LimitedBox(
                // maxHeight: height ?? constraints.maxHeight,
                // maxWidth: width ?? constraints.maxWidth,
                child: Text('This is me'),
              ),
            ).colorize(),
          ),
          Text('This is me1')
              .resize()
              .fixed(height: 200, width: double.infinity),
        ],
      ),
      // ListTile(title: Text('lskdjfsldkj').colorize())
      //     .resize(respectAspectRatio: true)
      //     .fixed(),
      //
      //
      //         SizedBox(
      //   // height: 30,
      //   child: Column(
      //     children: [
      //       Text('This isme'),
      //     ],
      //   ).colorize().resize().fixed(
      //       //
      //       width: 200),
      // ) //
    );
  }
}

class WorkShop extends StatelessWidget {
  const WorkShop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          // width: double.infinity,
          // height: double.infinity,
          child: RRectangle.square(
            // isOverlay: true,
            // side: 500,
            // width: double.infinity,
            // // height: double.infinity,
            // height: 80,
            // radius: 250,
            // width: double.infinity,
            // height: double.infinity,
            child: SizedBox(
                child: Text('GI lskdjfls d lsdkfj sldf lksdfkj sdlkf sdlkf ')),
            alignment: Alignment.bottomRight,
          ),
        ),
      ).colorize(Color.fromARGB(70, 255, 193, 7)),
    );
  }
}

class GradientColorExample extends StatelessWidget {
  const GradientColorExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Rectangle.square(
            color: ColorWithGradient(
                LinearGradient(colors: [Colors.red, Colors.blue])),
          ),
        ],
      ),
    );
  }
}

class MyCoranWidget extends StatelessWidget {
  const MyCoranWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 10,
            child: RRectangle(
              width: double.infinity,
              outerVBorderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
              child: const Text('This is yours'),
            ),
          ),
          Spacer(
            flex: 6,
          ),
        ],
      ).foreground().build(
            Column(
              children: [
                Spacer(
                  flex: 10,
                ),
                Expanded(
                  flex: 4,
                  child: RRectangle(
                    width: double.infinity,
                    boxShadow: [BoxShadow(blurRadius: 5, spreadRadius: 0.5)],
                    borderRadius: BorderRadius.only(
                      topRight: Radius.elliptical(50, 50),
                      bottomLeft: Radius.elliptical(50, 50),
                    ),
                    outerVBorderRadius: BorderRadius.only(
                      topLeft: Radius.elliptical(50, 50),
                      bottomRight: Radius.elliptical(50, 50),
                    ),
                    color: Colors.amber,
                    child: Text('This is you'),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Center(child: Text('This is me')),
                ),
              ],
            ),
          ),
    );
  }
}

class ImageClipper extends StatelessWidget {
  const ImageClipper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Image.network(
      //   'https://twistedsifter.com/wp-content/uploads/2010/11/funny-splash-mountain-28.jpg',
      //   // fit: BoxFit.scaleDown,
      //   fit: BoxFit.cover,
      // )
      //     .foreground(
      //       color: Colors.green.withOpacity(0.1),
      //       // clipBehavior: Clip.antiAlias,
      //       alignment: Alignment.center,
      //     )
      //     .buildCircle(radius: 300),
      // .buildRect(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
                // backgroundBlendMode: BlendMode,
                image: DecorationImage(
                  fit: BoxFit.none,
                  image: NetworkImage(
                    'https://twistedsifter.com/wp-content/uploads/2010/11/funny-splash-mountain-28.jpg',
                  ),
                ),
              ),
              child: SizedBox.square(
                dimension: 300,
              ),
            ),

            Image.network(
              'https://twistedsifter.com/wp-content/uploads/2010/11/funny-splash-mountain-28.jpg',
              fit: BoxFit.cover,
              // fit: BoxFit.cover,
            )
                .foreground(
                  // color: Colors.red,
                  color: ColorWithBlendMode(Colors.red, BlendMode.colorBurn),
                  // color: ColorWithGradient(
                  //   LinearGradient(colors: [Colors.transparent, Colors.blue]),
                  //   blendMode: BlendMode.difference,
                  // ),
                  clipBehavior: Clip.antiAlias,
                  // alignment: Alignment.bottomRight,
                )
                .buildCircle(radius: 150)
                .colorize()
            // .background(
            //   alignment: Alignment.topLeft,
            //   clipBehavior: Clip.antiAlias,
            // )
            // .buildCircle(radius: 100)
            ,

            // .buildCapsule(height: 300),
            Image.network(
              'https://twistedsifter.com/wp-content/uploads/2010/11/funny-splash-mountain-28.jpg',
              // fit: BoxFit.scaleDown,
              fit: BoxFit.cover,
              // colorBlendMode: BlendMode.colorBurn,
            )
                .foreground(
                  color: Colors.red.withOpacity(.3),
                  clipBehavior: Clip.antiAlias,
                  alignment: Alignment.center,
                )
                .buildCapsule(height: 300, width: 600),

            // .buildOval(height: 80, width: 150),
          ],
        ),
      ),
    );
  }
}

class FrameExample extends StatelessWidget {
  const FrameExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
          // body: Center(
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Stack(
          //       children: [
          //         // Text('Hi this is me')
          //         //     .frame(
          //         //       alignment: Alignment.bottomRight,
          //         //       elevation: 10,
          //         //       shadowColor: Colors.red,
          //         //     )
          //         //     .buildRRect(height: 100, width: double.infinity)
          //         //     .frame(
          //         //       isOverlay: true,
          //         //       color: Colors.red,
          //         //       alignment: Alignment.topLeft,
          //         //     )
          //         //     .buildRect(width: 10, height: 10),
          //         Ovel.circle(),
          //         Text('That is not me')
          //             .frame(elevation: 4)
          //             .buildRSquare(side: 50),
          //         Text('This is me')
          //             .frame(
          //               alignment: Alignment.topLeft,
          //               elevation: 6,
          //               // clipBehaviour: Clip.antiAlias,
          //             )
          //             .buildCircle(swipAngle: 5)
          //             .colorize(Colors.red),
          //         // SizedBox(height: 10),
          //         // Row(
          //         //   children: [
          //         //     Text('This is me')
          //         //         .frame(alignment: Alignment.center)
          //         //         .buildSquare(50),
          //         //     // SizedBox(height: 10),
          //         //     Text('This is me')
          //         //         .frame(alignment: Alignment.center)
          //         //         .buildRSquare(side: 50, radius: Radius.zero),
          //         //   ],
          //         // )
          //         // RRectangle(
          //         //   height: 100,
          //         //   width: double.infinity,
          //         //   alignment: Alignment.bottomRight,
          //         //   elevation: 10,
          //         //   shadowColor: Colors.red,
          //         //   child: Text('Hi this is me'),
          //         // ),
          //         // SizedBox(height: 10),
          //         // RRectangle(
          //         //   height: 100,
          //         //   width: double.infinity,
          //         //   elevation: 10,
          //         //   shadowColor: Colors.red,
          //         // )
          //         //     .overlay(
          //         //       Alignment.bottomRight,
          //         //     )
          //         //     .build(
          //         //       Text('Hi this is me'),
          //         //     ),
          //       ],
          //     ),
          //   ),
          // ),

          body: Center(
        child: const Text('Hello, world')
            .background(color: Colors.red)
            .buildRRect()
            .background(color: Colors.orange)
            .buildRRect(height: 100)
            .background(color: Colors.purple)
            .buildRRect(width: 150)
            .background(color: Colors.pink, alignment: Alignment.center)
            .buildRRect(width: double.infinity)
            .background(color: Colors.green)
            .buildRRect(height: 400)
            .background(color: Colors.yellow, alignment: Alignment.center)
            .buildRRect(height: double.infinity),
      )),
    );
  }
}

class FrameExample1 extends StatelessWidget {
  const FrameExample1({super.key});

  @override
  Widget build(BuildContext context) {
    final shadow = [
      BoxShadow(
        color: Colors.red,
        offset: Offset(1, 1),
        spreadRadius: 10,
        blurRadius: 5,
      ),
      BoxShadow(
        color: Colors.green,
        offset: Offset(10, 10),
        spreadRadius: 10,
        blurRadius: 10,
      )
    ];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          DecoratedBox(
            decoration: BoxDecoration(
              boxShadow: shadow,
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: SizedBox.square(
              dimension: 88,
            ),
          ),
          // Material(
          //   shape: CircleBorder(),
          //   elevation: 8,
          //   color: Colors.red,
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Text('XXXXX'),
          //   ),
          // ),
          Padding(padding: const EdgeInsets.all(8.0), child: Text('101234566'))
              .background(
                boxShadow: shadow,
              )
              .buildCapsule(width: 88, height: 50),
          // SizedBox(height: 8),
          // Padding(padding: const EdgeInsets.all(8.0), child: Text('101234566'))
          //     .background(
          //       shadow: shadow,
          //       color: Colors.white,
          //     )
          //     .buildRSquare(
          //       side: 88,
          //     ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 10),
            child: Text('XXXXXX'),
          )
              .background(
                  alignment: Alignment.bottomCenter,
                  boxShadow: shadow,
                  color: ColorWithGradient(
                      RadialGradient(colors: [Colors.white, Colors.blue])))
              .buildCircle(startAngle: 1, swipeAngle: 5),
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 10),
          //   child: Text('XXXXXX'),
          // ).background(
          //   alignment: Alignment.bottomCenter,
          //   shadow: [BoxShadowWithElevation(12)],
          // ).buildCircle(startAngle: 1, swipeAngle: 5),
        ]),
      ),
    );
  }
}

class CircleExample extends StatelessWidget {
  const CircleExample({super.key});

  @override
  Widget build(BuildContext context) {
    const double elevation = 10;
    return Scaffold(
      body: Column(
        children: [
          RRectangle(
            height: 100,
            width: 150,
          ),
          Oval.circle(
            radius: 100,
            startAngle: 1,
            swipeAngle: 6,
            color: Colors.white,
            boxShadow: BoxShadowWithElevation(elevation),
          ),
          Oval.circle(
            radius: 100,
            color: Colors.red,
          ),
          Oval(
            boxShadow: BoxShadowWithElevation(5),
            color: Colors.white,
            width: 100,
            height: 50,
            startAngle: 0,
            swipeAngle: 6,
          ),
          Oval.circle(
            radius: 100,
            boxShadow: BoxShadowWithElevation(1),

            color: ColorWithGradient(
              const RadialGradient(
                colors: [Colors.yellow, Colors.white],
              ),
            ),
            // color: Colors.yellow,
          )
        ],
      ),
    );
  }
}

class RectangleExample extends StatelessWidget {
  const RectangleExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Rectangle.square().frame().buildSquare(100),
            // Rectangle(
            //   color: Colors.red,
            //   height: 100,
            // ),
            Rectangle(
              color: ColorWithGradient(
                  LinearGradient(colors: [Colors.red, Colors.blue])),
              width: 200,
              height: 100,
            ),
            Rectangle.square(
              side: 100,
              color: Colors.white,
              boxShadow: BoxShadowWithElevation(10, color: Colors.yellow),
            ),
            SizedBox(height: 8),
            Rectangle(
              height: 150,
              width: 150,
            ).foreground(alignment: Alignment.bottomRight).build(
                  Rectangle(
                    height: 100,
                    width: 100,
                    color: Colors.black,
                  ).foreground(alignment: Alignment.topLeft).build(
                        Rectangle(
                          height: 50,
                          width: 50,
                          color: Colors.red,
                          child: Text('4'),
                        ),
                      ),
                ),
            SizedBox(height: 8),
            Rectangle(
              height: 50,
              width: 50,
              color: Colors.red,
            )
                .background(alignment: Alignment.topLeft)
                .build(
                  Rectangle(
                    height: 100,
                    width: 100,
                    color: Colors.black,
                  ),
                )
                .background(alignment: Alignment.bottomRight)
                .build(
                  Rectangle(
                    height: 150,
                    width: 150,
                  ),
                ),
          ],
        ),
      ),
    );
  }
}

class RRectangleExample extends StatelessWidget {
  const RRectangleExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Card(
              //   shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(12)),
              //   child: SizedBox.square(
              //     dimension: 100,
              //   ),
              // ),
              // RRectangle.square(
              //   side: 100,
              // ),
              RRectangle.square(
                side: 100,
                borderRadius: BorderRadius.all(Radius.elliptical(20, 40)),
              ),
              // RRectangle.square(
              //   side: 100,
              //   color: Colors.yellow,
              //   radius: RadiusCorners(
              //     topLeft: Radius.circular(100),
              //   ),
              // ),
              Text('this is me').background(color: Colors.yellow).buildRect(),
              RRectangle.capsule(
                // height: 20,
                color: Colors.green,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text('lksjdflksdkjjhkjhkhkhkhklf\n lskdjfldskj'),
                ),
              ),
              Rectangle(
                boxShadow: BoxShadowWithElevation(5),
                color: ColorWithGradient(
                    LinearGradient(colors: [Colors.green, Colors.greenAccent])),
                width: 200,
                alignment: Alignment.topLeft,
                child: Text('ldkfj'),
              )
              // RRectangle(
              //   height: 150,
              //   width: 150,
              //   color: Colors.red,
              // ).overlay(Alignment.bottomRight).build(
              //       RRectangle(
              //         height: 100,
              //         width: 100,
              //         color: Colors.black,
              //       ).overlay(Alignment.topLeft).build(
              //             RRectangle(
              //               height: 50,
              //               width: 50,
              //             ),
              //           ),
              //     ),
            ],
          ),
        ),
      ),
    );
  }
}

class OverlayExample extends StatelessWidget {
  const OverlayExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Hello world') //
                .background(color: Color.fromARGB(129, 33, 149, 243))
                .buildSquare(100) //
                .foreground(color: Colors.red, alignment: Alignment.topLeft)
                .buildCircle(radius: 20),
            Text('Hello world') //
                .background(color: Color.fromARGB(129, 33, 149, 243))
                .buildSquare(100) //
                .background(color: Colors.red, alignment: Alignment.topLeft)
                .buildCircle(radius: 20),
            // .background()
            // .build(Ovel.circle(color: Colors.blue)),
            // ,
            SizedBox(height: 8),
            // SizedBox(
            //   width: 100,
            //   height: 100,
            // ) //
            //     .colorize() //
            //     .foreground(alignment: Alignment.bottomRight)
            //     .build(Text('HI')),

            // SizedBox(
            //   width: 100,
            //   height: 100,
            // ) //
            //     .colorize() //
            //     .overlay(
            //         Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Text('HI nn nn '),
            //             Circle(radius: 20),
            //           ],
            //         ),
            //         alignment: Alignment.topLeft),
            Oval.circle(
              radius: 120,
              clipBehavior: Clip.antiAlias,
            ).foreground().build(
                  Oval.circle(
                    radius: 100,
                    color: Colors.amber,
                  ),
                ),
          ],
        ) //
        // .frame(height: 120, width: 120) //
        // .background(Circle(
        //   color: Colors.red,
        // ))
        ,
      ),
    );
  }
}

class FavoriteExample extends StatelessWidget {
  const FavoriteExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Icon(
              Icons.favorite,
              size: 48,
              color: Colors.white,
            )
                .background(
                  boxShadow: BoxShadowWithElevation(8,
                      color: Color.fromARGB(122, 4, 4, 4)),
                  color: ColorWithGradient(
                    LinearGradient(
                      colors: [Colors.blue.shade300, Colors.blue.shade900],
                    ),
                  ),
                )
                .buildCircle(radius: 100)

                //
                .foreground(alignment: Alignment(1, 1) / 1.1)
                .build(
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      '5',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  )
                      .background(
                        color: Colors.blue.shade900,
                        boxShadow:
                            BoxShadowWithElevation(12, color: Colors.white),
                      )
                      .buildCircle(),
                ),
            //   Icon(
            //     Icons.favorite,
            //     size: 40,
            //     color: Colors.white,
            //   )
            //       .frame(
            //         elevation: 6,
            //         shadowColor: Color.fromARGB(123, 13, 72, 161),
            //         color: GradientColor(
            //           LinearGradient(
            //             colors: [Colors.blue.shade300, Colors.blue.shade900],
            //           ),
            //         ),
            //       )
            //       .buildCircle(radius: 100)
            //       .overlay(Alignment.bottomRight)
            //       .build(
            //         Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child: Text(
            //             '5',
            //             style: Theme.of(context).textTheme.titleMedium!.copyWith(
            //                   color: Colors.white,
            //                 ),
            //           ),
            //         )
            //             .background() //
            //             .build(Ovel.circle(
            //               color: Colors.blue.shade900,
            //               elevation: 12,
            //               shadowColor: Colors.white,
            //             )),
            //       ),
          ],
        ),
      ),
    );
  }
}

class ClipExample extends StatelessWidget {
  const ClipExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Material(
                color: Colors.blue,
                shape: CircleBorder(),
                child: Align(
                    alignment: Alignment.bottomLeft, child: Text('Fhis is me')),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text('Shis is me'),
              )
                  .background(clipBehavior: Clip.hardEdge) //
                  .buildSquare(),

              Text('This is me').background().buildCircle(),

              Material(
                child: InkWell(
                  onTap: () => print('Tap'),
                  child: Text('TAP'),
                ),
              ).background(clipBehavior: Clip.antiAlias).buildCapsule(
                    width: double.infinity,
                    height: 100,
                  ),
              Expanded(
                child: Text('This is me')
                    .background(alignment: Alignment.center)
                    .build(Oval.circle()),
              ),
              //
              //
              // RRectangle.capsule(
              //   clipBehavior: Clip.antiAlias,
              //   elevation: 5,
              //   color: GradientColor(
              //     LinearGradient(colors: [Colors.red, Colors.blue]),
              //   ),
              //   child: Rectangle(
              //     color: Colors.yellow,
              //     height: 100,
              //   ),
              // ).frame().buildRect(),
              // Ovel(
              //   clipBehavior: Clip.hardEdge,
              //   elevation: 5,
              //   color: GradientColor(
              //     LinearGradient(colors: [Colors.red, Colors.blue]),
              //   ),
              //   child: Text('Hi there All'),
              // ),
              // Ovel(
              //   clipBehavior: Clip.antiAlias,
              //   elevation: 5,
              //   color: GradientColor(
              //     LinearGradient(colors: [Colors.red, Colors.blue]),
              //   ),
              //   child: Text('Hi there All'),
              // ),
              // Ovel(
              //   clipBehavior: Clip.antiAliasWithSaveLayer,
              //   elevation: 5,
              //   color: GradientColor(
              //     LinearGradient(colors: [Colors.red, Colors.blue]),
              //   ),
              //   child: Text('Hi there All'),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
