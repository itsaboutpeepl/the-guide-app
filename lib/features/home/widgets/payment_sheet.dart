import 'package:flutter/material.dart';

import 'package:peepl/features/shared/widgets/primary_button.dart';

class PaymentSheet extends StatefulWidget {
  @override
  _PaymentSheetState createState() => _PaymentSheetState();
}

class _PaymentSheetState extends State<PaymentSheet> {
  bool _isConfirming = false;
  bool _showDetails = false;
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return AnimatedCrossFade(
      duration: Duration(
        milliseconds: 600,
      ),
      crossFadeState:
          _isConfirming ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      firstChild: Container(
        height: height,
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 15,
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8.0,
                        right: 8.0,
                      ),
                      child: Text('Peepl.pay'),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8.0,
                        right: 8.0,
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.cancel_outlined,
                          color: Colors.blueGrey,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
                Divider(),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Center(child: Text("Company Logo")),
                        height: height * 0.1,
                        width: width * 0.2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Company Name",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Pay with Peepl.Pay",
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 15),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "To pay send amount to the address:",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Amount",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: TextFormField(
                    enabled: false,
                    decoration: InputDecoration(
                      hintText: '50 GBPx',
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                      filled: true,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Address",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: TextFormField(
                    enabled: false,
                    decoration: InputDecoration(
                      hintText: '0xc0ffee254729296a45a3885639AC7E10F9d54979',
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                      filled: true,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.copy_all_outlined,
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PrimaryButton(
                        opacity: 1,
                        // labelFontWeight: FontWeight.normal,
                        label: "Next",
                        onPressed: () {
                          setState(() {
                            _isConfirming = true;
                          });
                        },

                        width: width * 0.3,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      secondChild: Container(
        height: height * 0.35,
        child: Column(
          children: [
            Container(
              height: height * 0.25,
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 5.0,
                      spreadRadius: 2.0,
                      offset: Offset(0.0, 2.0),
                    )
                  ]),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              iconSize: 20,
                              onPressed: () {
                                setState(() {
                                  _isConfirming = false;
                                });
                              },
                              icon: Icon(
                                Icons.arrow_back_rounded,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 15.0,
                              ),
                              child: Text(
                                'Confirm Payment',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Text(
                                '50 ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 23,
                                ),
                              ),
                            ),
                            Text(
                              'GBPx',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          children: [
                            Checkbox(
                                value: _value,
                                onChanged: (_value) {
                                  setState(() {
                                    _value = true;
                                  });
                                }),
                            Text('Use PPL rewards token?'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Available: 0 PPL",
                              style: TextStyle(
                                color: Colors.blueGrey,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: height * 0.05,
                    width: width * 0.3,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                      ),
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          color: Theme.of(context).buttonColor,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          Navigator.pop(context);
                        });
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PrimaryButton(
                    height: height * 0.05,
                    opacity: 1,
                    // labelFontWeight: FontWeight.normal,
                    label: "Pay",
                    onPressed: () {
                      setState(() {
                        _isConfirming = true;
                      });
                    },

                    width: width * 0.3,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
