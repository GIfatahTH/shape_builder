import 'dart:ui';

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
      home: //
          // const Example1(),
          // const TextFliedExample(),
          // const fromParent.width(),
          // AdaptiveLayout(),
          // WelcomePage(),
          AdaptiveExample(),
      // FixedExample(),
    );
  }
}

class AdaptiveExample extends StatelessWidget {
  AdaptiveExample({super.key}) {
    InheritedLayout.scaleFactor = 1;
    ScaffoldInheritedLayout.query = [
      Query.constant(step: 800),
      Query.linear(step: 1000),
      Query.constant(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    const example = 1;
    return ScaffoldInheritedLayout.singleChildScrollView(
      builder: (_, __) => Builder(
        builder: (context) {
          if (example == 6) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Title'),
                // centerTitle: true,
              ),
              body: const Center(
                child: Text('Center text1'),
              ),
            ).resize().adaptive();
          }
          return Scaffold(
            body: Builder(
              builder: (context) {
                if (example == 1) {
                  return Row(
                    children: [
                      const Text(
                        'This is a text',
                        style: TextStyle(fontSize: 48),
                      ),
                    ],
                  ).resizeAdaptive().colorize();
                }
                if (example == 2) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'This is a text',
                        style: TextStyle(fontSize: 48),
                      ).resize().adaptive(),
                      const Text(
                        'This is a text',
                        style: TextStyle(fontSize: 22),
                      ).resize().adaptive(),
                      Checkbox(value: true, onChanged: (_) {}),
                      Checkbox(value: true, onChanged: (_) {})
                          .resize()
                          .adaptive(),
                      Checkbox(value: true, onChanged: (_) {})
                          .resize()
                          .adaptive(2)
                    ],
                  );
                }
                if (example == 3) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          CheckboxListTile(
                            value: true,
                            onChanged: (_) {},
                            title: const Text('This is the 0.25 title'),
                          ).resize().adaptive(.25).colorize(),
                          CheckboxListTile(
                            value: true,
                            onChanged: (_) {},
                            title: const Text('This is the 0.50 title'),
                          ).resize().adaptive(.5),
                          CheckboxListTile(
                            value: true,
                            onChanged: (_) {},
                            title: const Text('This is the 0.75 title'),
                          ).resize().adaptive(.75),
                          CheckboxListTile(
                            value: true,
                            onChanged: (_) {},
                            title: const Text('This is the 1.00 refrence'),
                          ).resize().adaptive(),
                          CheckboxListTile(
                            value: true,
                            onChanged: (_) {},
                            title: const Text('This is the 1.25 title'),
                          ).resize().adaptive(1.25),
                          CheckboxListTile(
                            value: true,
                            onChanged: (_) {},
                            title: const Text('This is the 1.50 title'),
                          ).resize().adaptive(1.5),
                          CheckboxListTile(
                            value: true,
                            onChanged: (_) {},
                            title: const Text('This is the 1.75 title'),
                          ).resize().adaptive(1.75),
                          CheckboxListTile(
                            value: true,
                            onChanged: (_) {},
                            title: const Text('This is the 2.00 title'),
                          ).resize().adaptive(2),
                          CheckboxListTile(
                            value: true,
                            onChanged: (_) {},
                            title: const Text('This is the 2.25 title'),
                          ).resize().adaptive(2.25),
                          CheckboxListTile(
                            value: true,
                            onChanged: (_) {},
                            title: const Text('This is the 2.50 title'),
                          ).resize().adaptive(2.5),
                          CheckboxListTile(
                            value: true,
                            onChanged: (_) {},
                            title: const Text('This is the 2.75 title'),
                          ).resize().adaptive(2.75),
                          CheckboxListTile(
                            value: true,
                            onChanged: (_) {},
                            title: const Text('This is the 3.00 title'),
                          ).resize().adaptive(3),
                        ],
                      ).resize().adaptive(),
                    ),
                  );
                }

                if (example == 4) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: SizedBox(
                        // width: 400,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const TextField(
                                decoration: InputDecoration(
                                  label: Text('This is a text Fliend'),
                                ),
                              ).resize().adaptive(0.25),
                              const TextField(
                                decoration: InputDecoration(
                                  label: Text('This is a text Fliend'),
                                ),
                              ).resize().adaptive(0.5),
                              const TextField(
                                decoration: InputDecoration(
                                  label: Text('This is a text Fliend'),
                                ),
                              ).resize().adaptive(0.75),
                              const TextField(
                                decoration: InputDecoration(
                                  label: Text('This is a text Fliend'),
                                ),
                              ),
                              const TextField(
                                decoration: InputDecoration(
                                  label: Text('This is a text Fliend'),
                                ),
                              ).resize().adaptive(1.25),
                              const TextField(
                                decoration: InputDecoration(
                                  label: Text('This is a text Fliend'),
                                ),
                              ).resize().adaptive(1.5),
                              const TextField(
                                decoration: InputDecoration(
                                  icon: Icon(Icons.abc),
                                  suffixIcon: Icon(Icons.ac_unit_sharp),
                                  label: Text('This is a text Fliend'),
                                ),
                              ).resize().adaptive(1.75),
                              const TextField(
                                decoration: InputDecoration(
                                  label: Text('This is a text Fliend'),
                                ),
                              ).resize().adaptive(2),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }

                if (example == 5) {
                  return SizedBox(
                    width: 600,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // const Expanded(child: Text('This is text 1')),
                        const Text('This is text 22'),
                        const Text('This is text 3'),
                        const Text('This is text 4'),
                        const Text('This is text 5'),
                      ],
                    ),
                  ).resize().adaptive();
                }

                return Column(
                  children: [
                    const Text('No example'),
                  ],
                );
              },
            ),
            // body: Text(
            //   'This is a text',
            //   style: TextStyle(fontSize: 48),
            // ).resize().adaptiveTest(),
            // body: Column(
            //   // mainAxisSize: MainAxisSize.min,
            //   children: [
            //     Text(
            //       'HI',
            //     ),
            //     // ListTile(
            //     //   title: Text('Title'),
            //     // )
            //   ],
            // ).colorize().resize().adaptiveTest(),
          );
        },
      ),
    );
  }
}

