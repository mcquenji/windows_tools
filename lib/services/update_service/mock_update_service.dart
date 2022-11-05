part of windows_tools_engine;

/// Mock update service.
///
/// Pretends to check for updates and install them but does nothing.
///
/// Used for ui testing.
class MockUpdateService extends IUpdateService {
  /// Used for randomizing the update check.
  final rand = Random();

  @override
  checkForUpdates(currentVersion) async {
    await Future.delayed(Duration(seconds: rand.nextInt(5)));

    var major = rand.nextInt(10);
    var minor = rand.nextInt(10);
    var patch = rand.nextInt(30);

    var updateAvailable = rand.nextBool();

    var version = updateAvailable ? '$major.$minor.$patch' : null;
    var url = updateAvailable ? 'https://example.com/$version' : null;
    var releaseName = updateAvailable ? 'Beta v$version' : null;

    var error = rand.nextBool() && !updateAvailable;

    var errorMessage = error ? 'Random error lol' : null;

    var patchNotes = '''
# Features

Added:
  - Random feature
  - Another random feature
  - Yet another random feature

# Bug fixes

Fixed the following bugs:

  - Random bug
  - Another random bug
  - Yet another random bug

[Full changelog](https://example.com/changelog)
''';

    return UpdateInfo(
      latestVersion: version,
      downloadUrl: url,
      releaseName: releaseName,
      errorMessage: errorMessage,
      updateAvailable: updateAvailable,
      patchNotes: error ? null : patchNotes,
      lastChecked: DateTime.now(),
      releaseDate: error ? null : DateTime.now(),
    );
  }

  @override
  installUpdate(info, update, done) async {
    if (!info.updateAvailable || info.installing) return;

    update(info.copyWith(installProgress: 0.0));

    if (rand.nextBool()) {
      return update(info.copyWith(errorMessage: 'Random error lol', installProgress: null));
    }

    for (var i = 0; i < 100; i++) {
      await Future.delayed(Duration(milliseconds: rand.nextInt(100)));

      update(info.copyWith(installProgress: i.toDouble()));
    }

    await Future.delayed(Duration(milliseconds: rand.nextInt(500)));

    done(info.copyWith(installProgress: null, updateAvailable: false, errorMessage: null));
  }
}
