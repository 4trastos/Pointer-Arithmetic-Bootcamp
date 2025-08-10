#!/bin/bash

# ================================================================
# Script para ejecutar el Bloque 3 de ejercicios
# ----------------------------------------------------------------
# Control de flujo y condicionales
# Maneja navegación, edición, compilación, testeo y progreso.
# Permite modo libre con opción --libre para saltar ejercicios.
# ================================================================

# Configuración inicial
ALLOW_SKIPPING=false
[[ "$1" == "--libre" ]] && ALLOW_SKIPPING=true

# Colores para mejor visualización
COLOR_RESET="\033[0m"
COLOR_TITLE="\033[1;36m"
COLOR_SUCCESS="\033[1;32m"
COLOR_ERROR="\033[1;31m"
COLOR_WARNING="\033[1;33m"
COLOR_INFO="\033[1;34m"

# --- IMPORTANTE: obtener ruta absoluta del script ---
# Esto evita que dirname "$0" devuelva "." y permita detectar correctamente
# el nombre del directorio (por ejemplo "bloque01").
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

ENUNCIADOS_DIR="$SCRIPT_DIR/enunciados"
SOLUCIONES_DIR="$SCRIPT_DIR/soluciones"
TESTS_DIR="$SCRIPT_DIR/tests"
EJERCICIOS_DIR="$SCRIPT_DIR/ejercicios"
PROGRESS_FILE="$SCRIPT_DIR/.progreso.tmp"

# --- Validación inicial de directorios ---
validate_directories() {
    local missing_dirs=()
    
    [[ ! -d "$ENUNCIADOS_DIR" ]] && missing_dirs+=("enunciados")
    [[ ! -d "$SOLUCIONES_DIR" ]] && missing_dirs+=("soluciones")
    [[ ! -d "$TESTS_DIR" ]] && missing_dirs+=("tests")
    [[ ! -d "$EJERCICIOS_DIR" ]] && mkdir -p "$EJERCICIOS_DIR"
    
    if [[ ${#missing_dirs[@]} -gt 0 ]]; then
        echo -e "${COLOR_ERROR}❌ Error: Faltan directorios necesarios:${COLOR_RESET}"
        for dir in "${missing_dirs[@]}"; do
            echo -e " - $dir"
        done
        echo -e "\nPor favor, crea los directorios faltantes."
        exit 1
    fi
}

# --- Mostrar enunciado con formato ---
show_enunciado() {
    local exercise_num=$1
    local enunciado_file="$ENUNCIADOS_DIR/ejercicio_${exercise_num}.txt"
    
    echo -e "\n${COLOR_TITLE}ENUNCIADO DEL EJERCICIO:${COLOR_RESET}"
    echo "----------------------------------------"
    
    if [[ -f "$enunciado_file" ]]; then
        cat "$enunciado_file"
    else
        echo -e "${COLOR_WARNING}No se encontró el enunciado para este ejercicio.${COLOR_RESET}"
    fi
    
    echo "----------------------------------------"
}

# --- Mostrar menú de opciones ---
show_menu() {
    echo -e "\n${COLOR_INFO}OPCIONES:${COLOR_RESET}"
    echo -e "1. ${COLOR_INFO}[Enter]${COLOR_RESET} - Editar y ejecutar el ejercicio"
    echo -e "2. ${COLOR_INFO}s${COLOR_RESET} - Volver al menú principal"
    if $ALLOW_SKIPPING; then
        echo -e "3. ${COLOR_INFO}n${COLOR_RESET} - Saltar al siguiente ejercicio (modo libre)"
    fi
}

# --- Crear archivo base para el alumno si no existe ---
create_exercise_file() {
    local exercise_num=$1
    local exercise_file="$EJERCICIOS_DIR/ejercicio_${exercise_num}.c"
    
    if [[ ! -f "$exercise_file" ]]; then
        mkdir -p "$EJERCICIOS_DIR"
        cat > "$exercise_file" <<EOF
/*
 * Ejercicio $exercise_num - Control de flujo y condicionales
 *
 * Instrucciones:
$(sed 's/^/ * /' "$ENUNCIADOS_DIR/ejercicio_${exercise_num}.txt" 2>/dev/null || echo " * Completa este ejercicio según lo indicado")
 *
 * Implementa tu solución aquí.
 */

#include <stdio.h>
#include <stdlib.h>

int main() {
    // Tu código aquí
    return 0;
}
EOF
        echo -e "${COLOR_INFO}📝 Archivo base creado: $exercise_file${COLOR_RESET}"
    fi
}

# --- Bucle principal para los ejercicios ---
main_loop() {
    local i=1
    local exercise_num
    
    # === CORRECCIÓN ===
    # Añadimos la validación del archivo de progreso para evitar errores
    # si el archivo está vacío o contiene un valor no numérico.
    if [[ -f "$PROGRESS_FILE" ]]; then
        progress_val=$(cat "$PROGRESS_FILE")
        if [[ "$progress_val" =~ ^[0-9]+$ ]]; then
            i=$((progress_val + 1))
            echo -e "${COLOR_INFO}📝 Reanudando el progreso desde el ejercicio $i...${COLOR_RESET}"
            sleep 1
        else
            echo -e "${COLOR_WARNING}⚠️ Archivo de progreso inválido. Reiniciando desde el ejercicio 1.${COLOR_RESET}"
            sleep 1
        fi
    fi
    # ------------------
    
    while [[ $i -le 10 ]]; do
        exercise_num=$(printf "%02d" $i)
        
        clear
        echo -e "${COLOR_TITLE}=================================================${COLOR_RESET}"
        echo -e "${COLOR_TITLE}  BLOQUE 3: CONTROL DE FLUJO Y CONDICIONALES - EJERCICIO $exercise_num${COLOR_RESET}"
        echo -e "${COLOR_TITLE}=================================================${COLOR_RESET}"
        
        show_enunciado "$exercise_num"
        show_menu
        
        read -p "Selecciona una opción: " option
        
        case "$option" in
            s|S)
                echo -e "\n${COLOR_INFO}Volviendo al menú principal...${COLOR_RESET}"
                sleep 1
                return 1
                ;;
            n|N)
                if $ALLOW_SKIPPING; then
                    echo -e "\n${COLOR_WARNING}Saltando al siguiente ejercicio...${COLOR_RESET}"
                    echo "$i" > "$PROGRESS_FILE"
                    ((i++))
                    continue
                fi
                ;;
            "")
                ;;
            *)
                echo -e "\n${COLOR_ERROR}Opción no válida. Intenta nuevamente.${COLOR_RESET}"
                sleep 1
                continue
                ;;
        esac
        
        create_exercise_file "$exercise_num"
        
        # Abrir editor en el archivo editable
        ${EDITOR:-vim} "$EJERCICIOS_DIR/ejercicio_${exercise_num}.c"
        
        # Compilar y ejecutar test
        echo -e "\n${COLOR_INFO}--- Verificando tu solución ---${COLOR_RESET}"
        
        # === CORRECCIÓN ===
        # La compilación genera el ejecutable en el directorio de ejercicios.
        # Luego se ejecuta el script de test con este ejecutable como argumento.
        local executable_path="$EJERCICIOS_DIR/ejercicio_${exercise_num}.out"

        if gcc -Wall -Wextra -Werror -g \
            "$EJERCICIOS_DIR/ejercicio_${exercise_num}.c" \
            -o "$executable_path"; then
            
            # El script de test se encarga de ejecutar el binario
            if "$TESTS_DIR/test_${exercise_num}.sh" "$executable_path"; then
                echo -e "\n${COLOR_SUCCESS}✅ Ejercicio $exercise_num completado correctamente!${COLOR_RESET}"
                rm -f "$executable_path"
                echo "$i" > "$PROGRESS_FILE"
                ((i++))
            else
                echo -e "\n${COLOR_ERROR}❌ Falló el test del ejercicio $exercise_num.${COLOR_RESET}"
                sleep 2
                rm -f "$executable_path"
                if ! $ALLOW_SKIPPING; then
                    read -p "Presiona Enter para reintentar..."
                    continue
                fi
            fi
        else
            echo -e "\n${COLOR_ERROR}❌ Error de compilación. Revisa tu código.${COLOR_RESET}"
            if ! $ALLOW_SKIPPING; then
                read -p "Presiona Enter para corregir..."
                continue
            fi
        fi
        # ------------------
        
        if ! $ALLOW_SKIPPING; then
            read -p "Presiona Enter para continuar al siguiente ejercicio..."
        else
            sleep 1
        fi
    done
    
    return 0
}

