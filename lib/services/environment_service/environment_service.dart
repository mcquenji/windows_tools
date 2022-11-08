part of windows_tools_engine;

/// The registry key that contains the environment variables for the current user.
RegistryKey get userReg => Registry.openPath(RegistryHive.currentUser, path: 'Environment', desiredAccessRights: AccessRights.allAccess);

/// The registry key that contains the environment variables for all users.
RegistryKey get machineReg => Registry.openPath(RegistryHive.localMachine, path: 'System\\CurrentControlSet\\Control\\Session Manager\\Environment', desiredAccessRights: AccessRights.allAccess);

/// Manages environment variables.
class EnvironmentService extends IEnvironmentService {
  @override
  getEnvironmentVariables() {
    final variables = <EnvironmentVariable>[];

    for (final variable in userReg.values) {
      variables.add(_extractVariable(variable, EnvironmentVariableContext.user));
    }

    for (final variable in machineReg.values) {
      variables.add(_extractVariable(variable, EnvironmentVariableContext.machine));
    }

    return variables;
  }

  EnvironmentVariable _extractVariable(RegistryValue reg, EnvironmentVariableContext context) {
    final values = reg.data.toString().split(';');

    final entries = <EnvironmentEntry>[];

    for (final value in values) {
      // ignore empty values

      if (value.isEmpty) continue;

      entries.add(EnvironmentEntry(value: value, enabled: true, parent: "${reg.name}@$context"));
    }

    return EnvironmentVariable(name: reg.name, entries: entries, context: context);
  }

  @override
  setEnvironmentVariable(variable) {
    final entries = variable.entries.where((e) => e.enabled).map((e) => e.value).join(';');

    var value = RegistryValue(variable.name, RegistryValueType.string, entries);

    variable.context.reg.createValue(value);

    log("Set environment variable '${variable.name}' to '$entries'");
  }
}
