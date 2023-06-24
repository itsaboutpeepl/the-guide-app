import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerButton extends StatefulWidget {
  const ShimmerButton(
      {Key? key,
      required this.buttonContent,
      required this.buttonAction,
      required this.baseColor,
      required this.highlightColor})
      : super(key: key);

  final Widget buttonContent;
  final Function() buttonAction;
  final Color baseColor;
  final Color highlightColor;

  @override
  _ShimmerButtonState createState() => _ShimmerButtonState();
}

class _ShimmerButtonState extends State<ShimmerButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.buttonAction,
      child: Stack(
        children: [
          Material(
            elevation: 10,
            borderRadius: BorderRadius.circular(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Shimmer.fromColors(
                period: Duration(seconds: 3),
                baseColor: widget.baseColor,
                highlightColor: widget.highlightColor,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(4, 4),
                        blurRadius: 5.0,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 15.0,
                right: 15.0,
                top: 5.0,
                bottom: 5.0,
              ),
              child: widget.buttonContent,
            ),
          ),
        ],
      ),
    );
  }
}
