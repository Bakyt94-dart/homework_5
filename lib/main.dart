import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';

void main() async {
  Bloc.observer = TalkerBlocObserver();
  final _appRouter = AppRouter();
  runApp(MaterialApp.router(routerConfig: _appRouter.config()));
}