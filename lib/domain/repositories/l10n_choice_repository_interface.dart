import 'package:training_application/domain/entities/l10n_entity.dart';

abstract class IL10nChoiceRepository {
  Future<void> saveChosenL10n(String localeCode);
  Future<L10nEntity> getChosenL10n();
}