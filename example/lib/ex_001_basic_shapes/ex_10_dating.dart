import 'package:flutter/material.dart';
import 'package:shape_builder/shape_builder.dart';

void main(List<String> args) {
  runApp(const _MyApp());
}

class _MyHomePage extends StatelessWidget {
  const _MyHomePage();

  @override
  Widget build(BuildContext context) {
    final User user = fakeUser;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            RRectangle(
              height: MediaQuery.of(context).size.height / 1.4,
              width: MediaQuery.of(context).size.width,
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              color: ColorWithGradient(
                const LinearGradient(
                  colors: [
                    Color.fromARGB(200, 0, 0, 0),
                    Color.fromARGB(0, 0, 0, 0)
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(.5),
                  spreadRadius: 4,
                  blurRadius: 4,
                  offset: const Offset(3, 3),
                )
              ],
              clipBehavior: Clip.antiAlias,
              childIsInTheForeground: false,
              child: Image.network(
                user.imageUrls[0],
                fit: BoxFit.cover,
              ),
            )
                .foreground(
                  alignment: const Alignment(-.7, .8),
                )
                .build(
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${user.name}, ${user.age}',
                        style: Theme.of(context)
                            .textTheme
                            .headline3!
                            .copyWith(color: Colors.white),
                      ),
                      Text(
                        user.jobTitle,
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: Colors.white, fontWeight: FontWeight.normal),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 70,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: user.imageUrls.length + 1,
                          itemBuilder: (builder, index) {
                            return (index < user.imageUrls.length)
                                ? Image.network(
                                    user.imageUrls[index],
                                  )
                                    .background(
                                      boxShadow: BoxShadowWithElevation(
                                        2,
                                        color: Colors.white60,
                                      ),
                                    )
                                    .buildRRect()
                                    .paddingInsets
                                    .right()
                                : Icon(
                                    Icons.info_outline,
                                    size: 25,
                                    color: Theme.of(context).primaryColor,
                                  )
                                    .background(color: Colors.white)
                                    .buildCircle(radius: 30);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const ChoiceButton(
                  color: Color(0xFFE84545),
                  icon: Icons.clear_rounded,
                ),
                const ChoiceButton(
                  width: 80,
                  height: 80,
                  size: 30,
                  color: Colors.white,
                  hasGradient: true,
                  icon: Icons.favorite,
                ).paddingInsets.horizontal(),
                const ChoiceButton(
                  color: Color(0xFF2B2E4A),
                  icon: Icons.watch_later,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ChoiceButton extends StatelessWidget {
  final double width;
  final double height;
  final double size;
  final bool hasGradient;
  final Color? color;
  final IconData icon;

  const ChoiceButton({
    Key? key,
    this.width = 60,
    this.height = 60,
    this.size = 25,
    this.hasGradient = false,
    required this.color,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: size,
      color: color,
    )
        .background(
          color: hasGradient
              ? ColorWithGradient(
                  const LinearGradient(
                    colors: [
                      Color(0xFF2B2E4A),
                      Color(0xFFE84545),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                )
              : Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 4,
              blurRadius: 4,
              offset: const Offset(3, 3),
            ),
          ],
          clipBehavior: Clip.antiAlias,
        )
        .inkWell(
          InkWell(
            onTap: () {
              print('ontap');
            },
            onDoubleTap: () {
              print('doubletap');
            },
          ),
        )
        .buildOval(
          width: width,
          height: height,
        );
  }
}

class _MyApp extends StatelessWidget {
  const _MyApp();

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: _MyHomePage(),
    );
  }
}

class User {
  final String? id;
  final String name;
  final int age;
  final String gender;
  final List<dynamic> imageUrls;
  final List<dynamic> interests;
  final String bio;
  final String jobTitle;
  final String location;
  User({
    this.id,
    required this.name,
    required this.age,
    required this.gender,
    required this.imageUrls,
    required this.interests,
    required this.bio,
    required this.jobTitle,
    required this.location,
  });
}

final fakeUser = User(
  id: '1',
  name: 'John',
  age: 25,
  gender: 'Male',
  imageUrls: [
    'https://images.unsplash.com/photo-1595623238469-fc58b3839cf6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=755&q=80',
    'https://images.unsplash.com/photo-1595623238469-fc58b3839cf6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=755&q=80',
    'https://images.unsplash.com/photo-1595623238469-fc58b3839cf6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=755&q=80',
    'https://images.unsplash.com/photo-1595623238469-fc58b3839cf6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=755&q=80',
    'https://images.unsplash.com/photo-1595623238469-fc58b3839cf6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=755&q=80',
  ],
  jobTitle: 'Job Title Here',
  interests: ['Music', 'Economics', 'Football'],
  bio:
      'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
  location: 'Milan',
);
