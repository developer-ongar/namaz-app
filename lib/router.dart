import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:namazapp/core/constants/routes.dart';
import 'package:namazapp/features/about-namaz/presentations/pages/about-namaz.page.dart';
import 'package:namazapp/features/faq/presentations/pages/faq.page.dart';
import 'package:namazapp/features/home/bloc/sections-bloc.dart';
import 'package:namazapp/features/home/bloc/sections-events.dart';
import 'package:namazapp/features/home/presentation/pages/home/home.page.dart';
import 'package:namazapp/features/namaz-list/presentations/pages/namaz-list.page.dart';
import 'package:namazapp/features/namaz/bloc/namaz-bloc.dart';
import 'package:namazapp/features/namaz/bloc/namaz-events.dart';
import 'package:namazapp/features/namaz/data/datasources/namaz-oop-data.dart';
import 'package:namazapp/features/namaz/presentations/pages/namaz-gender.page.dart';
import 'package:namazapp/features/namaz/presentations/pages/namaz.page.dart';
import 'package:namazapp/features/taharat/bloc/taharat-bloc.dart';
import 'package:namazapp/features/taharat/bloc/taharat-events.dart';
import 'package:namazapp/features/taharat/data/datasources/taharat-local-data.dart';
import 'package:namazapp/features/taharat/presentation/pages/taharat-general/taharat-general.page.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      // Home page
      case Routes.homePage:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (ctx) => SectionsBloc()..add(LoadSectionsEvent())),
            ],
            child: HomePage(),
          ),
        );
      // Taharat
      case Routes.taharatPage:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (ctx) =>
                      TaharatBloc(repos: new TaharatLocalDataRepository())
                        ..add(TaharatEvents.loadTahartDetails)),
            ],
            child: TaharatGeneralPage(),
          ),
        );
      // Gender
      case Routes.genderPage:
        return MaterialPageRoute(
          builder: (_) => GenderPage(),
        );
      // Namaz List
      case Routes.namazListPage:
        return MaterialPageRoute(builder: (_) => NamazListPage(arguments));
      // Namaz
      case Routes.namazPage:
        return MaterialPageRoute(
          builder: (_) => NamazPage(arguments),
        );

      // About namaz
      case Routes.namazAboutPage:
        return MaterialPageRoute(builder: (_) => AboutNamazPage());
      // Faq
      case Routes.faqPage:
        return MaterialPageRoute(builder: (_) => FaqPage());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
