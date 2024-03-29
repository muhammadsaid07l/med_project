import 'package:flutter/cupertino.dart';
import 'package:med_project/assets/app_images.dart';
import 'package:med_project/assets/colors.dart';
import 'package:med_project/assets/fonts.dart';
import 'package:med_project/assets/icons.dart';
import 'package:med_project/assets/theme.dart';
import 'package:med_project/features/calendar/data/models/model.dart';
import 'package:med_project/features/calendar/domain/entities/entities.dart';



extension BuildContextGeneral on BuildContext {
  AppColors get colors {
    return AppColors();
  }

  AppTheme get theme {
    return AppTheme();
  }

  AppFonts get style {
    return theme.darkTheme().extension<AppFonts>()!;
  }


  AppIcons get icons {
    return AppIcons();
  }

  AppImages get images {
    return AppImages();
  }
}

extension CalendarToCalendarEntities on CalendarModel {
  CalendarEntities get toEntities {
    return CalendarEntities(
      description: description ?? '',
      title: title,
      icon: icon,
      startTime: startTime,
      endTime: endTime,
    );
  }
}

// extension NotificationToNotificationEntites on MockDataNotificationsModel {
//   NotificationEntities get toEntitiesNotification {
//     return NotificationEntities(
//       dateTime: dateTime,
//       title: title,
//       subTitle: subTitle,
//     );
//   }
// }


