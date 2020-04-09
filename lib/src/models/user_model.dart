import 'package:location/src/validations/errors_validation.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../serializers/serializers.dart';
import './model.dart';
part 'user_model.g.dart';

abstract class User with BaseModel implements Built<User, UserBuilder> {
  static Serializer<User> get serializer => _$userSerializer;

  @nullable
  String get id;
  @nullable
  String get username;
  @nullable
  String get phone;
  @nullable
  String get email;
  @nullable
  String get avatar;
  @nullable
  String get name;

  User._();
  factory User([updates(UserBuilder b)]) = _$User;

  Map<String, dynamic> toJson() {
    return standardSerializers.serialize(this,
        specifiedType: const FullType(User));
  }

  factory User.parseFirebase(dynamic doc) {
    User docWithoutDocumentID =
        standardSerializers.deserializeWith<User>(User.serializer, doc.data);
    //As the document ID is not in the Map, but an attribute of the Document I'll have to add it manually. Any way to fix this?
    var dockWithDocID =
        docWithoutDocumentID.rebuild((b) => b..id = doc.documentID);

    assert(dockWithDocID.id != null);
    return dockWithDocID;
  }
  FormError validate() {
    print("WHAT IS THIS? " + this.toString());
    if (this.email.length > 3) {
      return FormError(key: 'email', message: 'Email is to long');
    }
  }
}
