part of windows_tools_engine;

/// Update service using GitHub.
class GithubUpdateService extends IUpdateService {
  static const _url = 'https://api.github.com/repos/necodeIT/windows_tools/releases/latest';

  @override
  checkForUpdates(currentVersion) async {
    var response = await http.get(Uri.parse(_url));

    if (response.statusCode != 200) {
      return UpdateInfo(
        errorMessage: 'Failed to check for updates',
      );
    }

    var json = jsonDecode(response.body);

    var latestVersion = json['tag_name'] as String;
    var downloadUrl = json['assets'][0]['browser_download_url'] as String;

    var updateAvailable = latestVersion != currentVersion;

    // get patch notes
    var patchNotes = json['body'] as String;

    return UpdateInfo(
      latestVersion: latestVersion,
      downloadUrl: downloadUrl,
      updateAvailable: updateAvailable,
      lastChecked: DateTime.now(),
      patchNotes: patchNotes,
    );
  }

  @override
  installUpdate(info, update, done) async {
    if (!info.updateAvailable || info.installing) return;

    update(info.copyWith(installProgress: 0.0));

    // get temp dir

    var tempDir = await getTemporaryDirectory();

    // create temp file

    var tempFile = File('${tempDir.path}/windows_tools_installer.exe');

    // use dio to download Windows.Tools.Setup.exe

    var dio = Dio();

    var response = await dio.download(info.downloadUrl!, tempFile.path, onReceiveProgress: (received, total) {
      update(info.copyWith(installProgress: received / total * 100));
    });

    if (response.statusCode != 200) {
      return update(info.copyWith(errorMessage: 'Failed to download update', installProgress: null));
    }

    // check if file exists

    if (!await tempFile.exists()) {
      return update(info.copyWith(errorMessage: 'Failed to download update', installProgress: null));
    }

    // run installer

    done(info.copyWith(installProgress: null, updateAvailable: false, errorMessage: null));

    await Process.start(tempFile.path, []);

    // exit app

    exit(0);
  }
}
