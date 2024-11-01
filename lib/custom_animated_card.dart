import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CustomAnimatedCard extends StatefulWidget {
  const CustomAnimatedCard(
      {super.key,
      required this.itemIndex,
      required this.bgColor,
      required this.scoreInCurrentDuration,
      required this.userName,
      required this.userProfileURL,
      required this.isCurrentUser});

  final int itemIndex;
  final Color bgColor;
  final String scoreInCurrentDuration;
  final String userName;
  final String userProfileURL;
  final bool isCurrentUser;

  @override
  State<CustomAnimatedCard> createState() => _CustomAnimatedCardState();
}

class _CustomAnimatedCardState extends State<CustomAnimatedCard> {
  bool onTaped = false;
  bool onTapedDown = false;

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return Container(
      height: 80,
      width: 400,
      margin: const EdgeInsetsDirectional.only(bottom: 12, end: 12, start: 12),
      clipBehavior: Clip.hardEdge,
      padding: const EdgeInsetsDirectional.only(start: 12, end: 16),
      decoration: ShapeDecoration(
        color: themeData.colorScheme.secondary,
        shape: SmoothRectangleBorder(
          borderRadius: SmoothBorderRadius(
            cornerRadius: 12,
            cornerSmoothing: 1,
          ),
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTapDown: (tap) {
          setState(() {
            onTaped = true;
          });
        },
        onTapCancel: () {
          setState(() {
            onTaped = false;
          });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        (widget.itemIndex + 1).toString(),
                        style: themeData.textTheme.titleLarge!.copyWith(
                          fontSize: 24.2,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ).animate().rotate(
                        begin: 0.4,
                        duration: 200.ms,
                        delay: 200.ms,
                        alignment: Alignment.topCenter,
                      ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    height: 100,
                    width: 75,
                    child: ClipRRect(
                      borderRadius: BorderRadiusDirectional.circular(18),
                      child: Image.network(
                        widget.userProfileURL,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  Expanded(
                    child: Text(
                      widget.userName.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: themeData.textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.5,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                ],
              ),
            ),
            Text(
              widget.scoreInCurrentDuration,
              style: themeData.textTheme.titleMedium!.copyWith(
                color: Colors.grey[400],
              ),
            )
                .animate(
                  delay: 150.ms,
                )
                .moveX(begin: 100)
                .then()
                .shakeX(hz: 4, amount: 3),
          ],
        ),
      ),
    )
        .animate(target: onTaped ? 1 : 0)
        .scaleXY(
            begin: 1, end: 0.85, duration: const Duration(milliseconds: 100))
        .rotate(end: widget.itemIndex.isEven ? 0.0015 : -0.0015);
  }
}
