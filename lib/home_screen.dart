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
  String result = "000";

  void _calculateResult() {
    double numPurchases = double.parse(_purchaserController.text);
    double numStocks = double.parse(_stockNumbersController.text);
    double price = double.parse(_maxPriceController.text);
    print(numPurchases);
    print(numStocks);
    print(price);

    double doubleResult = (numStocks * price) / (numPurchases);
    int intResult = doubleResult.toInt();
    setState(() {
      result = intResult.toString();
    });
  }

  String getMoneyFormatString(String input) {
    String moneyFormat = "";
    String slice = "";
    // slice.replaceAll(",", "replace");
    int inputLength = input.length;
    int loopCount = inputLength ~/ 3;
    int helper = inputLength - loopCount * 3;
    int start = 0;

    for (var i = 0; i < loopCount; i++) {
      slice = input.substring(start, helper + (3 * i));
      moneyFormat = moneyFormat + "," + slice;
      start = helper + (3 * i);
    }
    if (input.length > 3) {}
    return moneyFormat;
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
                        Container(
                            height: 100,
                            width: double.infinity,
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(bottom: 60),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.blueAccent, width: 1),
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
                                    "تومان",
                                    style: Theme.of(context).textTheme.caption,
                                  ),
                                ),
                                Flexible(
                                  flex: 60,
                                  child: Text(
                                    "$result",
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                ),
                                Flexible(
                                  flex: 30,
                                  child: Text(""),
                                ),
                              ],
                            )),
                        Padding(
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
                                      colors: [
                                        Color(0xFFe6dfd8),
                                        Color(0xFFf7f5ec)
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      stops: [0, .4],
                                      tileMode: TileMode.clamp,
                                    )),
                                child: TextField(
                                  controller: _purchaserController,
                                  decoration: InputDecoration(
                                    prefixText: "     ",
                                    // contentPadding: EdgeInsets.all(40),
                                    // fillColor: Colors.white.withOpacity(0.5),
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(32),
                                        bottomLeft: Radius.circular(32),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      // borderRadius: BorderRadius.only(
                                      //   topLeft: Radius.circular(20),
                                      //   bottomLeft: Radius.circular(20),
                                      // ),

                                      borderRadius:
                                          BorderRadius.all(Radius.circular(32)),
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                    hintText: "3,500,00",
                                  ),
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
                                child: Text(
                                  "خریداران",
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
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
                                      colors: [
                                        Color(0xFFe6dfd8),
                                        Color(0xFFf7f5ec)
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      stops: [0, .4],
                                      tileMode: TileMode.clamp,
                                    )),
                                child: TextField(
                                  controller: _stockNumbersController,
                                  decoration: InputDecoration(
                                    prefixText: "     ",
                                    // contentPadding: EdgeInsets.all(40),
                                    // fillColor: Colors.white.withOpacity(0.5),
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(32),
                                        bottomLeft: Radius.circular(32),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      // borderRadius: BorderRadius.only(
                                      //   topLeft: Radius.circular(20),
                                      //   bottomLeft: Radius.circular(20),
                                      // ),

                                      borderRadius:
                                          BorderRadius.all(Radius.circular(32)),
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                    hintText: "300,000",
                                  ),
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
                                child: Text(
                                  "تعداد سهام",
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
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
                                      colors: [
                                        Color(0xFFe6dfd8),
                                        Color(0xFFf7f5ec)
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      stops: [0, .4],
                                      tileMode: TileMode.clamp,
                                    )),
                                child: TextField(
                                  controller: _maxPriceController,
                                  decoration: InputDecoration(
                                    prefixText: "     ",
                                    // contentPadding: EdgeInsets.all(40),
                                    // fillColor: Colors.white.withOpacity(0.5),
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(32),
                                        bottomLeft: Radius.circular(32),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      // borderRadius: BorderRadius.only(
                                      //   topLeft: Radius.circular(20),
                                      //   bottomLeft: Radius.circular(20),
                                      // ),

                                      borderRadius:
                                          BorderRadius.all(Radius.circular(32)),
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                    hintText: "2,950",
                                  ),
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
                                child: Text(
                                  "حداکثر قیمت",
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 70,
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 170, left: 50, right: 50),
                    child: ElevatedButton(
                      onPressed: _calculateResult,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "محاسبه",
                          style: Theme.of(context).textTheme.button,
                        ),
                        // style: ButtonStyle(shape: ),
                      ),
                    ),
                  ),
                ),
                // Align(
                //   alignment: Alignment.bottomCenter,
                //   child: Stack(children: [
                //     Container(
                //       height: 70,
                //       width: 250,
                //       margin: EdgeInsets.only(bottom: 20),
                //       // color: Colors.black,
                //       child: ElevatedButton(
                //         clipBehavior: Clip.none,
                //         onPressed: () {},
                //         child: null,
                //         style: ElevatedButton.styleFrom(
                //           shape: RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(100),
                //           ),
                //         ),
                //       ),
                //     ),
                //   ]),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
