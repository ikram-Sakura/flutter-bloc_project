import 'package:flutter_bloc/flutter_bloc.dart';
import 'chat_event.dart';
import 'chat_state.dart';
import '../../repositories/chat_repository.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatRepository repository;

  ChatBloc(this.repository) : super(ChatInitial()) {
    on<SendMessageEvent>((event, emit) async {
      emit(ChatLoading());
      try {
        final response = await repository.sendMessage(event.message);
        emit(ChatLoaded(response));
      } catch (_) {
        emit(ChatError('Failed to get response'));
      }
    });
  }
}
