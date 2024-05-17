import 'package:flutter/material.dart';
import 'package:river_cruises_dribble/constants/images.dart';

import '../../constants/colors.dart';
import 'custom_search_delegate.dart';
import 'custom_tab.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody>
    with SingleTickerProviderStateMixin {
  int selectedCategIndex = 0;

  List<String> categories = ['All areas', 'Weekend', 'Family', 'Dance'];

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    _animation = Tween<double>(begin: 0, end: 400).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final TextEditingController _fromWhereController = TextEditingController();
  final TextEditingController _anyWhereController = TextEditingController();
  final TextEditingController _anyWeekController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        _anyWeekController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Let's enjoy",
          style: TextStyle(
            color: AppColors.black,
            fontSize: 24,
          ),
        ),
        Text(
          'River Cruises',
          style: TextStyle(
              color: AppColors.black,
              fontSize: 40,
              fontWeight: FontWeight.bold,
              letterSpacing: 2),
        ),
        const SizedBox(height: 20),
        // Container(
        //   margin: const EdgeInsets.symmetric(horizontal: 20),
        //   // padding: const EdgeInsets.symmetric(vertical: 5),
        //   decoration: BoxDecoration(
        //     color: AppColors.greyShade200,
        //     borderRadius: BorderRadius.circular(30),
        //   ),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       ElevatedButton(
        //           onPressed: () {},
        //           style: ButtonStyle(
        //               backgroundColor:
        //                   WidgetStateProperty.all(AppColors.primary),
        //               shape: WidgetStateProperty.all(const StadiumBorder()),
        //               padding: WidgetStateProperty.all(
        //                   const EdgeInsets.symmetric(horizontal: 60))),
        //           child: Text(
        //             '≈ Cruises',
        //             style: TextStyle(color: AppColors.white),
        //           )),
        //       ElevatedButton(
        //           onPressed: () {},
        //           style: ButtonStyle(
        //               backgroundColor:
        //                   WidgetStateProperty.all(AppColors.greyShade200),
        //               shape: WidgetStateProperty.all(const StadiumBorder()),
        //               foregroundColor: WidgetStateProperty.all(AppColors.black),
        //               padding: WidgetStateProperty.all(
        //                   const EdgeInsets.symmetric(horizontal: 60)),
        //               elevation: WidgetStateProperty.all(0)),
        //           child: const Text('Ships')),
        //     ],
        //   ),
        // ),
        const CustomTab(tabs: ['≈ Cruises', 'Ships']),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Container(
              //   color: AppColors.greyShade200,
              //   child: TextField(
              //     decoration: InputDecoration(
              //       labelText: 'From where',
              //       prefixIcon: Icon(
              //         Icons.sailing,
              //         color: AppColors.black45,
              //       ),
              //       border: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(15),
              //           borderSide: BorderSide.none),
              //     ),
              //   ),
              // ),
              GestureDetector(
                onTap: () async {
                  final result = await showSearch<String>(
                    context: context,
                    delegate: CustomSearchDelegate(),
                  );
                  if (result != null) {
                    setState(() {
                      _fromWhereController.text = result;
                    });
                  }
                },
                child: AbsorbPointer(
                  child: Container(
                    color: AppColors.greyShade200,
                    child: TextField(
                      controller: _fromWhereController,
                      decoration: InputDecoration(
                        labelText: 'From where',
                        prefixIcon: Icon(
                          Icons.sailing,
                          color: AppColors.black45,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Container(
              //   color: AppColors.greyShade200,
              //   child: TextField(
              //     decoration: InputDecoration(
              //       labelText: 'Anywhere',
              //       prefixIcon: Icon(
              //         Icons.map,
              //         color: AppColors.black45,
              //       ),
              //       border: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(10),
              //           borderSide: BorderSide.none),
              //     ),
              //   ),
              // ),
              GestureDetector(
                onTap: () async {
                  final result = await showSearch<String>(
                    context: context,
                    delegate: CustomSearchDelegate(),
                  );
                  if (result != null) {
                    setState(() {
                      _anyWhereController.text = result;
                    });
                  }
                },
                child: AbsorbPointer(
                  child: Container(
                    color: AppColors.greyShade200,
                    child: TextField(
                      controller: _anyWhereController,
                      decoration: InputDecoration(
                        labelText: 'Anywhere',
                        prefixIcon: Icon(
                          Icons.map,
                          color: AppColors.black45,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () => _selectDate(context),
                child: AbsorbPointer(
                  child: Container(
                    color: AppColors.greyShade200,
                    child: TextField(
                      controller: _anyWeekController,
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                        labelText: 'Any week',
                        prefixIcon: Icon(
                          Icons.date_range,
                          color: AppColors.black45,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Container(
              //   color: AppColors.greyShade200,
              //   child: TextField(
              //     keyboardType: TextInputType.datetime,
              //     decoration: InputDecoration(
              //       labelText: 'Any week',
              //       prefixIcon: Icon(
              //         Icons.date_range,
              //         color: AppColors.black45,
              //       ),
              //       border: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(10),
              //           borderSide: BorderSide.none),
              //     ),
              //   ),
              // ),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    if (_controller.value >= 1) {
                      _controller.reset();
                    } else {
                      _controller.forward();
                    }
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all(AppColors.primary),
                      shape: WidgetStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                      padding: WidgetStateProperty.all(
                          const EdgeInsets.symmetric(vertical: 12))),
                  child: Stack(
                    children: [
                      if (_controller.value > 0)
                        Positioned(
                          top: -6,
                          left: 5 + _animation.value,
                          child: Image.asset(
                            AppImages.boat2,
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                          ),
                        ),
                      AnimatedBuilder(
                        animation: _controller,
                        builder: (context, child) {
                          double opacity =
                              _controller.value > 0.4 && _controller.value < 0.6
                                  ? 0.3
                                  : 1.0;
                          return Center(
                            child: Opacity(
                              opacity: opacity,
                              child: Text(
                                'Search',
                                style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  )),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(Icons.map, color: AppColors.primary),
                        const SizedBox(width: 5),
                        Text('Map',
                            style: TextStyle(
                                color: AppColors.primary,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.primary)),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.filter_list,
                          color: AppColors.primary,
                        ),
                        const SizedBox(width: 5),
                        Text('Advanced search',
                            style: TextStyle(
                                color: AppColors.primary,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.primary)),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Popular tours',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () => setState(() => selectedCategIndex = index),
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.resolveWith<Color>((states) {
                      if (selectedCategIndex == index) {
                        return AppColors.primary;
                      } else {
                        return AppColors.white;
                      }
                    }),
                    side: WidgetStateProperty.resolveWith<BorderSide>((states) {
                      if (selectedCategIndex != index) {
                        return BorderSide(color: AppColors.primary);
                      } else {
                        return BorderSide(
                            color: Theme.of(context).colorScheme.secondary);
                      }
                    }),
                  ),
                  child: Text(
                    categories[index],
                    style: TextStyle(
                      color: selectedCategIndex == index
                          ? AppColors.white
                          : AppColors.primary,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
