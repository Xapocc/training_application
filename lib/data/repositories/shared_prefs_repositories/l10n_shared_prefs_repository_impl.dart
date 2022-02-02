import 'package:shared_preferences/shared_preferences.dart';
import 'package:training_application/data/models/l10n_model.dart';
import 'package:training_application/domain/entities/l10n_entity.dart';
import 'package:training_application/domain/mappers/l10n_mapper.dart';
import 'package:training_application/domain/repositories/l10n_choice_repository_interface.dart';

class L10nSharedPrefsRepositoryImpl implements IL10nChoiceRepository {
  @override
  Future<L10nEntity> getChosenL10n() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return L10nMapper.map(L10nModel(prefs.getString('localeCode') ?? ""));
  }

  @override
  Future<void> saveChosenL10n(String localeCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('localeCode', localeCode);
  }
}
