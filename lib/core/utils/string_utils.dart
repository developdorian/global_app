class StringUtils {
  
  StringUtils._();

  /// Capitalize the first letter of a string and convert the rest to lowercase
  /// 
  /// Example:
  /// ```dart
  /// StringUtils.capitalize('pepe'); // 'Pepe'
  /// StringUtils.capitalize('PEPE'); // 'Pepe'
  /// StringUtils.capitalize(''); // ''
  /// ```
  static String capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }

  /// Capitalize the first letter of a string, keeping the rest unchanged
  /// 
  /// Example:
  /// ```dart
  /// StringUtils.capitalizeFirst('pepe'); // 'Pepe'
  /// StringUtils.capitalizeFirst('pepe GARCÍA'); // 'Pepe GARCÍA'
  /// ```
  static String capitalizeFirst(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }

  /// Convert a string to Title Case (each word capitalized)
  /// 
  /// Example:
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

  /// Check if a string is null or empty
  /// 
  /// Example:
  /// ```dart
  /// StringUtils.isNullOrEmpty(''); // true
  /// StringUtils.isNullOrEmpty('   '); // true
  /// StringUtils.isNullOrEmpty('texto'); // false
  /// ```
  static bool isNullOrEmpty(String? text) {
    return text == null || text.trim().isEmpty;
  }
  
  /// Formatea un número para que tenga al menos 3 dígitos, agregando ceros a la izquierda si es necesario
  /// 
  /// Ejemplo:
  /// ```dart
  /// StringUtils.formatNumber(1); // '001'
  /// StringUtils.formatNumber(12); // '012'
  /// StringUtils.formatNumber(123); // '123'
  /// ```
  static String formatNumber(int number) {
    return number.toString().padLeft(3, '0');
  } 

}