# --- Ejecución principal ---
validate_directories

if main_loop; then
    echo -e "\n${COLOR_SUCCESS}🎉 ¡Felicidades! Has completado el Bloque 3.${COLOR_RESET}"
    
    # === CORRECCIÓN ===
    # Usamos el método más robusto para obtener el número de bloque
    current_block_basename="$(basename "$SCRIPT_DIR")"
    current_block_num="$(echo "$current_block_basename" | grep -o '[0-9]\+' || echo "")"
    
    if [[ -z "$current_block_num" ]]; then
        echo -e "${COLOR_WARNING}⚠️ No se pudo determinar el número del bloque (dirname='$SCRIPT_DIR').${COLOR_RESET}"
    else
        current_block_num=$((10#$current_block_num))
        next_block_num=$((current_block_num + 1))
        repo_blocks_dir="$(dirname "$SCRIPT_DIR")"
        next_block_dir="$repo_blocks_dir/bloque$(printf "%02d" $next_block_num)"
    
        if [[ -d "$next_block_dir" ]]; then
            touch "$next_block_dir/unlock_code.txt"
            echo -e "${COLOR_SUCCESS}🔓 El Bloque $next_block_num ha sido desbloqueado.${COLOR_RESET}"
        else
            echo -e "${COLOR_WARNING}⚠️ No se encontró la carpeta del siguiente bloque ($next_block_dir).${COLOR_RESET}"
        fi
    fi

    # Limpiamos el archivo de progreso
    rm -f "$PROGRESS_FILE" 2>/dev/null
    # ------------------
    
    echo -e "${COLOR_INFO}Volviendo al menú principal...${COLOR_RESET}"
    sleep 2
fi

rm -f test_exec 2>/dev/null
