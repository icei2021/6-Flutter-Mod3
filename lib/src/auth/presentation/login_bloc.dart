import 'dart:async';

class LoginState {
  bool hasUpper;
  bool hasLower;
  bool hasNumber;

  LoginState({
    required this.hasUpper,
    required this.hasLower,
    required this.hasNumber,
  });
}

class LoginUpdateEvent {
  final String cad;

  LoginUpdateEvent({this.cad = ''});
}

class LoginBloc {
  final stateStreamController = StreamController<LoginState>();
  final eventStreamController = StreamController<LoginUpdateEvent>();

  LoginBloc() {
    eventStreamController.stream.listen(
      (event) {
        _mapEventToState(event);
      },
    );
  }

  void _mapEventToState(LoginUpdateEvent event) {
    stateStreamController.add(
      LoginState(
        hasUpper: _containsUpper(event.cad),
        hasLower: _containsLower(event.cad),
        hasNumber: _containsNumber(event.cad),
      ),
    );
  }

  bool _containsUpper(String cad) {
    return RegExp(r'[A-Z]').hasMatch(cad);
  }

  bool _containsLower(String cad) {
    return RegExp(r'[a-z]').hasMatch(cad);
  }

  bool _containsNumber(String cad) {
    return RegExp(r'\d').hasMatch(cad);
  }
}
