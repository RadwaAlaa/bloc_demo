import 'package:flutter/material.dart';

import 'Presentation/app_router.dart';

void main() {
  runApp(BreakingBadApp(appRouter: AppRouter()));
}

class BreakingBadApp extends StatelessWidget {
  // This widget is the root of your application.


final AppRouter appRouter;
  const BreakingBadApp({
    Key? key,
    required this.appRouter,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}



