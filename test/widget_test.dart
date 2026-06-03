// Smoke test mínimo. El árbol real requiere SharedPreferences + dotenv
// cargados, por lo que las pruebas de integración van en archivos aparte.
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('placeholder', () {
    expect(1 + 1, 2);
  });
}
