part of 'send_gift_cubit.dart';


abstract class SendGiftState extends Equatable {

  const SendGiftState();

  @override
  List<Object?> get props => <Object?>[];
}

class SendGiftInitialState extends SendGiftState {
  const SendGiftInitialState();
}

class SendGiftLoadingState extends SendGiftState {
  const SendGiftLoadingState();
}

class SendGiftSuccessState extends SendGiftState {
  const SendGiftSuccessState();

}

class SendGiftErrorState extends SendGiftState {
  final String message;

  const SendGiftErrorState({required this.message,});

  @override
  List<Object?> get props => <Object?>[message];
}

