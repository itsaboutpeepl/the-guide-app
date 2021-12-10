import 'package:youtube_explode_dart/youtube_explode_dart.dart';

String? convertUrlToId(String url, {bool trimWhitespaces = true}) {
  assert(url.isNotEmpty, 'Url cannot be empty');
  String _url;
  if (!url.contains('http') && (url.length == 11)) return url;
  if (trimWhitespaces) {
    _url = url.trim();
  } else {
    _url = url;
  }

  for (final exp in [
    RegExp(
        r'^https:\/\/(?:www\.|m\.)?youtube\.com\/watch\?v=([_\-a-zA-Z0-9]{11}).*$'),
    RegExp(
        r'^https:\/\/(?:www\.|m\.)?youtube(?:-nocookie)?\.com\/embed\/([_\-a-zA-Z0-9]{11}).*$'),
    RegExp(r'^https:\/\/youtu\.be\/([_\-a-zA-Z0-9]{11}).*$')
  ]) {
    final RegExpMatch? match = exp.firstMatch(_url);
    if (match != null && match.groupCount >= 1) return match.group(1);
  }

  return null;
}

Future<String> extractVideoUrl(String youtubeUrl) async {
  final extractor = YoutubeExplode();
  final videoId = convertUrlToId(youtubeUrl);
  final streamManifest =
      await extractor.videos.streamsClient.getManifest(videoId);
  final streamInfo = streamManifest.muxed.withHighestBitrate();
  extractor.close();
  return streamInfo.url.toString();
}
