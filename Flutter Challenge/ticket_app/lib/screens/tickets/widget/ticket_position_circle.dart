import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/styles/app_styles.dart';

class TicketPositionCircle extends StatelessWidget {
  final bool? position;
  const TicketPositionCircle({super.key, this.position});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: position == null ? 27 : null,
        right: position != null ? 27 : null,
        top: 134.5,
        child: Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 2, color: AppStyles.textColor)),
          child: CircleAvatar(
            maxRadius: 4,
            backgroundColor: AppStyles.textColor,
          ),
        ));
  }
}
