import 'package:flutter/material.dart';
import 'package:river_cruises_dribble/constants/colors.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Expanded(
          //         child: Container(
          //       margin: const EdgeInsets.symmetric(horizontal: 8),
          //       padding: const EdgeInsets.all(3),
          //       alignment: Alignment.center,
          //       decoration: BoxDecoration(
          //           border: Border.all(color: AppColors.black, width: 1),
          //           borderRadius: BorderRadius.circular(6)),
          //       width: 500,
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Icon(
          //             Icons.favorite,
          //             color: AppColors.primary,
          //           ),
          //           const Text(
          //             "Favorites",
          //             style:
          //                 TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          //           ),
          //         ],
          //       ),
          //     )),
          //   ],
          // ),
          SizedBox(
            height: 100,
          ),
          Text("Nothing added yet!", style: TextStyle(fontSize: 16),),
          SizedBox(
            height: 150,
          ),
        ],
      ),
    );
  }
}
