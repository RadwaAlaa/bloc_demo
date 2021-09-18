

class Character {
  late int charId;
  late String name;
 late String birthday;
 late List<String> occupation;
 late String img;
 late String status;
 late String nickname;
 late List<int> appearance;
 late String portrayed;
 late String category;
 late List<int> betterCallSaulAppearance;

 
  Character.fromJson(Map<String, dynamic> json) {
    charId = json['char_id'];
    name = json['name'];
    birthday = json['birthday'];
    occupation = json['occupation'].cast<String>();
    img = json['img'];
    status = json['status'];
    nickname = json['nickname'];
    appearance = json['appearance'].cast<int>();
    portrayed = json['portrayed'];
    category = json['category'];
   betterCallSaulAppearance = json['better_call_saul_appearance'].cast<int>();
      }
    
  

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['char_id'] = this.charId;
  //   data['name'] = this.name;
  //   data['birthday'] = this.birthday;
  //   data['occupation'] = this.occupation;
  //   data['img'] = this.img;
  //   data['status'] = this.status;
  //   data['nickname'] = this.nickname;
  //   data['appearance'] = this.appearance;
  //   data['portrayed'] = this.portrayed;
  //   data['category'] = this.category;
  //   if (this.betterCallSaulAppearance != null) {
  //     data['better_call_saul_appearance'] =
  //         this.betterCallSaulAppearance.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}

