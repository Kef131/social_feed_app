import 'package:flutter/material.dart';

/// Semantic color tokens
abstract final class AppColors {
  // Palette
  static const Color _indigo900    = Color(0xFF1A1A2E);
  static const Color _indigo700    = Color(0xFF16213E);
  static const Color _indigo500    = Color(0xFF0F3460);
  static const Color _violet400    = Color(0xFF7C3AED);
  static const Color _violet300    = Color(0xFF9D5CF6);
  static const Color _violet100    = Color(0xFFEDE9FE);
  static const Color _rose500      = Color(0xFFF43F5E);
  static const Color _amber400     = Color(0xFFFBBF24);
  static const Color _slate50      = Color(0xFFF8FAFC);
  static const Color _slate200     = Color(0xFFE2E8F0);
  static const Color _slate400     = Color(0xFF94A3B8);
  static const Color _slate800     = Color(0xFF1E293B);
  static const Color _white        = Color(0xFFFFFFFF);

  // Semantic
  // Light scheme

  static const Color seedColor        = _violet400;

  static const Color lightSurface     = _slate50;
  static const Color lightBackground  = _white;
  static const Color lightOnSurface   = _slate800;
  static const Color lightSubtext     = _slate400;
  static const Color lightDivider     = _slate200;

  //Dark scheme

  static const Color darkSurface      = _indigo900;
  static const Color darkBackground   = _indigo700;
  static const Color darkCard         = _indigo500;
  static const Color darkOnSurface    = _slate50;
  static const Color darkSubtext      = _slate400;

  // Shared

  static const Color primary          = _violet400;
  static const Color primaryVariant   = _violet300;
  static const Color primaryContainer = _violet100;
  static const Color error            = _rose500;
  static const Color warning          = _amber400;

  //  Liquid Glass

  static const Color glassLight = Color(0xCCFFFFFF);
  static const Color glassDark  = Color(0x661A1A2E);
  static const Color glassBorder = Color(0x33FFFFFF);
}