class FixedExample extends StatelessWidget {
  const FixedExample({super.key});

  @override
  Widget build(BuildContext context) {
    final example = 1;
    return Scaffold(
      body: Builder(builder: (context) {
        if (example == 1) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('This is me, and that is you'),
              const Text('This is me, and that is you')
                  .resize()
                  .fixed(width: 2),
              const Text('ljl'),
            ],
          );
        }
        return const Text('NO EXAMPLE');
      }),
    );
  }
}

class AdaptiveLayout extends StatelessWidget {
  AdaptiveLayout({super.key}) {
    InheritedLayout.scaleFactor = .1;
    ScaffoldInheritedLayout.query = [
      Query.constant(step: 600),
      Query.linear(step: 1000),
      Query.constant(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScaffoldInheritedLayout(
        builder: (context, size) {
          return Column(
            children: [
              Text('${MediaQuery.of(context).size}')
                  .resizeWithFlex()
                  .fromDevice
                  .width(width: .5),
              const Text('PARENT').resizeWithFlex().fromParent.width(width: .5),
              Text('$size').resizeWithFlex().fromEffectiveWidth(.5, null),
            ],
          );
        },
      ),
    );
  }
}

class FromParentWidth extends StatelessWidget {
  const FromParentWidth({super.key});

  @override
  Widget build(BuildContext context) {
    const example = 5;
    return Scaffold(
      body: Builder(
        builder: (context) {
          if (example == 0) {
            return Column(
              children: [
                const Text('lskdjf').resize().fixed(),
              ],
            );
          }
          if (example == 1) {
            return SizedBox(
              width: 200,
              height: 100,
              child: const Text('From device screen')
                  .resize(fitTheShortestSide: false)
                  .fromDevice
                  .width(width: .1, height: .1)
                  .colorize(),
            );
          }
          if (example == 2) {
            return SizedBox(
              width: 200,
              height: 100,
              child: const Text('From parent size')
                  .resize(fitTheShortestSide: false)
                  .fromParent
                  .width(width: 1, height: 1)
                  .colorize(),
            );
          }
          if (example == 3) {
            return const Text('This is  me From parent')
                .resize(fitTheShortestSide: true)
                .fromParent
                .width(
                  width: 1,
                  height: 1,
                )
                .colorize();
          }
          if (example == 4) {
            return SizedBox(
              // width: 500,
              // height: 100,
              child: Column(
                children: [
                  const Text('This  is  Normal    Text 1'),
                  const Flexible(child: Text('This is Normal Flex text')),
                  const Text('This is  me From parent')
                      .resize()
                      .fromParent
                      .width(),
                  Flexible(
                    child: const Text('This is  me From parent')
                        .resize()
                        .fromParent
                        .width(),
                  ),
                  Flexible(
                    flex: 10,
                    fit: FlexFit.tight,
                    child: const Text(
                      'This is  me From parent',
                      // style: TextStyle(f),
                    ).resize().fromParent.width(width: 0.1),
                  ),
                  const Text('This is  me From parent')
                      .resize()
                      .fromParent
                      .width(width: 0.2)
                      .colorize(),
                  const Text('This is  me From parent')
                      .resize()
                      .fromParent
                      .width(width: 0.3)
                      .colorize(),
                  const Text('This is  me From parent')
                      .resize()
                      .fromParent
                      .width(width: 0.4)
                      .colorize(),
                  const Text('This is  me From parent')
                      .resize()
                      .fromParent
                      .width(width: 0.5)
                      .colorize(),
                  const Text('This is  me From parent')
                      .resize()
                      .fromParent
                      .width(width: 0.6)
                      .colorize(),
                  const Text('This is  me From parent')
                      .resize()
                      .fromParent
                      .width(width: 0.7)
                      .colorize(),
                  const Text('This is  me From parent')
                      .resize()
                      .fromParent
                      .width(width: 0.8)
                      .colorize(),
                  const Text('This is  me From parent')
                      .resize()
                      .fromParent
                      .width(width: 0.9)
                      .colorize(),
                  const Text('This is  me From parent')
                      .resize()
                      .fromParent
                      .width(width: 1)
                      .colorize(),

                  // Text('This is  me From parent')
                  //     .resize()
                  //     .fromParent.width(height: 0.1),
                  // Flexible(
                  //   child: Text('This is  me From parent')
                  //       .resize()
                  //       .fromParent.width(height: 0.1),
                  // ),
                  // Flexible(
                  //   child: Text('This is  me From parent')
                  //       .resize()
                  //       .fromParent.width(height: 0.4),
                  // ),
                  // Flexible(
                  //   flex: 2,
                  //   child: Text('This is  me From parent')
                  //       .resize()
                  //       .fromParent.width(height: 0.4),
                  // ),
                ],
              ),
            );
          }

          if (example == 5) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                // width: 500,
                // height: 100,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Lable text',
                          border: OutlineInputBorder(),
                        ),
                      ).resize().fromParent.width(height: 0.04),
                      const SizedBox().resize().fromParent.width(height: .02),
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Lable text',
                          border: OutlineInputBorder(),
                        ),
                      ).resize().fromParent.width(height: 0.06),
                      const SizedBox().resize().fromParent.width(height: .02),
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Lable text',
                          border: OutlineInputBorder(),
                        ),
                      ).resize().fromParent.width(height: 0.08),
                      const SizedBox().resize().fromParent.width(height: .02),
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Lable text',
                          border: OutlineInputBorder(),
                        ),
                      ).resize().fromParent.width(height: 0.1),
                      const SizedBox().resize().fromParent.width(height: .02),
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Lable text',
                          border: OutlineInputBorder(),
                        ),
                      ).resize().fromParent.width(height: 0.12),
                      const SizedBox().resize().fromParent.width(height: .02),
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Lable text',
                          border: OutlineInputBorder(),
                        ),
                      ).resize().fromParent.width(height: 0.14),
                      const SizedBox().resize().fromParent.width(height: .02),
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Lable text',
                          border: OutlineInputBorder(),
                        ),
                      ).resize().fromParent.width(height: 0.16),
                      const SizedBox().resize().fromParent.width(height: .02),
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Lable text',
                          border: OutlineInputBorder(),
                        ),
                      ).resize().fromParent.width(height: 0.18),
                    ],
                  ),
                ),
              ),
            );
          }
          return const Text('NO example');
        },
      ),
    );
  }
}

