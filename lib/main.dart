import 'package:location/src/models/model.dart';
import 'package:location/src/routes.dart';
import 'package:location/src/states/validation_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './src/states/states.dart';
import './src/ui/screens/screens.dart';
import './src/themes/jeddTheme.dart' show jeddTheme;
import './src/locale.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocaleBloc()),
        ChangeNotifierProvider(create: (_) => PermissionsState()),
        ChangeNotifierProvider(create: (_) => AppState()),
        ChangeNotifierProvider(create: (_) => AuthState()),
        ChangeNotifierProvider(create: (_) => new PhoneAuthState()),
        ChangeNotifierProvider(create: (_) => UsersState()),
      ],
      child: MaterialApp(
        // ? debug
        showPerformanceOverlay: false,
        locale: Locale('en', ''),
        localizationsDelegates: [
          const AppLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('ar', 'SA'), // Arabic
          const Locale('en', 'US'), // English
        ],
        title: 'Flutter Demo',
        theme: jeddTheme,
        home: HomeScreen(),
        onGenerateRoute: routes,
      ),
    );
  }
}

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<AppSettingsBloc>(context);
//     final usersProvider = Provider.of<UsersBloc>(context);

//     return Scaffold(
//       backgroundColor: Color.fromRGBO(38, 38, 47, 1),
//       body: Column(
//         children: <Widget>[
//           Text(provider.name, textScaleFactor: 3.3, style: TextStyle(color: Colors.green),),
//           Text(usersProvider.user, textScaleFactor: 3.3, style: TextStyle(color: Colors.blueAccent),),
//         ],
//       )
//     );
//   }
// }
