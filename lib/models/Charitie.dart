import 'package:hive/hive.dart';

part 'Charitie.g.dart';

@HiveType(typeId: 0)
class Charitie {
  @HiveField(0)
  final String? name;
  @HiveField(1)
  final String? phoneNum;
  @HiveField(2)
  final String? instapay;
  @HiveField(3)
  final String? bankAccount;
  @HiveField(4)
  final String? hotline;
  @HiveField(5)
  final String? image;

  Charitie(
      {this.name,
      this.phoneNum,
      this.instapay,
      this.bankAccount,
      this.hotline,
      this.image});

  List<Charitie> addCharities() {
    final List<Charitie> charitie = [];

    charitie.add(Charitie(
        name: "الهلال الاحمر",
        phoneNum: '0123456789',
        instapay: 'RedCrescent@instapay',
        bankAccount: '1234567891234564',
        hotline: '0682047287',
        image: 'assets/الهلال الاحمر.png'));

    charitie.add(Charitie(
        name: "بنك الطعام",
        phoneNum: '01123597559',
        instapay: 'FoodBank@instapay',
        bankAccount: '8965156123542315',
        hotline: '0682011900',
        image: 'assets/بنك الطعام.jpeg'));

    charitie.add(Charitie(
        name: "جمعيه الاورمان",
        phoneNum: '01123597559',
        instapay: 'OrmanAssociation@instapay',
        bankAccount: '5457546456545554',
        hotline: '0881234565',
        image: 'assets/جمعيه الاورمان.jpeg'));

    charitie.add(Charitie(
        name: "جمعيه رساله",
        phoneNum: '01045678932',
        instapay: 'ResalaAssociation@instapay',
        bankAccount: '8845661565164558',
        hotline: '0682011900',
        image: 'assets/جمعيه رساله.jpeg'));

    charitie.add(Charitie(
        name: "الاتحاد الوطني",
        phoneNum: '01555956596',
        instapay: 'ResalaAssociation@instapay',
        bankAccount: '8845661565164558',
        hotline: '0682011900',
        image: 'assets/الاتحاد الوطني.jpeg'));

    charitie.add(Charitie(
        name: "الهلال الاحمر",
        phoneNum: '0123456789',
        instapay: 'RedCrescent@instapay',
        bankAccount: '1234567891234564',
        hotline: '0682047287',
        image: 'assets/الهلال الاحمر.png'));

    charitie.add(Charitie(
        name: "بنك الطعام",
        phoneNum: '01123597559',
        instapay: 'FoodBank@instapay',
        bankAccount: '8965156123542315',
        hotline: '0682011900',
        image: 'assets/بنك الطعام.jpeg'));

    charitie.add(Charitie(
        name: "جمعيه الاورمان",
        phoneNum: '01123597559',
        instapay: 'OrmanAssociation@instapay',
        bankAccount: '5457546456545554',
        hotline: '0881234565',
        image: 'assets/جمعيه الاورمان.jpeg'));

    charitie.add(Charitie(
        name: "جمعيه رساله",
        phoneNum: '01045678932',
        instapay: 'ResalaAssociation@instapay',
        bankAccount: '8845661565164558',
        hotline: '0682011900',
        image: 'assets/جمعيه رساله.jpeg'));

    charitie.add(Charitie(
        name: "الاتحاد الوطني",
        phoneNum: '01555956596',
        instapay: 'ResalaAssociation@instapay',
        bankAccount: '8845661565164558',
        hotline: '0682011900',
        image: 'assets/الاتحاد الوطني.jpeg'));

    return charitie;
  }

  Future<void> saveDataOnce(List<Charitie> charitie) async {
    final box = await Hive.openBox('model');
    for (int i = 0; i < charitie.length; i++) {
      if (!box.containsKey('charitie${i + 1}')) {
        box.put('charitie${i + 1}', charitie[i]);
      }
    }
  }

  Future<List<Charitie>> readData() async {
    final box = await Hive.openBox('model');
    List<Charitie> charitie = [];
    for (int i = 0; i < box.length; i++) {
      charitie.add(box.get('charitie${i + 1}'));
    }
    return charitie;
  }
}