class FromDeviceWidthExample extends StatelessWidget {
  const FromDeviceWidthExample({super.key});
  @override
  Widget build(BuildContext context) {
    const example = 1;
    return Scaffold(
      body: Builder(builder: (context) {
        if (example == 1) {
          return Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Center(
                    child: const SizedBox(
                      width: 100,
                      height: 110,
                      child: Text('From W and H'),
                    )
                        .colorize()
                        .resize()
                        .fromDevice
                        .widthAndHeight(width: 0.2, height: 0.2)
                        .colorize(Colors.amber.withOpacity(0.5)),
                  ),
                  Center(
                    child: const SizedBox(
                      width: 100,
                      height: 110,
                      child: Text('From W'),
                    )
                        .colorize()
                        .resize()
                        .fromDevice
                        .width(width: 0.2, height: 0.2)
                        .colorize(Colors.amber.withOpacity(0.5)),
                  ),
                ],
              ),
              Center(
                child: const SizedBox(
                  width: 120,
                  height: 110,
                  child: Text('From H'),
                )
                    .colorize()
                    .resize(fitTheShortestSide: true)
                    .fromDevice
                    .height(height: 0.2)
                    .colorize(Colors.amber.withOpacity(0.5)),
              ),
            ],
          );
        }
        return Column(
          children: [
            // SizedBox(
            //   width: 1,
            //   height: 1,
            // ).colorize().resize().fromDevice.width(),
            // SizedBox(
            //   width: 1,
            //   height: 1,
            // ).colorize().resize().fromDevice.width(widthFraction: 0.2),
            // SizedBox(height: 8),
            // SizedBox(
            //   width: 1,
            //   height: 2,
            // )
            //     .colorize()
            //     .resize()
            //     .fromDevice.width(widthFraction: .2, heightFraction: 0.4),
            // SizedBox(height: 8),
            const SizedBox(
              width: 2,
              height: 1,
            )
                .colorize()
                .resize()
                .fromDevice
                .height(width: .4, height: 0.2)
                .colorize(),

            // SizedBox(
            //   width: 1,
            //   height: 2,
            // )
            //     .colorize()
            //     .resize()
            //     .fromDevice.widthAndHeight(widthFraction: .2, heightFraction: 0.4),
          ],
        );
      }),
    );
  }
}

