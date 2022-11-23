import 'package:firebase_auth/firebase_auth.dart';
import 'package:usrs_app/models/direction_details_info.dart';
import 'package:usrs_app/models/user_model.dart';

final FirebaseAuth fAuth = FirebaseAuth.instance;
User? currentFirebaseUser;
UserModel? userModelCurrentInfo;
List dList = []; //online-active drivers Information List
DirectionDetailsInfo? tripDrictionDetailsInfo;

String? choosenDriverId = "";
String userDropOffAddress = "";
String cloudMessagingServerToken =
    "key=AAAAWe4yFm0:APA91bGe_urQENVtiQS1NAvJcaczA17PBdwCYXS1_Txsir7xlm69tEZq-SPDloVM8qYLVfZG5lO_L0jMd-LFds8qP7-U0nOy_vqxUK3Hl-ttCTglXrwIKpDeFwoChzm8t2_MYFlBhIv1";

String driverCarDetails="";
String driverName="";
String driverPhone="";
double countRatingStars=0.0;
String titleStarsRating="";
