import 'package:bloc/bloc.dart';

part 'calendar_event.dart';
part 'calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  CalendarBloc() : super(CalendarState()) {
    on<CalendarEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
