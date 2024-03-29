import 'package:med_project/core/either/either.dart';
import 'package:med_project/core/failure/failure.dart';
import 'package:med_project/features/calendar/domain/entities/entities.dart';

abstract class CalendarRepository {
  Future<Either<Failure, List<CalendarEntities>>> getData();
}
