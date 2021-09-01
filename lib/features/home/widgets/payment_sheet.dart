import 'package:flutter/material.dart';

import 'package:peepl/features/shared/widgets/primary_button.dart';

class PaymentSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      height: height * 0.6,
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
                            style:
                                TextStyle(color: Colors.blueGrey, fontSize: 15),
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
                        print("hi");
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
    );
  }
}
