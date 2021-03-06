import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:presentation/di/injector.dart';
import 'package:domain/di/injector.dart';
import 'package:data/di/injector.dart';


final getIt = GetIt.I;

@InjectableInit()
void configureDependencies() {
  configureDataDependencies(getIt);
  configureDomainDependencies(getIt);
  configurePresentationDependencies(getIt);


}
