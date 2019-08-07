import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

/*
* Note:
  * The equatable package is used in order to be able to compare two instances of AuthenticationState.
  * By default, == returns true only if the two objects are the same instance.
*
*
* Note:
 * Since we're using Equatable to allow us to compare different instances of AuthenticationState
 * we need to pass any properties to the superclass. Without super([displayName]),
 * we will not be able to properly compare different instances of Authenticated.
 *
* */

@immutable
abstract class AuthenticationState extends Equatable{
  AuthenticationState([List props = const []]) : super(props);
}

/*
*  waiting to see for the user is authenticated or not
*
* Note:
*     toString is overridden to make it easier to read an AuthenticationState when
*     printing it to the console or in Transitions.
*
*  */

class Uninitialized extends AuthenticationState{

  @override
  String toString() {
    return "Uninitialized";
  }
}

class Authenticated extends AuthenticationState{
  final String userId;

  Authenticated(this.userId) : super([userId]);

  @override
  String toString() {
    // TODO: implement toString
    return "Authenticated { userId : $userId}";
  }
}

class UnAuthenticated extends AuthenticationState{

  @override
  String toString() {
    // TODO: implement toString
    return "UnAuthenticated";
  }
}