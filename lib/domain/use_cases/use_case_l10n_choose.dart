import 'package:training_application/domain/entities/l10n_entity.dart';
import 'package:training_application/domain/repositories/l10n_choice_repository_interface.dart';

class L10nChoiceUseCase {
  L10nChoiceUseCase({required this.repository});

  IL10nChoiceRepository repository;

  Future<void> saveChosenL10n(String localeCode) {
    return repository.saveChosenL10n(localeCode);
  }
  Future<L10nEntity> getChosenL10n() {
    return repository.getChosenL10n();
  }
}
