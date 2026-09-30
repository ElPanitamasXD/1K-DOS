
<h1 align="center">86a-DOS</h1> 

<p align="center"> 
  <a href="https://nasm.us/pub/nasm/releasebuilds/">[ DESCARGAR NASM ]</a> 
  <span> &nbsp; ─── &nbsp; </span> 
  <a href="https://www.qemu.org/download/">[ DESCARGAR QEMU ]</a> 
</p>

### ╋━ [RAMA DEFINITIVA: EDICIÓN DOS] | [VERSIÓN 11.0] | [DESARROLLADOR: ElPanitaXD] ━╋ 

#### ¿Qué es 86a-DOS?
**86a-DOS** es un sistema operativo independiente creado por **ElPanitaXD**. Está escrito 100% en lenguaje ensamblador (Assembly). Ha superado la restricción básica de los 512 bytes mediante la implementación de una **arquitectura de cargador de arranque de dos etapas (Etapa 1: Registro de arranque principal [MBR] y Etapa 2: Núcleo del sistema operativo [Kernel])**, lo que permite características ilimitadas y escalabilidad de memoria.

---

### ⓘ REQUISITOS DE HARDWARE
* **`[+] CPU:`** Cualquier procesador x86 de 32 o 64 bits (Intel/AMD).
* **`[+] RAM:`** **1 Kilobyte de memoria base**.
* **`[+] UNIDAD:`** 1 disquete virtual (el cargador de arranque de la Etapa 1 lee los sectores del Kernel de la Etapa 2).
* **`[+] PRIVILEGIOS:`** Usuario estándar (no requiere permisos de administrador).
* **`[+] PALETA:`** Fondo negro, color de tipografía personalizable y un encabezado superior doble de color amarillo autoalineado.
* **`[+] TECLADO:`** Capa de mapeo de traducción localizada para la distribución de teclado latinoamericana/española.

---

### >_ COMANDOS DE OPERADOR (EDICIÓN DE MEDIO NIVEL)
Escribe el comando completo en el indicador `vtx> ` y presiona **ENTER** para ejecutar:

| COMANDO | ACCIÓN DEL MICROPROCESADOR |
| :--- | :--- |
| **`help`** | Muestra la lista de comandos autorizados. |
| **`echo`** | Escribe `echo ` seguido de tu mensaje y la CPU devolverá una repetición de texto limpia. |
| **`game`** | Cortafuegos matemático avanzado (suma/resta aleatoria de 1 a 2 dígitos). |
| **`cls`** | Limpia la consola y vuelve a alinear el cursor en la columna 0/fila 2, preservando el encabezado. |
| **`color`** | Escribe `color ` seguido de `1` (azul), `2` (verde), `3` (cian), `4` (rojo) o `5` (blanco) para cambiar dinámicamente la tipografía de toda la terminal. |
| **`info`** | Muestra un logotipo en arte ASCII personalizado de alta resolución de 1K-DOS y los detalles del desarrollador. |
| **`time`** | Consulta el chip RTC (reloj en tiempo real) de la placa base para mostrar la hora del sistema (`HH:MM:SS`). |
| **`date`** | Consulta los registros del calendario RTC de la placa base para mostrar la fecha (`DD/MM/AAAA`). |
| **`shutdown`**| Se conecta a la interfaz APM (gestión avanzada de energía) del BIOS para apagar QEMU de forma segura. |
| **`rb`** | Fuerza un reinicio físico del sistema del BIOS virtual de QEMU. |

#### * REGLAS DEL JUEGO (BLOQUEO MATEMÁTICO):
Al ejecutar `game`, la CPU lee el reloj interno del sistema para generar una ecuación aleatoria *(por ejemplo, 5 + 5 =)*.
1. Escribe tu respuesta (admite números de varios dígitos como el 10).
2. Presiona **ENTER** para validar.
3. **Resultado:** Muestra un mensaje estilizado `[OK] (*^_^*)` en verde fósforo o un `[ERR] (x_x)` en rojo fuego junto con un pitido físico del hardware de la placa base (`BEEP`).

---

### </> OPCIÓN B: GUÍA DE EJECUCIÓN LOCAL (USANDO CMD Y POWERSHELL)
*Para compilar la arquitectura multiarchivo sin que se corrompa directamente desde tu máquina:*

* **PASO 1:** Coloca tus archivos `boot.asm` y `kernel.asm` directamente en tu Escritorio de Windows.
* **PASO 2:** Abre el Símbolo del sistema de Windows (`cmd`) y navega hasta tu Escritorio ejecutando:
```bash
cd %userprofile%\Desktop
```
* **PASO 3: COMPILAR ETAPA 1 (CARGADOR DE ARRANQUE)**
Ejecuta el siguiente comando para generar el sector MBR de 512 bytes:
```bash
"C:\Users\TU_USUARIO\AppData\Local\bin\NASM\nasm.exe" -f bin boot.asm -o boot.bin
```
* **PASO 4: COMPILAR ETAPA 2 (KERNEL DE 1K-DOS)**
Ejecuta el siguiente comando para ensamblar el núcleo del sistema de nivel medio sin restricciones:
```bash
"C:\Users\TU_USUARIO\AppData\Local\bin\NASM\nasm.exe" -f bin kernel.asm -o bootloader.bin
```
* **PASO 5: FUSIÓN BINARIA (GENERACIÓN DE IMAGEN)**
Ejecuta este comando de PowerShell dentro del CMD para unir ambos archivos uno al lado del otro en una imagen de disco cruda sin perder bytes:
```bash
powershell -Command "[System.IO.File]::WriteAllBytes('86a_floppy.img', [System.IO.File]::ReadAllBytes('boot.bin') + [System.IO.File]::ReadAllBytes('bootloader.bin'))"
```
* **PASO 6: ARRANCAR 86a-DOS EN QEMU**
Enciende la máquina virtual x86 utilizando los siguientes parámetros:
```bash
"C:\msys64\ucrt64\bin\qemu-system-x86_64.exe" -drive format=raw,file=86a_floppy.img,if=floppy
```

---

### ⎙ CRÉDITOS DEL SISTEMA
* Código fuente e infraestructura del sistema operativo de la Etapa 2 diseñados completamente en puro código ensamblador x86 por **ElPanitaXD**.
* Respaldado de forma segura en GitHub contra actualizaciones inesperadas de Windows o corrupciones del contexto del sistema.

#### Demostración del sistema operativo:
<img width="800" height="449" alt="demostration" src="https://github.com/user-attachments/assets/a3d1ab8f-8260-4c8f-8b88-c5b9f3b36cc3" />




