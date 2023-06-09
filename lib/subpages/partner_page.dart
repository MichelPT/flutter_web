import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PartnerSubPage extends StatelessWidget {
  const PartnerSubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Donation',
          style: TextStyle(fontSize: 5.h),
        ),
        SizedBox(
          height: 10.h,
        ),
        TextFormField(
          decoration: const InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)))),
        )
      ],
    );
  }
}
