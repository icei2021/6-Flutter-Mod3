import 'package:fl_mod3/src/auth/presentation/login_bloc.dart';
import 'package:flutter/material.dart';

class NameTextField extends StatelessWidget {
  NameTextField({super.key});

  final _bloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'Nombre completo',
          ),
          onChanged: (value) {
            _bloc.eventStreamController.add(LoginUpdateEvent(cad: value));
          },
        ),
        StreamBuilder<LoginState>(
          stream: _bloc.stateStreamController.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Debe contener una mayuscula',
                    style: TextStyle(
                      decoration: snapshot.data!.hasUpper
                          ? TextDecoration.lineThrough
                          : null,
                    ),
                  ),
                  Text(
                    'Debe contener una minuscula',
                    style: TextStyle(
                      decoration: snapshot.data!.hasLower
                          ? TextDecoration.lineThrough
                          : null,
                    ),
                  ),
                  Text(
                    'Debe contener un numero',
                    style: TextStyle(
                      decoration: snapshot.data!.hasNumber
                          ? TextDecoration.lineThrough
                          : null,
                    ),
                  ),
                ],
              );
            }
            return const SizedBox();
          },
        ),
      ],
    );
  }
}
