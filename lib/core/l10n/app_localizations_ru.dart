// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get easyErrorContentRetry => 'Повторить';

  @override
  String get easyNetworkFailure => 'Нет подключения к интернету';

  @override
  String get easyServerFailure => 'Произошла ошибка на сервере';

  @override
  String get easyCacheFailure => 'Произошла ошибка с кэшем';

  @override
  String get easyUnknownFailure => 'Произошла неизвестная ошибка';

  @override
  String courseLoadedContentPublishedAt(Object date) {
    return 'Опубликовано $date';
  }

  @override
  String courseLoadedContentDuration(Object duration) {
    return 'Продолжительность $duration минут';
  }

  @override
  String courseLoadedContentLessonsCount(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count уроков',
      few: '$count урока',
      one: '1 урок',
    );
    return 'Всего $_temp0';
  }
}
