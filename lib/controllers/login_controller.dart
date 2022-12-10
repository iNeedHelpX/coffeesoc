import 'package:coffeesoc/config/config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:coffeesoc/globalvars.dart';
import 'package:coffeesoc/models/user_model.dart';
import 'package:coffeesoc/pages/login_pg.dart';
import 'package:coffeesoc/start/appsetup.dart';
import 'package:rapyd/models/customer.dart';
import 'package:rapyd/rapyd.dart';

//for authentication/login
class LoginController extends GetxController {
  static LoginController instance = Get.find();
  // late BuildContext context;
  Rxn<User> fbUser = Rxn<User>();
  final googleSignIn = GoogleSignIn();

  Rx<RapydClient> rapydUsr =
      RapydClient(Configurations().rapydAccess, Configurations().rapydSecret)
          .obs;
  Rx<UserModel> userModel = UserModel().obs;
  String usersCollection = "coffeeusers";

  GoogleSignInAccount? _googleAcc;
  UserModel? _newUser;
  CustomerData? _cust;
  Customer? customerInfo;

  @override
  void onReady() {
    super.onReady();
    fbUser = Rxn<User>(auth.currentUser);
    fbUser.bindStream(auth.userChanges());
    ever(fbUser, setInitialScreen);
  }

  CustomerData? get customer => _cust;
  UserModel? get newUser => _newUser;

  setInitialScreen(User? user) {
    if (user == null) {
      print("going to login page...");
      Get.offAll(() => LoginPage());
    } else {
      print("The user is ${user.displayName}");
      userModel.bindStream(listenToUser());
      Get.offAll(() => AppSetup());
    }
  }

  void googleLogin() async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return;

    _googleAcc = googleUser;
    final googleAuth = await googleUser.authentication;

    final cred = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    try {
      await auth.signInWithCredential(cred).then((res) async {
        print('Signed in successfully as ' + res.user!.displayName.toString());
        print('email: ' + res.user!.email.toString());
        UserModel _newUser = UserModel(
          id: res.user!.uid,
          email: res.user!.email!,
          name: res.user!.displayName,
          photoURL: res.user!.photoURL,
          cart: [],
        );
        _addUserToFB(_newUser, res.user!);
        // createRapydCustomer(_newUser);
        print("${_newUser.email}");
      });
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar("Sign In Failed", "Try again");
    }
  }

  void signOut() async {
    googleSignIn.signOut();
    auth.signOut();
  }

  //maybe add clear controllers method?

  updateUserData(Map<String, dynamic> data) {
    logger.i("UPDATED");
    firebaseFirestore
        .collection(usersCollection)
        .doc(fbUser.value?.uid)
        .update(data);
  }

  Stream<UserModel> listenToUser() => firebaseFirestore
      .collection(usersCollection)
      .doc(fbUser.value!.uid)
      .snapshots()
      .map((snapshot) => UserModel.fromSnapshot(snapshot));

  // void createRapydCustomer(UserModel usr) async {
  //   final rapydClient =
  //       RapydClient(Configurations().rapydAccess, Configurations().rapydSecret);

  //   try {
  //     final customer = await rapydClient.createNewCustomer(
  //       email: usr.email!,
  //       name: usr.name!,
  //     );

  //     print('Created customer successfully, name: ${customer.data.name}');
  //     if (customer.data.email == usr.email) return;
  //   } catch (e) {
  //     print('ERROR: ${e.toString()}');
  //   }
  // }

  _addUserToFB(UserModel usr, User firebaseUser) {
    firebaseFirestore.collection(usersCollection).doc(usr.id).set({
      "displayName": usr.name,
      "id": usr.id,
      "photoURL": usr.photoURL,
      "email": usr.email,
      "cart": usr.cart
    });
  }
}
