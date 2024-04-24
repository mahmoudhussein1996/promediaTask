class ResultModel {
  late final String errorMessage;
  late final int errorNumber;

  ResultModel.fromJson(Map<String, dynamic> json) {
    errorMessage = json["ErrMsg"] ?? "";
    errorNumber = json["ErrNo"] ?? -1;
  }
}
