import 'package:coffeesoc/config/config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:coffeesoc/globalvars.dart';
import 'package:coffeesoc/models/user_model.dart';
import 'package:coffeesoc/pages/login_pg.dart';
import 'package:coffeesoc/start/appsetup.dart';
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

  //the firebaseFirestore collection of the users on my app
  String usersCollection = "coffeeusers";

  GoogleSignInAccount? _googleAcc;
  UserModel? _newUser;

  @override
  void onReady() {
    super.onReady();
    fbUser = Rxn<User>(auth.currentUser);
    fbUser.bindStream(auth.userChanges());
    ever(fbUser, setInitialScreen);
  }

  UserModel? get newUser => _newUser;

//sets the initial screen to the login if the user is not logged in. If the user is logged in with their google account, then go to the app setup and start the app
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

//login with google account and send the info to firebaseFirestore
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

//the sign out method
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

//this is the live stream that ensures that this automatically updates the user
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

//adds user to firebaseFirestore
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
