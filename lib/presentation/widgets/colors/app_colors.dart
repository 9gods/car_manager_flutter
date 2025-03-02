import 'package:flutter/material.dart';

class AppColors {
  // Cores Slate
  static const Color slate200 = Color(0xFFE2E8F0);
  static const Color slate300 = Color(0xFFCBD5E1);
  static const Color slate500 = Color(0xFF64748B);
  static const Color slate700 = Color(0xFF334155);
  static const Color slate800 = Color(0xFF1E293B);
  static const Color slate900 = Color(0xFF0F172A);

  // Definindo a cor personalizada para o gradiente (não estava na lista, mas foi utilizada nos gradientes)
  static const Color customGradientColor = Color(0xFF475569);

  // Gradiente 1: do slate700 (#334155) para a cor custom (#475569)
  static const LinearGradient gradient1 = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [slate700, customGradientColor],
  );

  // Gradiente 2: do custom (#475569) para o slate700 (#334155)
  static const LinearGradient gradient2 = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [customGradientColor, slate700],
  );
}