class Example1 extends StatelessWidget {
  const Example1({super.key});

  @override
  Widget build(BuildContext context) {
    const example = 3;
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        // WITH COLUMN
        body: Builder(builder: (context) {
          if (example == 0) {
            return Column(
              children: [
                const Text('This is you').resize().fixed(width: 50, height: 10),
                const SizedBox(
                  height: 50,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Text(
                      'This is FITTED',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ).colorize(Colors.amber),
                const Text(
                  'This is you',
                  overflow: TextOverflow.ellipsis,
                ).resize().fixed(height: 50),
                const Text(
                  'This is you',
                  overflow: TextOverflow.ellipsis,
                ).resize(fitTheShortestSide: true).fixed(height: 50).colorize(),
                const Text(
                  'This is you',
                  overflow: TextOverflow.ellipsis,
                ).resize().fixed(height: 50, width: 2000),
                const Text(
                  'This is you',
                  overflow: TextOverflow.ellipsis,
                )
                    .resize(fitTheShortestSide: true)
                    .fixed(height: 50, width: 2000)
                    .colorize(),
                const Center(child: Text('This is Center'))
                    .resize()
                    .fixed(height: 50),
              ],
            );
          }
          if (example == 1) {
            return Column(
              children: [
                const SizedBox(
                  width: 500,
                  height: 100,
                  child: FittedBox(
                    child: Text('This is FITTED'),
                  ),
                ).colorize(Colors.amber),
                const Text('This is RESIZ')
                    .resize()
                    .fixed(width: 500, height: 100)
                    .colorize(),
                const Text('This is RESIZ')
                    .resize(fitTheShortestSide: true)
                    .fixed(width: 500, height: 100)
                    .colorize(),
                const SizedBox(height: 20),
                const SizedBox(
                  width: 50,
                  height: 10,
                  child: FittedBox(
                    child: Text('This is you'),
                  ),
                ).colorize(Colors.amber),
                const Text('This is you')
                    .resize()
                    .fixed(width: 50, height: 10)
                    .colorize(),
              ],
            );
          }
          if (example == 2) {
            return SizedBox(
              width: 200,
              height: 100,
              child: const Text('This is you')
                  .colorize()
                  .resize()
                  .fixed(width: 300, height: double.infinity),
            );
          }
          if (example == 3) {
            // try resize the window
            return SingleChildScrollView(
              child: Column(
                children: [
                  ListTile(
                    title: const Text(
                      'This is me',
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: const Text(
                      'Yes, this is Normal tile',
                      // overflow: TextOverflow.ellipsis,
                    ),
                    leading: const Text('L'),
                    trailing: Material(
                      child: InkWell(
                        onTap: () {},
                        child: const Text('T'),
                      ),
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      'This is me',
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: const Text(
                      'Yes, this is biggest',
                      overflow: TextOverflow.ellipsis,
                    ),
                    leading: const Text('L'),
                    trailing: Material(
                      child: InkWell(
                        onTap: () {},
                        child: const Text('T'),
                      ),
                    ),
                  )
                      .colorize() //
                      .resize(fitTheShortestSide: true)
                      .fixed(height: 206)
                      .colorize(Colors.amber),
                  const Text('GGGGGG'),
                  ListTile(
                    title: const Text(
                      'This is me',
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: const Text('Yes, this is Smaller'),
                    leading: const Text('L'),
                    trailing: Material(
                      child: InkWell(
                        onTap: () {},
                        child: const Text('T'),
                      ),
                    ),
                  )
                      .colorize() //
                      .resize()
                      .fixed(height: 60),
                  const Text('GGGGGG'),
                  ListTile(
                    title: const Text(
                      'This is me',
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: const Text('Yes, this is Smallest'),
                    leading: const Text('L'),
                    trailing: Material(
                      child: InkWell(
                        onTap: () {},
                        child: const Text('T'),
                      ),
                    ),
                  )
                      .colorize() //
                      .resize()
                      .fixed(height: 30),
                ],
              ),
            );
          }

          if (example == 4) {
            return Column(
              children: [
                Center(
                    child: TextButton.icon(
                  // style: TextButton.styleFr,
                  onPressed: () {},
                  icon: const Icon(Icons.favorite),
                  label: const Text('Respect A R '),
                )
                        .colorize(Colors.amber) //
                        .resize(fitTheShortestSide: true)
                        .fixed(height: 70, width: 300)
                    // .background(clipBehavior: Clip.antiAlias)
                    // .buildCapsule(),
                    ),
                const Text('HHHHHHH'),
                Center(
                    child: TextButton.icon(
                  // style: TextButton.styleFr,
                  onPressed: () {},
                  icon: const Icon(Icons.favorite),
                  label: const Text('NO Respect  '),
                )
                        .colorize(Colors.amber) //
                        .resize()
                        .fixed(height: 70, width: 300)
                    // .background(clipBehavior: Clip.antiAlias)
                    // .buildCapsule(),
                    ),
                const Text('HHHHHHH'),
                Center(
                    child: TextButton.icon(
                  // style: TextButton.styleFr,
                  onPressed: () {},
                  icon: const Icon(Icons.favorite),
                  label: const Text('Respect A R '),
                )
                        .colorize(Colors.amber) //
                        .resize()
                        .fixed(height: 70)
                    // .background(clipBehavior: Clip.antiAlias)
                    // .buildCapsule(),
                    ),
                const Text('HHHHHHH'),
                Center(
                    child: TextButton.icon(
                  // style: TextButton.styleFr,
                  onPressed: () {},
                  icon: const Icon(Icons.favorite),
                  label: const Text('NO Respect  '),
                )
                        .colorize(Colors.amber) //
                        .resize()
                        .fixed(height: 70)
                    // .background(clipBehavior: Clip.antiAlias)
                    // .buildCapsule(),
                    ),
                const Text('HHHHHHH'),
                Center(
                    child: TextButton.icon(
                  // style: TextButton.styleFr,
                  onPressed: () {},
                  icon: const Icon(Icons.favorite),
                  label: const Text('Respect A R '),
                )
                        .colorize(Colors.amber) //
                        .resize()
                        .fixed(width: 370)
                    // .background(clipBehavior: Clip.antiAlias)
                    // .buildCapsule(),
                    ),
                const Text('HHHHHHH'),
                Center(
                    child: TextButton.icon(
                  // style: TextButton.styleFr,
                  onPressed: () {},
                  icon: const Icon(Icons.favorite),
                  label: const Text('NO Respect A R '),
                )
                        .colorize(Colors.amber) //
                        .resize()
                        .fixed(width: 370)
                    // .background(clipBehavior: Clip.antiAlias)
                    // .buildCapsule(),
                    ),
                const Text('HHHHHHH'),
                // Center(
                //   child: TextButton.icon(
                //     // style: TextButton.styleFr,
                //     onPressed: () {},
                //     icon: const Icon(Icons.favorite),
                //     label: const Text('KAOUTHAR '),
                //   )
                //       .colorize(Colors.amber) //
                //       .resize()
                //       .fixed(width: 400)
                //       .background(clipBehavior: Clip.antiAlias)
                //       .buildCapsule(),
                // ),
                // Center(
                //     child: TextButton.icon(
                //   // style: TextButton.styleFr,
                //   onPressed: () {},
                //   icon: const Icon(Icons.favorite),
                //   label: const Text('KAOUTHAR '),
                // )
                //         .colorize(Colors.transparent) //
                //         .resize()
                //         .fixed(width: 50)
                //     // .background(
                //     //     color: Colors.transparent,
                //     //     clipBehavior: Clip.antiAlias)
                //     // .buildCapsule(),
                //     )
              ],
            );
          }

          return Column(
            children: [
              const Text('normal'),
              const Text('fixed()').resize().fixed(),
              const Text('fixed(width: 40)')
                  .colorize()
                  .resize()
                  .fixed(width: 60),
              const Text('ixed(width: 140)')
                  .colorize()
                  .resize()
                  .fixed(width: 140),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text('Inside Row'),
                  const Text('fixed(height: 10)')
                      .colorize()
                      .resize()
                      .fixed(height: 10),
                  const Text('fixed(height: 70')
                      .colorize()
                      .resize()
                      .fixed(height: 70),
                  const SizedBox(
                          // width: double.infinity,

                          // height: 50,
                          )
                      .resize()
                      .fixed(),
                ],
              ),
              const Text('This is Him')
                  .colorize()
                  .resize()
                  .fixed(width: 40, height: 10),
              const SizedBox().colorize().resize().fixed(),
            ],
          );
        }),
      ),
    );
  }
}

class TextFliedExample extends StatelessWidget {
  const TextFliedExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const TextField(),
            const TextField().resize().fixed(height: 60),
            const TextField().resize().fixed(height: 160),
          ],
        ).resize().fixed(width: 600, height: double.infinity),
      ),
    );
  }
}

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);
  static const routeName = '/welcome-page';

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    InheritedLayout.scaleFactor = 2;
    ScaffoldInheritedLayout.query = [
      Query.constant(step: 600),
      Query.linear(step: 1000),
      Query.constant(),
    ];
    return Material(
      child:
          // Image.asset(
          //   'assets/welcome_image_bg.jpg',
          //   fit: BoxFit.cover,
          // )

          const SizedBox().foreground(color: Colors.blue.shade200).build(
                const _Foreground(),
              ),
    );
  }
}

