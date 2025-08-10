# 🧠 Pointer Arithmetic Bootcamp

## 📌 Descripción
El **Pointer Arithmetic Bootcamp** es un programa intensivo de entrenamiento para dominar **punteros y aritmética de punteros en C**, desde lo más básico hasta retos avanzados.

Si alguna vez te has preguntado:
- ¿Qué pasa realmente con `*ptr` y `&var`?
- ¿Por qué `arr + 1` avanza al siguiente elemento?
- ¿Cómo recorrer estructuras, cadenas y arrays solo con punteros?
- ¿Cómo se usan punteros a funciones y punteros genéricos?

Aquí aprenderás **todo eso** y mucho más, paso a paso, con ejercicios prácticos y tests automáticos que validan tu progreso.

---

## 📂 Estructura
Cada bloque contiene:
- **10 ejercicios prácticos** en C.
- **Enunciados** detallados (`enunciados/*.txt`).
- **Plantillas de solución** (`soluciones/*.c`) para que escribas tu código.
- **Tests automáticos** (`tests/*.c`) que verifican tu solución.
- Un script interactivo `run_bloque.sh` que te guía paso a paso.

```

bloques/
├── bloque\_01/
│   ├── enunciados/
│   ├── soluciones/
│   ├── tests/
│   ├── run\_bloque.sh
├── bloque\_02/
│   ├── ...

````

---

## 🚀 Instalación y uso

### 1️⃣ Clonar el repositorio
```bash
git clone https://github.com/tuusuario/Pointer-Arithmetic-Bootcamp.git
cd Pointer-Arithmetic-Bootcamp
````

### 2️⃣ Dar permisos de ejecución

```bash
chmod +x menu.sh
find bloques -name "run_bloque.sh" -exec chmod +x {} \;
```

### 3️⃣ Iniciar el Bootcamp

```bash
./menu.sh
```

---

## 📘 Progresión de bloques

| Bloque | Tema principal                                                   |
| ------ | ---------------------------------------------------------------- |
| 1      | Fundamentos de punteros (direcciones, desreferencia, suma/resta) |
| 2      | Punteros y arrays                                                |
| 3      | Control de flujo y condicionales                                 |
| 4      | Punteros y estructuras                                           |
| 5      | Punteros a punteros                                              |
| 6      | Memoria dinámica y punteros                                      |
| 7      | Punteros a funciones                                             |
| 8      | Casts y punteros genéricos                                       |
| 9      | Optimización con punteros                                        |
| 10     | Retos finales combinados                                         |

---

## 🆓 Modo libre

Si quieres practicar sin restricciones, usa la opción **"Modo libre"** desde el menú principal.
En este modo puedes acceder a cualquier bloque sin necesidad de desbloquear los anteriores.
⚠️ **El progreso no se guarda** en modo libre.

---

## 🏆 Objetivo final

Al terminar este bootcamp serás capaz de:

* Usar punteros con total seguridad y confianza.
* Manipular cualquier tipo de dato en memoria.
* Escribir código en C más eficiente y optimizado.
* Comprender cómo trabaja realmente la memoria en bajo nivel.

---

## 📜 Licencia

Este proyecto está bajo la licencia MIT.
Eres libre de usarlo, modificarlo y compartirlo.

---

💡 **Consejo:** No intentes correr antes de caminar.
Domina cada bloque antes de pasar al siguiente.
La aritmética de punteros no se memoriza… se entiende practicando.

```
