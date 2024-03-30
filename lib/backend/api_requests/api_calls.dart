import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class LogInCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "$email",
  "password": "$password"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Log In',
      apiUrl: 'https://api.vnaverp.eu/auth-service/auth/partner/login',
      callType: ApiCallType.POST,
      headers: {
        'Signature': 'ed7d8726-cf10-4d50-8614-150a3f8d5f53',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? jwtToken(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.token''',
      ));
  static String? firstName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.firstName''',
      ));
  static String? lastName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.lastName''',
      ));
  static String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.email''',
      ));
  static String? companyId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.companyId''',
      ));
  static String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
}

class GetTrainingsCall {
  static Future<ApiCallResponse> call({
    String? jwtToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Trainings',
      apiUrl:
          'https://api.vnaverp.eu/helpdesk-service/training/student/training',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $jwtToken',
        'Signature': 'ed7d8726-cf10-4d50-8614-150a3f8d5f53',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? lstTrainings(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      ) as List?;
}

class StudentDataCall {
  static Future<ApiCallResponse> call({
    String? jwtToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'StudentData',
      apiUrl: 'https://api.vnaverp.eu/helpdesk-service/training/student/',
      callType: ApiCallType.GET,
      headers: {
        'Signature': 'ed7d8726-cf10-4d50-8614-150a3f8d5f53',
        'Authorization': 'Bearer $jwtToken',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic studentData(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  static String? firstName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.F_STUDENT_FIRSTNAME''',
      ));
  static String? lastName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.F_STUDENT_LASTNAME''',
      ));
  static String? phone(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.F_STUDENT_PHONE''',
      ));
  static String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.F_STUDENT_EMAIL''',
      ));
  static String? idNumber(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.F_STUDENT_IDNUMBER''',
      ));
  static String? taxnr(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.F_STUDENT_TAXNR''',
      ));
  static String? sex(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.F_STUDENT_SEX''',
      ));
  static String? taj(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.F_STUDENT_TAJ''',
      ));
  static String? motherName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.F_STUDENT_MOTHERNAME''',
      ));
  static String? birthCountry(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.F_STUDENT_BIRTHCOUNTRY''',
      ));
  static String? birthPlace(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.F_STUDENT_BIRTHPLACE''',
      ));
  static String? birthName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.F_STUDENT_BIRTHNAME''',
      ));
  static String? citizenship(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.F_STUDENT_CITIZENSHIP''',
      ));
  static String? practicePlace(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.GYAKORLATI_HELY''',
      ));
  static dynamic address(dynamic response) => getJsonField(
        response,
        r'''$.data.F_STUDENT_ADDRESS''',
      );
  static dynamic postAddress(dynamic response) => getJsonField(
        response,
        r'''$.data.F_STUDENT_POSTADDR''',
      );
  static int? birthDate(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.F_STUDENT_BIRTHDATE''',
      ));
}

class PickListCall {
  static Future<ApiCallResponse> call({
    String? attrName = '',
    String? jwtToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'PickList',
      apiUrl:
          'https://api.vnaverp.eu/helpdesk-service/training/picklist/$attrName',
      callType: ApiCallType.GET,
      headers: {
        'Signature': 'ed7d8726-cf10-4d50-8614-150a3f8d5f53',
        'Authorization': 'Bearer $jwtToken',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? lstValues(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      ) as List?;
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}