class _Foreground extends StatelessWidget {
  const _Foreground({super.key});
  final factor = 20;
  @override
  Widget build(BuildContext context) {
    return ScaffoldInheritedLayout(builder: (context, size) {
      return Column(
        children: [
          const FlexSpacer() * factor,
          const Text(
            'بِسْمِ اللَّـهِ الرَّحْمَـٰنِ الرَّحِيمِ ',
            textAlign: TextAlign.center,
          ).resize().fromEffectiveWidth(null, .05),
          const FlexSpacer() * factor * 4,
          const Text(
            'إِنَّهُ لَقُرْآنٌ كَرِيمٌ',
          ).resize().fromEffectiveWidth(null, .1),
          const FlexSpacer() * factor * 4,
          const Text(
            'اللهم اجعلنا من أهل القرآن حفظاً وعلماً وعملاً',
            textAlign: TextAlign.center,
          ).resize().fromEffectiveWidth(null, .05),
          const FlexSpacer.expand() * factor,

          // Spacer(),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // navigator.toReplacement('/');
              },

              // child: Text('lksdjf'),
              child: const Text(
                'إبدأ',
              )
                  .background(color: Colors.transparent)
                  .buildRect(width: double.infinity),
            ).resize(fitTheShortestSide: true).fromEffectiveWidth(null, .1),
          )
        ],
      );
    });
  }
}
