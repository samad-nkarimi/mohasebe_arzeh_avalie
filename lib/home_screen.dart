import 'dart:ui';

import 'package:aacalc/constants.dart';
import 'package:aacalc/styling.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _purchaserController = TextEditingController();
  final TextEditingController _stockNumbersController = TextEditingController();
  final TextEditingController _maxPriceController = TextEditingController();
  final String splitCharacter = " ";
  String result = "000";

  void _calculateResult() {
    double numPurchases =
        double.parse(_purchaserController.text.replaceAll(splitCharacter, ""));
    double numStocks = double.parse(
        _stockNumbersController.text.replaceAll(splitCharacter, ""));
    double price =
        double.parse(_maxPriceController.text.replaceAll(splitCharacter, ""));
    print(numPurchases);
    print(numStocks);
    print(price);

    double doubleResult = (numStocks * price) / (numPurchases);
    int intResult = doubleResult.toInt();
    intResult = (intResult ~/ 1000) * 1000;
    setState(() {
      result = getMoneyFormatString(intResult.toString());
    });

    print(getMoneyFormatString(""));
    print(getMoneyFormatString("3"));
    print(getMoneyFormatString("35"));
    print(getMoneyFormatString("350"));
    print(getMoneyFormatString("3500"));
    print(getMoneyFormatString("35000"));
    print(getMoneyFormatString("350000"));
    print(getMoneyFormatString("3500000"));
    print(getMoneyFormatString("35000000"));
    print(getMoneyFormatString("350000000"));
  }

  String getMoneyFormatString(String input) {
    input = input.replaceAll(splitCharacter, "");
    String moneyFormat = "";
    String slice = "";
    // slice.replaceAll(",", "replace");
    int inputLength = input.length;
    if (inputLength <= 3)
      moneyFormat = input;
    else {
      int loopCount = inputLength ~/ 3;
      int helper = inputLength - loopCount * 3;
      int start = 0;

      for (var i = 0; i <= loopCount; i++) {
        slice = input.substring(start, helper + (3 * i));
        if (i == 0)
          moneyFormat = slice;
        else
          moneyFormat = moneyFormat + splitCharacter + slice;
        start = helper + (3 * i);
      }

      if (helper == 0) moneyFormat = moneyFormat.substring(1);
    }

    return moneyFormat;
  }

  Widget _customTextField(TextEditingController tec, String hintString,
      String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Container(
            height: 60,
            decoration: ShapeDecoration(
              shadows: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(1, 1),
                )
              ],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  bottomLeft: Radius.circular(32),
                ),
              ),
              gradient: LinearGradient(
                colors: [Color(0xFFe6dfd8), Color(0xFFf7f5ec)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0, .4],
                tileMode: TileMode.clamp,
              ),
            ),
            child: TextField(
              controller: tec,
              onChanged: (v) {
                tec.text = getMoneyFormatString(tec.text);
                tec.selection = TextSelection.fromPosition(
                  TextPosition(offset: tec.text.length),
                );
              },
              decoration: InputDecoration(
                  prefixText: "     ",
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      bottomLeft: Radius.circular(32),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32)),
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  hintText: hintString,
                  hintStyle: TextStyle(color: Colors.black26)),
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: 120,
            height: 60,
            decoration: BoxDecoration(
              color: AppTheme.cardOverEditTextColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(-4, 0),
                )
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                if (subtitle != "")
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.caption,
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _resultContainer() {
    return Container(
      height: 100,
      width: double.infinity,
      alignment: Alignment.center,
      margin: EdgeInsets.only(bottom: 40),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueAccent, width: 1),
        borderRadius: BorderRadius.all(
          Radius.circular(100),
        ),
        color: AppTheme.resultButtonColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
            flex: 30,
            child: Text(
              Constants.MONEY_UNIT,
              style: Theme.of(context).textTheme.caption,
            ),
          ),
          Flexible(
            flex: 60,
            child: Text(
              "$result",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Flexible(
            flex: 30,
            child: Text(""),
          ),
        ],
      ),
    );
  }

  Widget _calculateButton() {
    return Container(
      height: 70,
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 120, left: 50, right: 50),
      child: ElevatedButton(
        onPressed: _calculateResult,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: Center(
          child: Text(
            Constants.BUTTON_TITLE,
            style: Theme.of(context).textTheme.button,
          ),
          // style: ButtonStyle(shape: ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          child: Container(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  // color: Colors.red,
                  child: SvgPicture.asset(
                    "assets/images/back3.svg",
                    alignment: Alignment.topCenter,
                    width: double.infinity,
                  ),
                ),
                Container(
                  color: Colors.white12,
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      children: [
                        _resultContainer(),
                        _customTextField(_purchaserController, "3 500 000",
                            Constants.PURCHASER_COUNT_TITLE, ""),
                        _customTextField(_stockNumbersController, "250 000 000",
                            Constants.STOCK_COUNT_TITLE, ""),
                        _customTextField(_maxPriceController, "2 100",
                            Constants.MAX_PRICE_TITLE, Constants.MONEY_UNIT),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: _calculateButton(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
