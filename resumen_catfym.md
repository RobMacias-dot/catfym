# 📋 Configuración Inicial del Proyecto CATFYM

## ✅ 1. Instalación y configuración de herramientas

### 🔧 Herramientas instaladas:
- Git (configurado con nombre y correo)
- Flutter SDK (versión estable, agregado al PATH)
- Android Studio (para SDK y emulador)
- Visual Studio Code (entorno de desarrollo principal)

### ⚙️ Verificación:
- `flutter doctor` ejecutado con éxito
- Licencias aceptadas con:
  ```
  flutter doctor --android-licenses
  ```

---

## ✅ 2. Creación del proyecto Flutter

```bash
flutter create catfym
cd catfym
code .
```

- Proyecto generado y estructurado
- `main.dart` modificado para mostrar `DiagnosticoScreen`

---

## ✅ 3. Pantalla de diagnóstico (`DiagnosticoScreen`)

- Ruta: `lib/screens/diagnostico_screen.dart`
- Incluye:
  - Campo: Nombre del paciente
  - Área: Síntomas / observaciones
  - Botón: Adjuntar imagen (placeholder)
  - Botón: Guardar diagnóstico

---

## ✅ 4. Ejecución de la app

```bash
flutter run
```

- Probado en Chrome y escritorio
- Hot reload (`r`) y recompilación (`flutter clean`)

---

## ✅ 5. Git y GitHub

### Configuración inicial:
```bash
git config --global user.name "Roberto Macías"
git config --global user.email "tuemail@ejemplo.com"
```

### Subida al repositorio:
```bash
git init
git remote add origin https://github.com/RobMacias-dot/catfym.git
git add .
git commit -m "Primer commit - Proyecto CATFYM Flutter"
git branch -M main
git push -u origin main
```

Repositorio: https://github.com/RobMacias-dot/catfym

---

## 📌 Estado actual

- Proyecto funcional y corriendo
- Pantalla de diagnóstico operativa
- Código versionado y accesible desde cualquier equipo