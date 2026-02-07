import 'package:accessories_store/core/routes/router_generation_config.dart';
import 'package:accessories_store/core/services/manage_cubit_servise.dart';
import 'package:accessories_store/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar')], // list of languages
        path: 'assets/translations', // <-- change the path of the translation files
        fallbackLocale: Locale('ar'), // عشان لو المستخدم مثلا استخدم لغه تانيه ف دا ال يظهر (default)
        child: AccessoriesStore(),
    ),
  );
}

class AccessoriesStore extends StatelessWidget {
  const AccessoriesStore({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (context , child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: LocaleKeys.appName,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          // You can use the library anywhere in the app even in theme
         routerConfig: RouterGenerationConfig.routerConfig,
        );
      },
    );
  }
}

