import 'package:data/di/injector.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@InjectableInit()
void configureDataDependencies(GetIt getIt) => $initGetIt(getIt);
