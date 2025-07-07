import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/counter_bloc/counter_bloc.dart';
import 'blocs/chat_bloc/chat_bloc.dart';
import 'repositories/chat_repository.dart';
import 'pages/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDark = false;

  void toggleTheme() {
    setState(() {
      _isDark = !_isDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterBloc()),
        BlocProvider(create: (_) => ChatBloc(ChatRepository())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Dreamy Bloc App',
        theme: _isDark ? ThemeData.dark() : ThemeData.light(),
        home: WelcomePage(toggleTheme: toggleTheme, isDark: _isDark),
      ),
    );
  }
}
