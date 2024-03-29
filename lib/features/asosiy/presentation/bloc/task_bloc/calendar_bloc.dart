import 'package:bloc/bloc.dart';

import 'package:flutter/foundation.dart';
import 'package:med_project/core/injector/injector.dart';
import 'package:med_project/features/calendar/domain/entities/entities.dart';
import 'package:med_project/features/calendar/domain/usecase/usecase.dart';

part 'calendar_event.dart';
part 'calendar_state.dart';

class CalendarTaskBloc extends Bloc<CalendarTaskEvent, CalendarTaskState> {
  CalendarTaskBloc()
      : super(CalendarTaskState(
          datas: [],
          status: CalendarStatus.pure,
        )) {
    on<CalendarBlocStarted>(
      (event, emit) async {
        emit(
          state.copyWith(
            status: CalendarStatus.loading,
          ),
        );
        final usecase = sl<CalendarUseCase>();
        print("KELDIIiiiiiiii");
        final either = await usecase.call(
          GetData(),
        );
        either.either(
          (failure) {
            emit(
              state.copyWith(
                status: CalendarStatus.failure,
              ),
            );
          },
          (value) {
            emit(
              state.copyWith(
                status: CalendarStatus.succsess,
                datas: value,
              ),
            );
          },
        );
      },
    );
  }
}
