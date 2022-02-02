import 'package:training_application/data/models/l10n_model.dart';
import 'package:training_application/domain/entities/l10n_entity.dart';

abstract class L10nMapper {
  static L10nEntity map(L10nModel model) {
    return L10nEntity(localeCode: model.localeCode);
  }
}
