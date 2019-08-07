/*
* Now that we have our AuthenticationState and AuthenticationEvents defined,
* we can get to work on implementing the AuthenticationBloc which is going to manage checking and updating a user's
* AuthenticationState in response to AuthenticationEvents.
*
* */

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_todo_app/blocs/authentication_bloc/bloc.dart';
import 'package:user_repository/user_repository.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState>{

  final UserRepository _userRepository;

  AuthenticationBloc({@required UserRepository userRepository})
    : assert(userRepository != null),
      _userRepository = userRepository;

  @override
  // TODO: implement initialState
  AuthenticationState get initialState => Uninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) async*{
    // TODO: implement mapEventToState
    if (event is AppStarted) {
      yield* _mapAppStartedToState();
    }
  }

  Stream<AuthenticationState> _mapAppStartedToState() async*{
    try {
      final isSignedIn = await _userRepository.isAuthenticated();
      if (!isSignedIn) {
        await _userRepository.authenticate();
      }
      final userId = await _userRepository.getUserId();
      yield Authenticated(userId);
    } catch (_) {
      yield UnAuthenticated();
    }

  }

}