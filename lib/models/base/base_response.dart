class BaseResponse {
  bool? success;
  String? errors;
  String? errorCodes;
  String? messages;
  String? messageCodes;
  dynamic jsonResult;

  BaseResponse.fromJson(Map<String, dynamic> data) {
    success = data['success'];
    errors = data['errors'];
    errorCodes = data['errorCodes'];
    messages = data['messages'];
    messageCodes = data['messageCodes'];
    jsonResult = data['jsonResult'];
  }
}
