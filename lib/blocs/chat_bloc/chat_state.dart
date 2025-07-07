abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {}

class ChatLoaded extends ChatState {
  final String response;
  ChatLoaded(this.response);
}

class ChatError extends ChatState {
  final String message;
  ChatError(this.message);
}
