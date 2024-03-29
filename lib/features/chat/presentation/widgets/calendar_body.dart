import 'package:flutter/cupertino.dart';
import 'package:med_project/core/extensions/data_time_extension.dart';
import 'package:med_project/core/extensions/extensions.dart';
import 'package:med_project/features/calendar/data/models/calendar_month.dart';
import 'package:med_project/features/calendar/presentation/widgets/row_item.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
    required this.selectedMonth,
    required this.selectedDate,
    required this.selectDate,
  });

  final DateTime selectedMonth;
  final DateTime? selectedDate;

  final ValueChanged<DateTime> selectDate;

  @override
  Widget build(BuildContext context) {
    var data = CalendarMonthData(
      year: selectedMonth.year,
      month: selectedMonth.month,
    );

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            weekDay('Mon', context),
            weekDay('Tue', context),
            weekDay('Wed', context),
            weekDay('Thu', context),
            weekDay('Fri', context),
            weekDay('Sat', context),
            weekDay('Sun', context),
          ],
        ),
        const SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var week in data.weeks)
              Row(
                children: week.map((d) {
                  return Expanded(
                    child: RowItem(
                      date: d.date,
                      isActiveMonth: d.isActiveMonth,
                      onTap: () => selectDate(d.date),
                      isSelected: selectedDate != null &&
                          selectedDate!.isSameDate(d.date),
                    ),
                  );
                }).toList(),
              ),
          ],
        ),
      ],
    );
  }

  Text weekDay(String day, BuildContext context) {
    return Text(
      day,
      style: context.style.fontSize14Weight500.copyWith(
        color: context.colors.tasksTimeColor,
      ),
    );
  }
}
