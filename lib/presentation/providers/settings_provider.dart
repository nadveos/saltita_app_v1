import 'package:flutter_riverpod/legacy.dart';

class SettingsState {
  final bool isDark;
  final bool isBiometricEnabled;
  final bool isHighContrast;

  SettingsState({
    this.isDark = false,
    this.isBiometricEnabled = false,
    this.isHighContrast = false,
  });

  SettingsState copyWith({
    bool? isDark,
    bool? isBiometricEnabled,
    bool? isHighContrast,
  }) {
    return SettingsState(
      isDark: isDark ?? this.isDark,
      isBiometricEnabled: isBiometricEnabled ?? this.isBiometricEnabled,
      isHighContrast: isHighContrast ?? this.isHighContrast,
    );
  }
}

class SettingsNotifier extends StateNotifier<SettingsState> {
  SettingsNotifier() : super(SettingsState());

  void toggleTheme(bool value) {
    state = state.copyWith(isDark: value);
  }

  void toggleBiometric(bool value) {
    state = state.copyWith(isBiometricEnabled: value);
  }

  void toggleHighContrast(bool value) {
    state = state.copyWith(isHighContrast: value);
  }
}

final settingsProvider = StateNotifierProvider<SettingsNotifier, SettingsState>((ref) {
  return SettingsNotifier();
});
