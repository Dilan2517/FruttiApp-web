import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static const _kRecordar = 'recordarUsuario';
  static const _kUsuario = 'usuarioRecordado';

  static Future<void> guardarUsuario(String usuario) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kRecordar, true);
    await prefs.setString(_kUsuario, usuario);
  }

  static Future<void> olvidarUsuario() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kRecordar, false);
    await prefs.remove(_kUsuario);
  }

  static Future<String?> obtenerUsuarioRecordado() async {
    final prefs = await SharedPreferences.getInstance();
    final recordar = prefs.getBool(_kRecordar) ?? false;
    if (!recordar) return null;
    return prefs.getString(_kUsuario);
  }
}