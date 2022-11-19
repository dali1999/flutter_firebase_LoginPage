import 'package:flutter/foundation.dart';

class JoinOrLogin extends ChangeNotifier{
   bool _isJoin = false; //기본값은 join 이 아니라 login

   bool get isJoin => _isJoin;

   void toggle(){
     _isJoin = !_isJoin; //누를떄마다 상태 변경
     notifyListeners();
   }
}