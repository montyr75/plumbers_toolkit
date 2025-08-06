import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:tinycolor2/tinycolor2.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

final infinity = String.fromCharCode(0x221E);
const endash = '–';

extension NumberX on num {
  T bounded<T extends num>({T? min, T? max}) {
    assert(min != null || max != null);

    if (min != null) {
      if (max != null) {
        return math.min<T>(math.max<T>(this as T, min), max);
      } else {
        return math.max<T>(this as T, min);
      }
    } else if (max != null) {
      return math.min<T>(this as T, max);
    }

    return this as T;
  }

  /// These reverse the meaning of min/max. [min] means "restrict to minimum value", and vice versa.
  T minOf<T extends num>(T minimum) => math.max(this as T, minimum);
  T maxOf<T extends num>(T maximum) => math.min(this as T, maximum);
}

extension DoubleX on double {
  double roundToNearestFraction(int denominator) => (this * denominator).round() / denominator;

  /// Converts a double to a mixed number string (e.g., 2.5 becomes "2 1/2").
  ///
  /// [maxDenominator] specifies the maximum denominator to use when finding
  /// the fractional part, which helps in getting common fractions like 1/8, 1/16, etc.
  String toMixedNumber({int maxDenominator = 64}) {
    const epsilon = 1.0e-9;

    // Get the whole number part
    final int whole = truncate();

    // Get the fractional part
    final double fractionalPart = this - whole;

    // If there's no significant fractional part, return the whole number
    if (fractionalPart < epsilon) {
      return whole.toString();
    }

    // If the fractional part is almost 1, round up to the next whole number
    if (1 - fractionalPart < epsilon) {
      return (whole + 1).toString();
    }

    // Find the best rational approximation for the fractional part
    int bestN = 1;
    int bestD = 1;
    double minError = fractionalPart.abs();

    for (int d = 2; d <= maxDenominator; d++) {
      final int n = (fractionalPart * d).round();
      if (n == 0) continue;

      final double error = (fractionalPart - n / d).abs();

      if (error < minError) {
        minError = error;
        bestN = n;
        bestD = d;
      }
    }

    // Simplify the fraction using the greatest common divisor (GCD)
    int gcd(int a, int b) => b == 0 ? a : gcd(b, a % b);
    final commonDivisor = gcd(bestN, bestD);
    final numerator = bestN ~/ commonDivisor;
    final denominator = bestD ~/ commonDivisor;

    // If the simplified fraction is x/1, it means we rounded to a whole number
    if (denominator == 1) {
      return (whole + numerator).toString();
    }

    final fractionStr = '$numerator/$denominator';

    return whole == 0 ? fractionStr : '$whole $fractionStr';
  }

  (String whole, String fraction) toMixedNumberSeparated({int maxDenominator = 64}) {
    const epsilon = 1.0e-9;

    // Get the whole number part
    final int whole = truncate();

    // Get the fractional part
    final double fractionalPart = this - whole;

    // If there's no significant fractional part, return the whole number
    if (fractionalPart < epsilon) {
      return (whole.toString(), '');
    }

    // If the fractional part is almost 1, round up to the next whole number
    if (1 - fractionalPart < epsilon) {
      return ((whole + 1).toString(), '');
    }

    // Find the best rational approximation for the fractional part
    int bestN = 1;
    int bestD = 1;
    double minError = fractionalPart.abs();

    for (int d = 2; d <= maxDenominator; d++) {
      final int n = (fractionalPart * d).round();
      if (n == 0) continue;

      final double error = (fractionalPart - n / d).abs();

      if (error < minError) {
        minError = error;
        bestN = n;
        bestD = d;
      }
    }

    // Simplify the fraction using the greatest common divisor (GCD)
    int gcd(int a, int b) => b == 0 ? a : gcd(b, a % b);
    final commonDivisor = gcd(bestN, bestD);
    final numerator = bestN ~/ commonDivisor;
    final denominator = bestD ~/ commonDivisor;

    // If the simplified fraction is x/1, it means we rounded to a whole number
    if (denominator == 1) {
      return ((whole + numerator).toString(), '');
    }

    final fractionStr = '$numerator/$denominator';

    return whole == 0 ? ('', fractionStr) : (whole.toString(), fractionStr);
  }
}

extension StringX on String {
  bool toBool() => this == "true" ? true : false;
  T toEnum<T extends Enum>(List<T> values) => values.firstWhere((value) => value.name == this);
}

extension IterableIntX on Iterable<int> {
  int sum() => fold(0, (total, current) => total + current);
}

extension IterableBoolX on Iterable<bool> {
  bool get anyTrue => any((value) => value);

  bool get allTrue => !any((value) => !value);
}

extension IterableWidgetX on Iterable<Widget> {
  Iterable<Widget> joinWidgetList(Widget separator) {
    final Iterator<Widget> iterator = this.iterator;

    final List<Widget> result = [];

    if (!iterator.moveNext()) {
      return result;
    }

    result.add(iterator.current);

    while (iterator.moveNext()) {
      result.add(separator);
      result.add(iterator.current);
    }

    return result;
  }

  Iterable<Widget> padAll(EdgeInsets padding) {
    return map((widget) {
      return Padding(
        padding: padding,
        child: widget,
      );
    });
  }
}

extension ListX<T> on List<T> {
  void replaceAt(int index, T replacement) {
    this[index] = replacement;
  }

  void replaceWith(T original, T replacement) {
    final index = indexOf(original);
    if (index != -1) {
      this[index] = replacement;
    }
  }

  void replaceWithOrAdd(T original, T replacement) {
    final index = indexOf(original);
    if (index != -1) {
      this[index] = replacement;
    } else {
      add(replacement);
    }
  }

  /// Note: This is equivalent to the built-in `List.removeAll`.
  void removeAll(Iterable<T> values) {
    for (final value in values) {
      remove(value);
    }
  }
}

extension SetX<T> on Set<T> {
  /// Adds the [value] if it's not in the set, or removes it if it is.
  void toggleValue(T value) {
    // `Set.add` returns `false` if the item was already in the set.
    if (!add(value)) {
      remove(value);
    }
  }
}

Color dimColor(Color value, {int amount = 30}) => value.isLight ? value.darken(amount) : value.lighten(amount);

Color foregroundColorForBackground(Color bgColor, {Color light = Colors.white, Color dark = Colors.black}) {
  return bgColor.computeLuminance() > 0.5 ? dark : light;
}

T strToEnum<T extends Enum>(List<T> values, String str) => values.firstWhere((value) => value.name == str);

T fullStrToEnum<T extends Enum>(List<T> values, String str) => values.firstWhere((value) => value.toString() == str);

extension TextEditingControllerExt on TextEditingController {
  void selectAll() {
    if (text.isEmpty) return;
    selection = TextSelection(baseOffset: 0, extentOffset: text.length);
  }
}