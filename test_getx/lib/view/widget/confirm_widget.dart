import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ConfirmWidget extends StatelessWidget {
  VoidCallback onButtonPressed;

  String title;
  String subTitle;
  String buttonText;
  bool visible;

  ConfirmWidget({
    @required this.onButtonPressed,
    @required this.title,
    @required this.buttonText,
    @required this.visible,
    this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Stack(
        children: [
          Container(
            color: Colors.black.withOpacity(0.4),
          ),
          Dialog(
            backgroundColor: Colors.white,
            child: Container(
              width: double.infinity,
              height: 220,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(flex: 1, child: SizedBox()),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 5,
                        right: 5,
                        ),
                    child: Column(
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                        Visibility(
                          visible: subTitle == null ? false : true,
                          child: Text(
                            subTitle == null ? '' : subTitle,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color(0xFFb1b1b1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(flex: 1, child: SizedBox()),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    height: 50,
                    child: _buildRightButton(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRightButton() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xff96c35d),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          onTap: onButtonPressed,
          highlightColor: Color(0xFF6a9435),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                buttonText,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.check,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
