import 'package:namazapp/features/namaz/data/models/namaz-rakaat.model.dart';

abstract class BaseNamaz {
  String title;
  String type;
  String gender;
  List<NamazRakaatModel> rakaats;
}
