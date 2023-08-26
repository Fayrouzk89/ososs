import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/shape.dart';
import '../../utils/colors.dart';
import '../../utils/widgets.dart';

class AnimationView extends StatefulWidget {
  const AnimationView({Key? key}) : super(key: key);

  @override
  _AnimationViewState createState() {
    return _AnimationViewState();
  }
}

class _AnimationViewState extends State<AnimationView>
    with SingleTickerProviderStateMixin {
  Shape shape = Shape('square', squareShape(colorSquare), colorSquare, 5);
  List<Shape> shapes = [ Shape('square', squareShape(colorSquare), colorSquare, 0),
    Shape('rounded square', roundedSquare(colorRoundedSquare),
        colorRoundedSquare, 25),
    Shape('circle', circleShape(colorCircle), colorCircle, 200)
  ];

  String nameTxt = "";

  @override
  void initState() {
    super.initState();
    dynamic argumentData = Get.arguments;
    if (argumentData != null && argumentData.length > 0) {
      nameTxt = argumentData[0];
    }

    WidgetsBinding.instance.addPostFrameCallback((_) async {

      startAnimation();
    });


  }

  double height = 0;
  double width = 0;
  final double roundedValue = 20;

  void startAnimation() {
    setState(() {
      height = MediaQuery.of(context).size.height / 2;
      width = MediaQuery.of(context).size.width;

    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Get.theme.backgroundColor,
        appBar: AppBar(
          title: Text('animations'.tr),
        ),
        body: Padding(
          padding:
               EdgeInsets.only(left: MediaQuery.of(context).size.width*0.08, right: MediaQuery.of(context).size.width*0.08, top: 10, bottom: 10),
          child: ListView(
            children: [
              text(nameTxt, textColor: Colors.black87),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                child: singleShape(),
                 height: 350,
               // height: MediaQuery.of(context).size.height-120,
                width: MediaQuery.of(context).size.width,
                //height: MediaQuery.of(context).size.height / 2,
              )
            ],
          ),
        ),
        bottomSheet: SizedBox(height: 100, child: listShapes()));
  }

  Widget listShapes() {
    return ListView(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      children: shapes.map((shape) {
        return GestureDetector(
          onTap: () {
            updateChild(shape);
          },
          child: Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width / (shapes.length),
              // alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 30, right: 30, top: 20, bottom: 20),
                child: shape.widget,
              )),
        );
      }).toList(),
    );
  }

  updateChild(Shape childShape) {
    shape = childShape;
    setState(() {});
  }

  Widget singleShape() {
    return AnimatedContainer(
      curve: Curves.linear,
      duration: const Duration(milliseconds: 500),
      height: height,
      width: width,
      decoration: ShapeDecoration(
        color: shape.color,
        shape:
        (shape.name=="circle")?
        CircleBorder():
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(shape.raduis),
        ),
      ),
    );
  }
}
