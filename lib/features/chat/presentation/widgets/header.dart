import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:med_project/core/extensions/extensions.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.selectedMonth,
    required this.selectedDate,
    required this.onChange,
  });

  final DateTime selectedMonth;
  final DateTime? selectedDate;

  final ValueChanged<DateTime> onChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // CalendarButton(
          //   onTap: () {
          //     onChange(
          //       selectedMonth.addMonth(-1),
          //     );
          //   },
          //   assetName: AppIcons.leftButton,
          // ),
          Text(
            selectedDate == null
                ? DateFormat('MMM yyyy').format(DateTime.now())
                : DateFormat('MMM yyyy').format(selectedMonth),
            style: context.style.fontSize20Weight500,
          ),
          // CalendarButton(
          //   onTap: () {
          //     onChange(
          //       selectedMonth.addMonth(1),
          //     );
          //   },
          //   assetName: AppIcons.rightButton,
          // ),
        ],
      ),
    );
  }
}
