import 'package:bookly_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/Features/home/presentation/managers/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/managers/newset_books_cubit/newset_books_cubit.dart';

import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/service_locator.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'constants.dart';
import 'package:flutter/material.dart';

void main() {
  setup();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => FeaturedBooksCubit(getIt.get<HomeRepoImpl>())
              ..fetchFeaturedBooks()),
        BlocProvider(
            create: (context) => NewsetBooksCubit(getIt.get<HomeRepoImpl>())
              ..fetchNewsetBooks()),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme:
            ThemeData.dark().copyWith(scaffoldBackgroundColor: kPrimaryColor),
      ),
    );
  }
}
