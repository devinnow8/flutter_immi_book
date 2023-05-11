import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theimmibook/utils/consts.dart';

class Jobs extends StatefulWidget {
  const Jobs({super.key});

  @override
  State<Jobs> createState() => _JobsState();
}

class _JobsState extends State<Jobs> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (buildContext, constraints) {
        bool isMobile = constraints.maxWidth <= mobileWidth;
        bool mediumLargeScreen = false;
        bool smallLargeScreen = false;
        if (constraints.maxWidth <= 1360) {
          smallLargeScreen = true;
        } else if (constraints.maxWidth <= 1700) {
          mediumLargeScreen = true;
        }

        print(constraints.maxWidth);
        return Column(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                  maxWidth: smallLargeScreen
                      ? desktopSubSectionWidth * 0.75
                      : desktopSubSectionWidth),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'jobsTitle'.tr,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: 60),
                  ),
                  const CircleAvatar(
                    radius: 35,
                    backgroundColor: accentColor,
                    child: Icon(
                      Icons.add,
                      size: 40,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                  maxWidth: smallLargeScreen
                      ? designScreenWidth
                      : constraints.maxWidth - 80),
              child: Container(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(
                        maxWidth: mediumLargeScreen
                            ? desktopSubSectionWidth * .75
                            : (smallLargeScreen
                                ? constraints.maxWidth * 0.7
                                : desktopSubSectionWidth)),
                    child: Wrap(
                      spacing: 30,
                      runSpacing: 30,
                      children: [...jobCardsData.map((e) => jobCard())],
                    ),
                  ),
                ]),
              ),
            )
          ],
        );
      },
    );
  }
}

Widget jobCard() {
  String title = jobCardsData[0]['title'];
  String subTitle = jobCardsData[0]['subTitle'];
  String description = jobCardsData[0]['description'];
  String imageUrl = jobCardsData[0]['imageUrl'];
  return LayoutBuilder(
    builder: (buildContext, constraints) =>
        StatefulBuilder(builder: (context, setState) {
      print('----->>>>' + constraints.maxWidth.toString());
      return ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 350),
          width: constraints.maxWidth < 980 && constraints.maxWidth > 630
              ? 300
              : 629,
          height: constraints.maxWidth < 980 && constraints.maxWidth > 630
              ? 629
              : 300,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 19, 19, 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Flex(
            direction: constraints.maxWidth < 980 && constraints.maxWidth > 630
                ? Axis.vertical
                : Axis.horizontal,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Image.network(
                  imageUrl,
                  height:
                      constraints.maxWidth < 980 && constraints.maxWidth > 630
                          ? 319
                          : double.maxFinite,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Expanded(
                  child: Container(
                width: constraints.maxWidth < 980 && constraints.maxWidth > 630
                    ? double.maxFinite
                    : 319,
                padding:
                    const EdgeInsets.symmetric(horizontal: 37, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontSize: 25),
                    ),
                    Text(subTitle,
                        style:
                            const TextStyle(fontSize: 20, color: accentColor)),
                    Text(description, style: const TextStyle(fontSize: 16))
                  ],
                ),
              ))
            ],
          ),
        ),
      );
    }),
  );
}

List jobCardsData = [
  {
    'title': 'Your personal guide in new country',
    'subTitle': 'Feel free to explorer',
    'description':
        'It is a long established fact that a reader will be distracted by the readable content.',
    'imageUrl':
        'https://i.insider.com/5f5f9dbbe6ff30001d4e8a39?width=1000&format=jpeg&auto=webp'
  },
  {
    'title': 'Your personal guide in new country',
    'subTitle': 'Feel free to explorer',
    'description':
        'It is a long established fact that a reader will be distracted by the readable content.',
    'imageUrl':
        'https://i.insider.com/5f5f9dbbe6ff30001d4e8a39?width=1000&format=jpeg&auto=webp'
  },
  {
    'title': 'Your personal guide in new country',
    'subTitle': 'Feel free to explorer',
    'description':
        'It is a long established fact that a reader will be distracted by the readable content.',
    'imageUrl':
        'https://i.insider.com/5f5f9dbbe6ff30001d4e8a39?width=1000&format=jpeg&auto=webp'
  },
  {
    'title': 'Your personal guide in new country',
    'subTitle': 'Feel free to explorer',
    'description':
        'It is a long established fact that a reader will be distracted by the readable content.',
    'imageUrl':
        'https://i.insider.com/5f5f9dbbe6ff30001d4e8a39?width=1000&format=jpeg&auto=webp'
  }
];
