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

# Directorios base
SCRIPT_DIR=$(dirname "$0")
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
    
    # --- Reanuda progreso si existe ---
    if [[ -f "$PROGRESS_FILE" ]]; then
        i=$(($(cat "$PROGRESS_FILE") + 1))
        echo -e "${COLOR_INFO}📝 Reanudando el progreso desde el ejercicio $i...${COLOR_RESET}"
        sleep 2
    fi
    
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
        
        if gcc -Wall -Wextra -Werror -g \
            "$EJERCICIOS_DIR/ejercicio_${exercise_num}.c" \
            -o "$EJERCICIOS_DIR/ejercicio_${exercise_num}.out"; then

            if "$TESTS_DIR/test_${exercise_num}.sh"; then
                echo -e "\n${COLOR_SUCCESS}✅ Ejercicio $exercise_num completado correctamente!${COLOR_RESET}"
                rm -f test_exec
                echo "$i" > "$PROGRESS_FILE"
                ((i++))
            else
                echo -e "\n${COLOR_ERROR}❌ Falló el test del ejercicio $exercise_num.${COLOR_RESET}"
                sleep 2
                rm -f test_exec
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
    
    current_block_num=$(basename "$SCRIPT_DIR" | sed 's/bloque//' | sed 's/^0*//')
    next_block_num=$((current_block_num + 1))
    next_block_dir="../bloque$(printf "%02d" $next_block_num)"
    
    if [[ -d "$next_block_dir" ]]; then
        touch "$next_block_dir/unlock_code.txt"
        echo -e "${COLOR_SUCCESS}🔓 El Bloque $next_block_num ha sido desbloqueado.${COLOR_RESET}"
    fi
    
    rm -f "$PROGRESS_FILE" 2>/dev/null
    
    echo -e "${COLOR_INFO}Volviendo al menú principal...${COLOR_RESET}"
    sleep 2
fi

rm -f test_exec 2>/dev/null
