import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'trt_event.dart';
part 'trt_state.dart';

class TRTBloc extends Bloc<TRTEvent, TRTState> {
  TRTBloc._internal() : super(TRTInitialState()) {
    on<TRTInitialEvent>((event, emit) async {
      emit(TRTLoadingState());
      await Future.delayed(Duration(seconds: 1), () {});
      //sample
      emit(TRTStartTestState());
    });

    on<TRTOngoingEvent>((event, emit) async {
      emit(TRTLoadingState());
      await Future.delayed(Duration(seconds: 1), () {});
      emit(TRTOngoingState());
    });

    on<TRTResultEvent>((event, emit) async {
      emit(TRTLoadingState());
      await Future.delayed(Duration(seconds: 1), () {});
      emit(TRTResultState());
    });
    on<TRTProfileEvent>((event, emit) async {
      emit(TRTLoadingState());
      await Future.delayed(Duration(seconds: 1), () {});
      emit(TRTProfileState());
    });

    on<TRTEditProfileEvent>((event, emit) async {
      emit(TRTLoadingState());
      await Future.delayed(Duration(seconds: 1), () {});
      emit(TRTEditProfileState());
    });

    on<TRTSaveProfileEvent>((event, emit) async {
      emit(TRTLoadingState());
      await Future.delayed(Duration(seconds: 1), () {});
      emit(TRTSaveProfileState());
    });
    on<TRTUpdateFirmwareEvent>((event, emit) async {
      emit(TRTLoadingState());
      await Future.delayed(Duration(seconds: 1), () {});
      emit(TRTUpdateFirmwareState());
    });

    on<TRTHelpEvent>((event, emit) async {
      emit(TRTLoadingState());
      await Future.delayed(Duration(seconds: 1), () {});
      emit(TRTHelpState());
    });
  }

  static final _client = TRTBloc._internal();
  factory TRTBloc() {
    return _client;
  }

  static TRTBloc get instance => _client;
}
