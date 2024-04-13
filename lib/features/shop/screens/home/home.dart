import 'package:ecom/common/widget/custom_shapes/circular_container.dart';
import 'package:ecom/common/widget/custom_shapes/curved_edges.dart';
import 'package:ecom/utils/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TCurvedEdgesWidget()
          ],
        ),
      ),
    );
  }
}

class TCurvedEdgesWidget extends StatelessWidget {
  const TCurvedEdgesWidget({
    super.key, this.child,
  });

  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TCustomCurvedEdges() ,
      child: Container(
        color: TColors.primary,
        padding: EdgeInsets.all(0),
        child: SizedBox(
          height: 400,
          child: Stack(
            children: [
              Positioned(top:-150 ,right: -250,child: TCircularContainer(backgroundColor: TColors.textWhite.withOpacity(0.1))),
              Positioned(top:100 ,right: -300,child: TCircularContainer(backgroundColor: TColors.textWhite.withOpacity(0.1))),
            ],
          ),
        ),
      ),
    );
  }
}


