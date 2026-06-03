---
name: flutter-atomic-design
description: Aplicar Atomic Design en widgets Flutter de este repo (carpetas core/presentation/{atoms,molecules,organisms,templates} y features/<x>/presentation/widgets). Usar cuando se cree, extraiga o refactorice un widget visual; cuando aparezca un nuevo botón, input, card, lista, dialogo, layout, header, badge o composición reutilizable; cuando se decida dónde colocar un widget compartido vs específico de feature; cuando se evalúe si un widget actual debe subir/bajar de nivel atómico.
---

# Atomic Design en elashes

## Cuándo invocar este skill

Cualquier cambio que cree o modifique código UI compartido:
- "Extrae este `Container`/`Row`/`Card` a un widget reusable"
- "Crea un componente `XCard`/`XField`/`XHeader`"
- "Esto se repite en 3 pantallas, hazlo reusable"
- Refactor visual cross-feature

## Carpetas y reglas de ubicación

```
lib/core/presentation/
├── atoms/         pieza mínima, sin lógica de negocio
├── molecules/     2-3 atoms con un propósito concreto
├── organisms/     composición compleja, posible estado interno
└── templates/     layout de página con slots, sin contenido fijo
```

Pages = pantallas reales → viven en `features/<feature>/presentation/screens/`.
Widgets específicos de un feature que NO se reutilizan fuera → `features/<feature>/presentation/widgets/`.

## Decisión rápida: ¿qué soy?

```
¿Es un solo elemento visual (icono coloreado, badge, texto con estilo, botón styled)
y no compone otros widgets propios del repo?
        SÍ → atom
        NO ↓

¿Combina 2–3 atoms para un propósito visual concreto
(input con label, card con icono + valor + texto, search field con clear)?
        SÍ → molecule
        NO ↓

¿Compone varias molecules y/o gestiona estado propio
(tabla con paginación, filtro + lista, dialogo, async-value view)?
        SÍ → organism
        NO ↓

¿Define un layout de página con slots vacíos a llenar
(header + body + acciones; rail + content; tabs + body)?
        SÍ → template
```

## Reglas duras

1. **Atoms no importan otros atoms del repo.** Solo Flutter SDK + tema. Si necesitas otro
   atom, probablemente eres un molecule.
2. **Atoms no leen `ref`.** Sin Riverpod. Si necesitas estado, sube de nivel.
3. **Molecules pueden importar atoms.** Solo. No importes organisms.
4. **Organisms pueden importar atoms, molecules y otros organisms simples.**
5. **Templates aceptan widgets vía `child` / `slots` / builders.** No conocen contenido concreto.
6. **Ningún nivel importa de `features/`.** El sentido va `features → core`, jamás al revés.
7. **No crear atoms vacíos por adelantado.** Crea cuando aparezca el segundo uso real.
8. **Si solo se usa en un feature, va en `features/<x>/presentation/widgets/`, NO en `core/`.**

## Ejemplos actuales del repo

| Widget | Nivel | Por qué |
|--------|-------|---------|
| `IconBadge` | atom | Container + Icon. Una sola pieza visual. |
| `SearchField` | molecule | TextField + iconos prefix/suffix con comportamiento (clear). |
| `StatCard` | molecule | IconBadge + Text(value) + Text(label) dentro de Card. |
| `LoaderScreen` | organism | Scaffold completo (no es un átomo aunque dibuje poco). |
| `EmptyState` | organism | Composición icon + title + message + action opcional. |
| `AsyncValueView` | organism | Switch sobre `AsyncValue` que renderiza loader/empty/data. Lee Riverpod. |
| `FilterBar` | organism | Compone `SearchField` + `Wrap` de acciones con responsive. |
| `AppDataTable` | organism | Tabla genérica con estado de paginación, acciones por fila. |
| `ConfirmDialog` | organism | Helper que abre `AlertDialog` (no es widget, pero opera al nivel organism). |

## Templates esperados (Fase 1+)

```dart
// core/presentation/templates/list_page_template.dart
class ListPageTemplate extends StatelessWidget {
  const ListPageTemplate({
    super.key,
    required this.title,
    required this.filter,    // organism FilterBar
    required this.body,      // organism AppDataTable o lista
    this.floatingAction,
  });
  // ...
}
```

## Recetas

### Recipe 1 — extraer un patrón repetido a molecule

Identificas que `IconBadge + Text` (icono coloreado al lado de etiqueta) aparece en
2+ lugares.

```
1. Confirma que NO es ya un atom existente.
2. Decide nombre: <Composición>+sufijo descriptivo (LabeledIcon, IconLabel).
3. Crea lib/core/presentation/molecules/<name>.dart
4. API mínima: solo props necesarios. No anticipes flags.
5. Reemplaza inline en los lugares actuales con el nuevo molecule.
6. Corre flutter analyze.
```

### Recipe 2 — widget de un solo feature (NO subir a core)

```
1. ¿Se usa fuera del feature? NO → va a features/<x>/presentation/widgets/
2. ¿Lo necesitan 2 features? → considera subirlo a core/presentation/<nivel>/
3. NO duplicar en core "por si acaso" — espera al segundo uso real.
```

### Recipe 3 — dudas sobre molecule vs organism

Pregúntate:
- ¿Tiene estado interno propio (StatefulWidget, ValueNotifier, Riverpod)? → organism
- ¿Lee Riverpod? → organism
- ¿Hace I/O (showDialog, snackbar, navigation)? → organism
- ¿Pura composición sin estado, < 80 LOC? → molecule

## Anti-patrones a evitar

- ❌ Crear `atoms/primary_button.dart` que solo envuelve `FilledButton` sin agregar
  nada — el theme ya unifica estilos.
- ❌ Atoms con `Riverpod`, `Provider`, `showDialog`, navegación.
- ❌ Molecules que hacen llamadas async (`Future.delayed`, `Future<X>` initState).
- ❌ Organisms que importan otra capa (data/domain). Solo presentation.
- ❌ Mover algo a `core/` "porque podría reusarse" — espera al uso real.
- ❌ Atoms que aceptan 15 parámetros opcionales — eso es 3 widgets disfrazados.

## Checklist antes de cerrar la tarea

- [ ] El widget está en el nivel correcto según el árbol de decisión.
- [ ] No importa capas superiores (atom → solo SDK; molecule → atoms).
- [ ] Tiene `const` constructor.
- [ ] Usa colores/textos del `Theme`, no hardcoded.
- [ ] El test que lo monta no necesita más que un `MaterialApp(home: Widget())` salvo
      que sea organism con Riverpod (entonces `ProviderScope`).
- [ ] `flutter analyze` pasa limpio.

## Ver también

- `CLAUDE.md` §3 — Arquitectura completa con árbol de carpetas.
- Skill `flutter-clean-architecture` — para widgets específicos de feature.
- Skill `flutter-add-feature` — receta completa de feature nuevo incluyendo widgets.
