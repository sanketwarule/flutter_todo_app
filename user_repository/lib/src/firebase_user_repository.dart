import 'package:firebase_auth/firebase_auth.dart';
import 'user_repository.dart';

class FirebaseUserRepository implements UserRepository{
  final FirebaseAuth _firebaseAuth;

  FirebaseUserRepository({FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  @override
  Future<void> authenticate() {
    // TODO: implement authenticate
    return _firebaseAuth.signInAnonymously();
  }

  @override
  Future<String> getUserId() async{
    // TODO: implement getUserId
    return (await _firebaseAuth.currentUser()).uid;  }

  @override
  Future<bool> isAuthenticated() async{
    // TODO: implement isAuthenticated
    final currentUser = await _firebaseAuth.currentUser();
    return currentUser != null;  }

}