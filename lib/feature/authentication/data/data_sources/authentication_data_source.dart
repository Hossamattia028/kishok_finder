
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kiosk_finder/feature/authentication/data/models/auth_response.dart';
import 'package:kiosk_finder/feature/authentication/domain/entities/user_entity.dart';


abstract class AuthServiceRemoteDataSourceImpl {
  Future<AuthResponse> registerUser(Map<String, dynamic> userData);
  Future<AuthResponse> loginUser(Map<String, dynamic> userData);
}

class AuthServiceRemoteDataSource implements AuthServiceRemoteDataSourceImpl {

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;  

  @override  
  Future<AuthResponse> loginUser(Map<String, dynamic> userData) async {  
    String email = userData['email'];  
    String password = userData['pass'];  

    try {  
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(  
        email: email,  
        password: password,  
      );  

      // User successfully logged in  
      User? user = userCredential.user;  
      if(user!=null){
        return AuthResponse(  
          msg: 'User successfully registered',  
          isSuccess: true,  
          isFailed: false,  
          user: UserService(userId: 0, firstName: user.displayName.toString(), phoneNumber: user.phoneNumber.toString(),
           email: email, image: '', cityID: '', nid: '')
        ); 
      }else{
          return AuthResponse(msg: 'can not get this user', isFailed: true);
      } 
    } on FirebaseAuthException catch (e) {  
      if (e.code == 'user-not-found') {  
        return AuthResponse(msg: 'No user found for that email', isFailed: true);  
      } else if (e.code == 'wrong-password') {  
        return AuthResponse(msg: 'Wrong password provided for that user', isFailed: true);  
      } else {  
        return AuthResponse(msg: 'Error: ${e.message}', isFailed: true);  
      }  
    } catch (e) {  
      return AuthResponse(msg: 'Error: ${e.toString()}', isFailed: true);  
    }  
  }  

  @override  
  Future<AuthResponse> registerUser(Map<String, dynamic> userData) async {  
    String email = userData['email'];  
    String password = userData['pass'];  

    try {  
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(  
        email: email,  
        password: password,  
      );  

      // User successfully registered  
      User? user = userCredential.user;  
      if(user!=null){
        return AuthResponse(  
          msg: 'User successfully registered',  
          isSuccess: true,  
          isFailed: false,  
          user: UserService(userId: 0, firstName: user.displayName.toString(), phoneNumber: user.phoneNumber.toString(),
           email: email, image: '', cityID: '', nid: '')
        ); 
      }else{
          return AuthResponse(msg: 'can not get this user', isFailed: true);
      }
    } on FirebaseAuthException catch (e) {  
      if (e.code == 'email-already-in-use') {  
        return AuthResponse(msg: 'The account already exists for that email', isFailed: true);  
      } else if (e.code == 'weak-password') {  
        return AuthResponse(msg: 'The password provided is too weak', isFailed: true);  
      } else {  
        return AuthResponse(msg: 'Error: ${e.message}', isFailed: true);  
      }  
    } catch (e) {  
      return AuthResponse(msg: 'Error: ${e.toString()}', isFailed: true);  
    }  
  } 

}