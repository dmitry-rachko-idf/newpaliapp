import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/bloc/base_bloc.dart';

abstract class BlocState<S extends StatefulWidget, B extends BaseBloc>
    extends State<S> {
  final B bloc = GetIt.I.get<B>();
}
