import 'package:get_it/get_it.dart';
import 'package:inventory/repository/ebatli_repository.dart';
import 'package:inventory/repository/ebatli_toplam_degerler.dart';
import 'package:inventory/repository/google_auth.dart';
import 'package:inventory/repository/palet_repository.dart';
import 'package:inventory/repository/paletler_toplam_degerler.dart';
import 'package:inventory/repository/qr_code_repository.dart';
import 'package:inventory/view_models/ebatli_toplam_deger_view.dart';
import 'package:inventory/view_models/ebatli_view_models.dart';
import 'package:inventory/view_models/google_auth_view_models..dart';
import 'package:inventory/view_models/palet_toplam_deger_view.dart';
import 'package:inventory/view_models/paletler_view_models.dart';
import 'package:inventory/view_models/qr_code_view_models.dart';

GetIt locator = GetIt.instance;
void setupLocator() {
  locator.registerLazySingleton(() => EbatliRepository());
  locator.registerLazySingleton(() => EbatliViewModel());
  locator.registerLazySingleton(() => QrCodeRepository());
  locator.registerLazySingleton(() => QrViewModels());
  locator.registerLazySingleton(() => PaletlerRepository());
  locator.registerLazySingleton(() => PaletlerViewModel());
  locator.registerLazySingleton(() => FirebaseLogin());
  locator.registerLazySingleton(() => LoginViewModel());
  locator.registerLazySingleton(() => EbatliToplamDegerler());
  locator.registerLazySingleton(() => PaletlerToplamDeger());
  locator.registerLazySingleton(() => EbatliDegerler());
  locator.registerLazySingleton(() => PaletDegerler());
}
