import 'package:flutter/material.dart';
import 'package:river_cruises_dribble/constants/colors.dart';

import '../constants/images.dart';
import 'widgets/custom_background.dart';
import 'widgets/parallax_layer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.75,
            flexibleSpace: FlexibleSpaceBar(
              // title: const Text('Parallax Scrolling', style: TextStyle(color: Colors.black),),
              background: CustomBackground(),
              
            ),
            // backgroundColor: AppColors.primary,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ParallaxLayer(
                  imageAsset: AppImages.boat, 
                  imageWidth: 70,
                  imageHeight: 200,
                  scrollController: _scrollController,
                  scrollSpeed: 0.5,
                );
              },
              childCount: 5, // Number of parallax layers
            ),
          ),
          
          
        ],
      ),
    );
  }
}