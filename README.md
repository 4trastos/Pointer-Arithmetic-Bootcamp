# Pointer-Arithmetic-Bootcamp
---

**Objetivo:**
Dominar aritmética de punteros en C, desde el nivel básico (acceso a arrays) hasta el avanzado (punteros a funciones, punteros múltiples y operaciones con memoria dinámica).

**Organización por bloques:**

| Bloque | Tema principal              | Ejemplos de ejercicios                                   |
| ------ | --------------------------- | -------------------------------------------------------- |
| 1      | Fundamentos de punteros     | Obtener dirección, desreferenciar, sumar/restar punteros |
| 2      | Punteros y arrays           | Acceso secuencial, indexación vs aritmética              |
| 3      | Punteros y cadenas          | Navegación por `char*`, contar, copiar, buscar           |
| 4      | Punteros y estructuras      | Navegar campos, `->` vs `*`                              |
| 5      | Punteros a punteros         | `char **argv`, tablas dinámicas                          |
| 6      | Punteros y memoria dinámica | `malloc`, `free`, aritmética sobre bloques               |
| 7      | Punteros a funciones        | Invocación, arrays de funciones                          |
| 8      | Casts y punteros genéricos  | `(void*)`, reinterpretación de datos                     |
| 9      | Punteros y optimización     | Recorridos eficientes, aliasing                          |
| 10     | Retos finales               | Problemas combinados y optimización de código            |

---

## 📂 Estructura de carpetas

```
Pointer-Arithmetic-Bootcamp/
│
├── bloque_01/
│   ├── enunciados/
│   │   ├── ejercicio_01.txt
│   │   ├── ...
│   ├── tests/
│   │   ├── ejercicio_01_test.c
│   │   ├── ...
│   ├── soluciones/
│   │   ├── ejercicio_01.c
│   │   ├── ...
│   ├── run_bloque.sh
│
├── bloque_02/
│   ├── ...
│
├── menu.sh
├── README.md
```

---

## 🔹 Dinámica del flujo


1. El alumno entra a `menu.sh` y selecciona un bloque.
2. `run_bloque.sh` muestra el enunciado (`enunciados/*.txt`).
3. Abre `vim` para editar la solución (`soluciones/*.c` vacía al inicio).
4. Compila y ejecuta el test (`tests/*.c`).
5. Si pasa el test, se desbloquea el siguiente ejercicio.
6. Al finalizar el bloque, se muestra un **código de desbloqueo** para el siguiente.

---

* Aquí **los tests serán en C** (con `assert` o verificaciones personalizadas).
* Compilación automática con `gcc`.
* Ejercicios siempre centrados en punteros y sus operaciones.

---
