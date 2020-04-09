class FormError {
  final String code;
  final String message;
  final String filed;
  final String key;

  FormError({
    this.code = "",
    this.message = "",
    this.filed = "",
    this.key = "",
  });
  FormError copyWith({String code, String message, String filed, String key}) {
    return FormError(
      key: key ?? this.key,
      code: code ?? this.code,
      message: message ?? this.message,
      filed: filed ?? this.filed,
    );
  }

  @override
  String toString() {
    // TODO: implement toString
    return "Error code: $code in $filed";
  }
}
