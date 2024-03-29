

import 'package:med_project/core/exception/exception.dart';
import 'package:med_project/core/extensions/extensions.dart';
import 'package:med_project/features/calendar/data/models/model.dart';
import 'package:med_project/features/calendar/domain/entities/entities.dart';

abstract class CalendarDataSource {
  Future<List<CalendarEntities>> getData();

  factory CalendarDataSource() => _CalendarDataSource();
}

class _CalendarDataSource implements CalendarDataSource {
  @override
  Future<List<CalendarEntities>> getData() async {
    try {
      final result = await ['data'];
      final response = (result as List)
          .map(
            (e) => CalendarModel.fromJson(e),
          )
          .toList();
      return response.map((e) => e.toEntities).toList();
    } catch (e) {
      throw ServerException(
        errorMessage: '',
        errorCode: 0,
      );
    }
  }
}
