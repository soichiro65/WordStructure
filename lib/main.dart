import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_structure/router.dart';

void main() {
  final router = createRouter();
  runApp(
    App(
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
    ),
  );
}

class App extends StatelessWidget {
  const App({
    Key? key,
    required this.routeInformationParser,
    required this.routerDelegate,
  }) : super(key: key);

  final RouteInformationParser<Object> routeInformationParser;
  final RouterDelegate<Object> routerDelegate;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        localizationsDelegates: const [
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
        supportedLocales: const [Locale('ja')],
        locale: const Locale('ja'),
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle.dark,
          ),
        ),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        routeInformationParser: routeInformationParser,
        routerDelegate: routerDelegate,
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
