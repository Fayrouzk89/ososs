import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/widgets.dart';
import 'home_controller.dart';

class HomeView extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());
  TextEditingController usernameController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: Get.theme.backgroundColor,
      appBar: AppBar(
        title: Text('home'.tr),
      ),
      body:
      Column(
        children: [
          Expanded(
              child: MainPart(
            usernameController: usernameController,
          )),
          SizedBox(width: MediaQuery.of(context).size.width, child: yourBottomBar())
        ],
      ),
    );
  }

  Widget yourBottomBar() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Column(
        children: [
          shadowButton('go_to_page1'.tr, submitPage1, Colors.blue),
          const SizedBox(
            height: 20,
          ),
          shadowButton('go_to_page2'.tr, submitPage2, Colors.lightBlueAccent)
        ],
      ),
    );
  }

  submitPage1() {
    homeController!.openPageAnimation(usernameController.text ?? "");
  }

  submitPage2() {
    homeController.openPagePokemons();
  }
}

class MainPart extends StatefulWidget {
  final TextEditingController usernameController;

  const MainPart({Key? key, required this.usernameController})
      : super(key: key);

  @override
  _MainPartState createState() {
    return _MainPartState();
  }
}

class _MainPartState extends State<MainPart> {
  String nameTxt = 'your_name'.tr;

  @override
  void initState() {
    super.initState();
    initListener();
  }

  initListener() {
    widget.usernameController.addListener(() {
      if (widget.usernameController.text == null ||
          widget.usernameController.text == "") {
        nameTxt = 'your_name'.tr;
      } else {
        nameTxt = widget.usernameController.text.toString();
      }
      setState(() {});
    });
  }

  clearText() {
    widget.usernameController.text = "";
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    //widget.usernameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        editTextStyle("enter_name".tr, widget.usernameController,
            isPassword: false),
        const SizedBox(
          height: 40,
        ),
        text(nameTxt, textColor: Colors.black87),
        Expanded(
          child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: GestureDetector(
                onTap: (){
                  clearText();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.delete_forever,
                      color: Colors.red,
                    ),
                    text('clear_text'.tr, textColor: Colors.red),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
