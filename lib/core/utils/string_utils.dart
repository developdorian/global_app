class StringUtils {
  
  StringUtils._();

  /// Capitaliza la primera letra de un string y convierte el resto a minúsculas
  /// 
  /// Ejemplo:
  /// ```dart
  /// StringUtils.capitalize('pepe'); // 'Pepe'
  /// StringUtils.capitalize('PEPE'); // 'Pepe'
  /// StringUtils.capitalize(''); // ''
  /// ```
  static String capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }

  /// Capitaliza solo la primera letra, manteniendo el resto sin cambios
  /// 
  /// Ejemplo:
  /// ```dart
  /// StringUtils.capitalizeFirst('pepe'); // 'Pepe'
  /// StringUtils.capitalizeFirst('pepe GARCÍA'); // 'Pepe GARCÍA'
  /// ```
  static String capitalizeFirst(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }

  /// Convierte un string a Title Case (cada palabra capitalizada)
  /// 
  /// Ejemplo:
  /// ```dart
  /// StringUtils.toTitleCase('pepe garcía lópez'); // 'Pepe García López'
  /// StringUtils.toTitleCase('hola mundo'); // 'Hola Mundo'
  /// ```
  static String toTitleCase(String text) {
    if (text.isEmpty) return text;
    
    return text.split(' ').map((word) {
      if (word.isEmpty) return word;
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }).join(' ');
  }

  /// Verifica si un string está vacío o solo contiene espacios en blanco
  /// 
  /// Ejemplo:
  /// ```dart
  /// StringUtils.isNullOrEmpty(''); // true
  /// StringUtils.isNullOrEmpty('   '); // true
  /// StringUtils.isNullOrEmpty('texto'); // false
  /// ```
  static bool isNullOrEmpty(String? text) {
    return text == null || text.trim().isEmpty;
  }

}