import '../../injection_container.dart';
import 'presentation/controllers/bottom_nav_bar/bottom_nav_bar_cubit.dart';

final _sl = ServiceLocator.instance;

Future<void> initHomeFeatureInjection() async {
  ///-> Cubits
  _sl.registerLazySingleton<BottomNavBarCubit>(() => BottomNavBarCubit());
}