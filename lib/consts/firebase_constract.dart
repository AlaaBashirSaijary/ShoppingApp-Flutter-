import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firestor = FirebaseFirestore.instance;
User? curentUser = auth.currentUser;
const usersCollection='users' ;
