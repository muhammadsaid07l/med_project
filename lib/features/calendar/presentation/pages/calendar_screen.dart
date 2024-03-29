import 'package:flutter/material.dart';
import 'package:med_project/core/extensions/extensions.dart';
import 'package:med_project/features/calendar/parts/kvartal_item.dart';


class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Kalendar",
          style: context.style.fontSize16Weight600.copyWith(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(child: Column(children: [KvartalItem(kvartalNumber: 4)],),)
    );
  }
}
