import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

List<dynamic>? parseImages(dynamic artistsJson) {
  // Validate the structure of the input JSON
  if (artistsJson == null ||
      !(artistsJson is Map) ||
      !artistsJson.containsKey('artists') ||
      !artistsJson['artists'].containsKey('items')) {
    return null; // Return null if the input structure is invalid
  }

  // Extract the list of artist items
  List<dynamic>? artistItems = artistsJson['artists']['items'];

  if (artistItems == null) return null;

  // Loop through each artist and keep only the first image
  for (var artist in artistItems) {
    if (artist is Map &&
        artist.containsKey('images') &&
        artist['images'] is List &&
        artist['images'].isNotEmpty) {
      // Keep only the first image
      artist['images'] = [artist['images'][0]];
    }
  }

  // Return the modified JSON object as a list of artists
  return artistItems;
}

dynamic convertToJSON(List<String>? parsedImages) {
  if (parsedImages == null || parsedImages.isEmpty) {
    return null; // Return null if input is invalid
  }

  try {
    // Convert the List<String> to JSON string
    return jsonEncode(parsedImages);
  } catch (e) {
    // Handle potential errors during encoding
    print('Error converting to JSON: $e');
    return null;
  }
}

String? getFirstImageUrl(dynamic artistJson) {
// Check if the input JSON is valid and contains the `images` field
  if (artistJson == null ||
      !artistJson.containsKey('images') ||
      artistJson['images'] == null ||
      artistJson['images'] is! List ||
      artistJson['images'].isEmpty) {
    return null; // Return null if the input is invalid or `images` is empty
  }

  // Get the first image URL from the `images` array
  var firstImage = artistJson['images'][0];
  if (firstImage.containsKey('url')) {
    return firstImage['url']; // Return the URL of the first image
  }

  return null; // Return null if no URL is found
}

List<String>? extractFirstTrackImages(dynamic tracksJson) {
  /// Validate the input JSON structure
  if (tracksJson == null ||
      !(tracksJson is Map) ||
      !tracksJson.containsKey('tracks') ||
      !tracksJson['tracks'].containsKey('items')) {
    return null; // Return null if the input JSON structure is invalid
  }

  // Extract the list of track items
  List<dynamic>? trackItems = tracksJson['tracks']['items'];
  if (trackItems == null) return null;

  // Initialize a list to store the first image URLs
  List<String> imageUrls = [];

  // Loop through each track and extract the first image URL
  for (var track in trackItems) {
    if (track is Map &&
        track.containsKey('album') &&
        track['album'] is Map &&
        track['album'].containsKey('images') &&
        track['album']['images'] is List &&
        track['album']['images'].isNotEmpty) {
      // Extract the first image URL
      String imageUrl = track['album']['images'][0]['url'];
      imageUrls.add(imageUrl);
    }
  }

  // Return the list of image URLs
  return imageUrls;
}

dynamic updateJsonWithFirstImage(dynamic artistJson) {
  // Check if the input JSON is valid and contains the `images` field
  if (artistJson == null ||
      !artistJson.containsKey('images') ||
      artistJson['images'] == null ||
      artistJson['images'] is! List ||
      artistJson['images'].isEmpty) {
    return artistJson; // Return the original JSON if the input is invalid or `images` is empty
  }

  // Extract the first image from the `images` array
  var firstImage = artistJson['images'][0];

  // Update the JSON to keep only the first image
  artistJson['images'] = [firstImage];

  return artistJson; // Return the updated JSON object
}

List<dynamic> parseTracks(dynamic tracksJson) {
  // Validate the structure of the input JSON
  if (tracksJson == null ||
      !(tracksJson is Map) ||
      !tracksJson.containsKey('tracks') ||
      !tracksJson['tracks'].containsKey('items')) {
    return []; // Return an empty list if the input structure is invalid
  }

  // Extract the list of track items
  List<dynamic>? trackItems = tracksJson['tracks']['items'];
  if (trackItems == null) return [];

  // Initialize a list to hold parsed track information
  List<dynamic> parsedTracks = [];

  // Loop through each track and extract relevant information
  for (var track in trackItems) {
    if (track is Map) {
      // Extract track name
      String? trackName = track['name'];

      // Extract artist names
      List<dynamic>? artists = track['artists'];
      List<String> artistNames = [];
      if (artists != null) {
        for (var artist in artists) {
          if (artist is Map && artist.containsKey('name')) {
            artistNames.add(artist['name']);
          }
        }
      }

      // Extract album image (if available)
      String? albumImageUrl;
      if (track.containsKey('album') &&
          track['album'] is Map &&
          track['album'].containsKey('images') &&
          track['album']['images'] is List &&
          track['album']['images'].isNotEmpty) {
        albumImageUrl = track['album']['images'][0]['url'];
      }

      // Add the parsed track information to the list sequentially
      parsedTracks.add(trackName ?? "Unknown Track");
      parsedTracks.add(artistNames);
      parsedTracks.add(albumImageUrl ?? "No Image");
    }
  }

  // Return the parsed tracks as a flat list
  return parsedTracks;
}

int convertMsToSeconds(int milliseconds) {
  return (milliseconds / 1000).floor();
}

String formatSecondsToMinutes(int seconds) {
  int minutes = seconds ~/ 60; // Integer division to get minutes
  int remainingSeconds = seconds % 60; // Modulus to get remaining seconds
  return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}'; // Format as mm:ss
}

dynamic createTrackJson(
  String trackName,
  String trackArtist,
  String trackDuration,
  String trackCoverImage,
  bool trackExplicit,
  int trackPopularity,
) {
  // Create the JSON object with the given arguments
  Map<String, dynamic> trackJson = {
    "trackName": trackName,
    "trackArtist": trackArtist,
    "trackDuration": trackDuration,
    "trackCoverImage": trackCoverImage,
    "trackExplicit": trackExplicit,
    "trackPopularity": trackPopularity,
  };

  // Return the JSON object
  return trackJson;
}
