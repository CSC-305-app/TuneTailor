import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class SendEmailCall {
  static Future<ApiCallResponse> call({
    String? to = '',
    String? subject = '',
    String? text = '',
  }) async {
    final ffApiRequestBody = '''
{
  "to": "$to",
  "subject": "$subject",
  "text": "$text"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Send Email',
      apiUrl: 'https://sendemailtouser-ww3afd5vfq-uc.a.run.app',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EmailsendCall {
  static Future<ApiCallResponse> call({
    String? to = '',
    String? subject = '',
    String? text = '',
  }) async {
    final ffApiRequestBody = '''
{
  "to": "${escapeStringForJson(to)}",
  "subject": "${escapeStringForJson(subject)}",
  "text": "${escapeStringForJson(text)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'emailsend',
      apiUrl: 'https://sendemailtouser-ww3afd5vfq-uc.a.run.app',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SpotifyAccessTokenCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'spotifyAccessToken',
      apiUrl: 'https://accounts.spotify.com/api/token',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {
        'client_id': "7f50af207dce4ca4939794d677bd4316",
        'client_secret': "f2ac98b426d943a08709a128f3bffc3d",
        'grant_type': "client_credentials",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? accessToken(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.access_token''',
      ));
}

class GetArtistInfoCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
    String? artistName = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getArtistInfo',
      apiUrl: 'https://api.spotify.com/v1/search',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'application/json',
      },
      params: {
        'q': "artist:$artistName",
        'type': "artist",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? artistItems(dynamic response) => getJsonField(
        response,
        r'''$.artists.items''',
        true,
      ) as List?;
  static List? artistItemImages(dynamic response) => getJsonField(
        response,
        r'''$.artists.items[:].images''',
        true,
      ) as List?;
  static List<String>? artistItemImagesUrls(dynamic response) => (getJsonField(
        response,
        r'''$.artists.items[:].images[:].url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? artistItemNames(dynamic response) => (getJsonField(
        response,
        r'''$.artists.items[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? artistItemPopularity(dynamic response) => (getJsonField(
        response,
        r'''$.artists.items[:].popularity''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? artistItemImagesHeight(dynamic response) => (getJsonField(
        response,
        r'''$.artists.items[:].images[:].height''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? artistItemImagesWidth(dynamic response) => (getJsonField(
        response,
        r'''$.artists.items[:].images[:].width''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? artistItemSpotifyID(dynamic response) => (getJsonField(
        response,
        r'''$.artists.items[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? artistItemGenres(dynamic response) => getJsonField(
        response,
        r'''$.artists.items[:].genres''',
        true,
      ) as List?;
  static dynamic artists(dynamic response) => getJsonField(
        response,
        r'''$.artists''',
      );
}

class GetTrackInfoCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
    String? trackName = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getTrackInfo',
      apiUrl: 'https://api.spotify.com/v1/search',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'application/json',
      },
      params: {
        'q': "track:$trackName",
        'type': "track",
        'limit': "10",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? album(dynamic response) => getJsonField(
        response,
        r'''$.tracks.items[:].album''',
        true,
      ) as List?;
  static List? artist(dynamic response) => getJsonField(
        response,
        r'''$.tracks.items[:].artists''',
        true,
      ) as List?;
  static List<String>? trackImageURL(dynamic response) => (getJsonField(
        response,
        r'''$.tracks.items[:].album.images[:].url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? albumName(dynamic response) => (getJsonField(
        response,
        r'''$.tracks.items[:].album.name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? trackURI(dynamic response) => (getJsonField(
        response,
        r'''$.tracks.items[:].uri''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? songName(dynamic response) => (getJsonField(
        response,
        r'''$.tracks.items[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? artisthref(dynamic response) => (getJsonField(
        response,
        r'''$.tracks.items[:].artists[:].href''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? artistID(dynamic response) => (getJsonField(
        response,
        r'''$.tracks.items[:].artists[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? artistName(dynamic response) => (getJsonField(
        response,
        r'''$.tracks.items[:].artists[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? trackDuration(dynamic response) => (getJsonField(
        response,
        r'''$.tracks.items[:].duration_ms''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? trackPopularity(dynamic response) => (getJsonField(
        response,
        r'''$.tracks.items[:].popularity''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? trackType(dynamic response) => (getJsonField(
        response,
        r'''$.tracks.items[:].type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<bool>? trackExplicitBool(dynamic response) => (getJsonField(
        response,
        r'''$.tracks.items[:].explicit''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
}

class GetArtistImageCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
    String? artistName = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getArtistImage',
      apiUrl: 'https://api.spotify.com/v1/search',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'application/json',
      },
      params: {
        'q': "artist:$artistName",
        'type': "artist",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? artistItems(dynamic response) => getJsonField(
        response,
        r'''$.artists.items''',
        true,
      ) as List?;
  static List? artistItemImages(dynamic response) => getJsonField(
        response,
        r'''$.artists.items[:].images''',
        true,
      ) as List?;
  static List<String>? artistItemImagesUrls(dynamic response) => (getJsonField(
        response,
        r'''$.artists.items[:].images[:].url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? artistItemNames(dynamic response) => (getJsonField(
        response,
        r'''$.artists.items[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? artistItemPopularity(dynamic response) => (getJsonField(
        response,
        r'''$.artists.items[:].popularity''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? artistItemImagesHeight(dynamic response) => (getJsonField(
        response,
        r'''$.artists.items[:].images[:].height''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? artistItemImagesWidth(dynamic response) => (getJsonField(
        response,
        r'''$.artists.items[:].images[:].width''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? artistItemSpotifyID(dynamic response) => (getJsonField(
        response,
        r'''$.artists.items[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? artistItemGenres(dynamic response) => getJsonField(
        response,
        r'''$.artists.items[:].genres''',
        true,
      ) as List?;
  static dynamic artists(dynamic response) => getJsonField(
        response,
        r'''$.artists''',
      );
}

class GetSingleArtistJSONCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
    String? id = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getSingleArtistJSON',
      apiUrl: 'https://api.spotify.com/v1/artists/$id',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? singleArtistImageURL(dynamic response) => (getJsonField(
        response,
        r'''$.images[:].url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? singleArtistName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.name''',
      ));
  static List<String>? singleArtistGenres(dynamic response) => (getJsonField(
        response,
        r'''$.genres''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? singleArtistID(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
  static int? singleArtistPop(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.popularity''',
      ));
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

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}