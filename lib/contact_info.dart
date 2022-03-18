
class ContactInfo{
  String name;
  String number;
  String email;
  ContactInfo(this.name, this.number, this.email);

  ContactInfo.fromJson(Map<String, dynamic> json):
      name = json['name'],
      email = json['email'],
      number = json['username'];

  Map<String, dynamic> toJson()=> {
    'name' : name,
    'email' : email,
    'number' : number,
  } ;
}