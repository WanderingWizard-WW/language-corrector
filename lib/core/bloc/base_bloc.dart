import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_corrector/core/bloc/base_state.dart';

abstract class BaseBloc<E, S extends BaseState> extends Bloc<E, S> {
  BaseBloc(S initialState) : super(initialState);
}

abstract class BaseCubit<S extends BaseState> extends Cubit<S> {
  BaseCubit(S initialState) : super(initialState);
}
