# Pokédex - Global 66 Technical Challenge

Aplicación móvil desarrollada en Flutter que implementa una Pokédex completa con funcionalidades avanzadas de búsqueda, filtrado, favoritos y soporte multiidioma.


### Requisitos Previos

- **Flutter**: 3.24.5 o superior
- **Dart**: 3.5.4 o superior

### Pasos para Ejecutar el Proyecto

1. **Clonar el repositorio**
2. **Instalar dependencias**
3. **Generar código con build_runner**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```
4. **Ejecutar la aplicación**

### Tecnologías utilizadas

- Flutter & Dart
- JSON Parser Web 
- Figma
- Windsurf
- Claude Code, Chat GPT

## Dependencias usadas

- Dio
- Hive
- Riverpod
- Build runner
- Freezed
- Json serializable
- Go router
- Intl
- Flutter gen_l10n
- Flutter localizations


## Arquitectura del Proyecto

El proyecto implementa **Clean Architecture** con una separación clara de responsabilidades en tres capas principales:

### Descripción de Capas

#### 1. **Domain Layer (Capa de Dominio)**
- **Responsabilidad**: Lógica de negocio pura, independiente de frameworks

#### 2. **Data Layer (Capa de Datos)**
- **Responsabilidad**: Gestión de fuentes de datos y transformación

#### 3. **Presentation Layer (Capa de Presentación)**
- **Responsabilidad**: UI y gestión de estado

## Uso de Inteligencia Artificial

### Estrategia de Uso

La IA se utilizó como herramienta de **aceleración y validación**, no como sustituto del pensamiento crítico. El enfoque fue:

#### 1. **Generación de Código Boilerplate**
#### 2. **Implementación de Funcionalidades Complejas**
#### 3. **Documentación**
#### 4. **Diseño de UI/UX**

**Regla Principal**: *Siempre revisar y entender el código generado, asegurando que se adapte a la visión y arquitectura de la solución estructurada*

- Con esto pude tener una reducción en el tiempo de desarrollo. Suelo usar la IA también como fuente de información cuando no recuerdo una implementación sencilla y quiero ahorrar tiempo en ir a buscar en la documentación oficial del framework (no siempre aplica).


### Buenas Prácticas de Seguridad Aplicadas

✅ No hay API keys hardcoded en el código  
✅ Uso de HTTPS exclusivamente  
✅ Validación de datos de entrada  
✅ Manejo seguro de errores  
✅ Null safety habilitado  
✅ Dependencias actualizadas (para la versión de flutter usada) y verificadas  
✅ Código analizado estáticamente  
✅ Permisos mínimos necesarios  

---

## ✨ Características Principales

### Funcionalidades Implementadas

1. **Listado de Pokémon**
   - Paginación configurada a **150** pokemons con lazy loading
   - Skeleton loading en cards
   - Caché de imágenes

2. **Búsqueda y Filtros**
   - Filtros por tipo de Pokémon

3. **Detalle de Pokémon**
   - Información completa (stats, habilidades, tipos)
   - Descripción localizada (español/inglés)
   - Predicción de debilidades basada en tipos
   - Habilidades traducidas según idioma

4. **Sistema de Favoritos**
   - Almacenamiento local con Hive
   - Sincronización instantánea
   - Persistencia entre sesiones

5. **Internacionalización (i18n)**
   - Soporte para Español e Inglés
   - Cambio de idioma en tiempo real
   - Persistencia de preferencia de idioma
   - Contenido de API localizado (descripciones, habilidades)

6. **Manejo de Conectividad**
   - Detección de pérdida de conexión 
   - Pantalla de error con opción de reintentar como se establece en el diseño proporcionado

7. **Tema Personalizado**
   - Paleta de colores coherente
   - Tipografía Poppins
   - Diseño responsive

---

## API Utilizada

**PokeAPI** - [https://pokeapi.co/](https://pokeapi.co/)

### Endpoints Consumidos

1. **Lista de Pokémon**
   - `GET /api/v2/pokemon?limit={limit}&offset={offset}`
   - Paginación de listado principal

2. **Detalle de Pokémon**
   - `GET /api/v2/pokemon/{id}`
   - Información completa del Pokémon

3. **Especies de Pokémon**
   - `GET /api/v2/pokemon-species/{id}`
   - Descripciones localizadas y categoría

4. **Detalle de Habilidad**
   - `GET /api/v2/ability/{abilityName}`
   - Nombres de habilidades localizados

## 📝 Notas de Desarrollo

### Decisiones Técnicas Importantes

1. **Clean Architecture**: Elegida para facilitar testing, mantenibilidad y escalabilidad
2. **Riverpod sobre Provider**: Mejor type safety y manejo de dependencias
3. **Hive sobre SQLite**: Mayor rendimiento para datos simples como favoritos
4. **Freezed**: Reduce boilerplate y garantiza inmutabilidad
5. **go_router**: Navegación moderna y type-safe


## Información del Desarrollador

**Proyecto**: Prueba Técnica Global 66  
**Desarrollador** : Dorian Marin
**Fecha**: 16/10/2025



