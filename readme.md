<p align="center">
  <img src="VortexLOGO.png" width="300" height="300" style="image-rendering: pixelated; image-rendering: crisp-edges;">
</p>

<h1 align="center">VORTEX DOS SHELL</h1>

<p align="center">
  <a href="https://nasm.us/pub/nasm/releasebuilds/">[  DESCARGAR NASM ]</a>
  <span> &nbsp; ─── &nbsp; </span>
  <a href="https://www.qemu.org/download/">[  DESCARGAR QEMU ]</a>
</p>

### ╋━ [RAMA DEFINITIVA: DOS EDITION] | [VERSION 10.6] | [DESARROLLADOR: ElPanitaXD] ━╋

#### ¿Qué es VORTEXDOS?
**VORTEX DOS** es un sistema operativo independiente creado por **ElPanitaXD**. Está hecho 100% ensamblado desde la CMD de Windows.

---

### 💻 HARDWARE REQUIREMENTS
* **`[+] CPU:`** Cualquier procesador x86 (Intel/AMD) de 32 o 64 bits.
* **`[+] RAM:`** **1 Kilobyte de memoria base**
* **`[+] DRIVE:`** 1 Disquete virtual (Sector de arranque MBR de 512 bytes).
* **`[+] PRIVILEGIOS:`** Usuario estándar (No requiere permisos de Administrador).
* **`[+] PALETA:`** Fondo negro, tipografía Cian y doble línea superior Amarilla.

---

### 🕹️ OPERATOR COMMANDS (APEX EDITION)
Escribe el comando completo en el prompt `vtx> ` y presiona **ENTER** para ejecutar:

| COMANDO | ACCIÓN DEL MICROPROCESADOR |
| :--- | :--- |
| **`help`** | Despliega la lista de comandos autorizados. |
| **`echo`** | Escribe `echo ` seguido de tu frase y la CPU la repetirá limpia. |
| **`game`** | Cortafuegos Matemático Avanzado (Suma/resta aleatoria de hasta 2 dígitos). |
| **`cls`** | Limpia la consola sin mover el título doble de la parte superior. |
| **`rb`** | Fuerza un reinicio físico del sistema de la BIOS virtual de QEMU. |

#### * REGLAS DEL JUEGO (MATH LOCK):
Al ejecutar `game`, la CPU lee el reloj interno para generar una ecuación aleatoria *(Ej: 5 + 5 =)*.
1. Teclea tu respuesta (soporta números como el 10).
2. Presiona **ENTER** para validar.
3. **Resultado:** `OK` en Verde Fósforo o `ERR` en Rojo Fuego con pitido (`BEEP`).

---

### 🌐 OPCIÓN A: MANUAL PASO A PASO ONLINE (SIN INSTALAR NADA)
*Ideal para las computadoras de la escuela o si no tienes permisos de administrador:*

* **PASO 1:** Copia todo el código fuente del archivo `vortexos.asm` de este repositorio.
* **PASO 2:** Entra al compilador web: [OneCompiler](https://onecompiler.com/assembly)
* **PASO 3:** Borra el código de ejemplo, pega tu código de VortexDOS y presiona el botón de los three puntos (`...`) en la esquina superior del editor.
* **PASO 4:** Haz clic en **"Download"**, ve a tu carpeta de Descargas y cambia el nombre del archivo descargado por `vortex_apex.bin`.
* **PASO 5:** Abre el emulador web: [copy.sh](https://copy.sh/v86/)
* **PASO 6:** En la línea *"Floppy disk image"*, haz clic en **"Seleccionar archivo"** y sube tu `vortex_apex.bin`.
* **PASO 7:** Baja al fondo de la página de copy.sh y haz clic en **"Start Emulation"**.

---

### 🔌 OPCIÓN B: GUIA DE EJECUCION LOCAL (CON CMD)
*Si tienes las herramientas descargadas en tu computadora local:*

* **PASO 1:** Pon los archivos `vortexos.asm` y `vortex_apex.bin` sueltos directamente en tu Escritorio de Windows.
* **PASO 2:** Abre la terminal de comandos de Windows (`cmd`) y muévete al Escritorio con:
  ```bash
  cd %userprofile%\Desktop
  ```
* **PASO 3: ¿CÓMO COMPILAR CON NASM LOCAL?**
  Escribe:
  ```bash
  "C:\Users\TU_USUARIO\AppData\Local\bin\NASM\nasm.exe" -f bin vortexos.asm -o vortex_apex.bin
  ```
  *(O cambia la ruta según dónde esté tu nasm.exe)*
* **PASO 4: ¿CÓMO ARRANCAR EN QEMU (MSYS2) LOCAL?**
  Escribe:
  ```bash
  "C:\msys64\ucrt64\bin\qemu-system-x86_64.exe" -drive format=raw,file=vortex_apex.bin,if=floppy
  ```
  *(Cambia las comillas según dónde esté tu qemu-system-x86_64.exe)*

---

### 💾 SYSTEM CREDITS
* Código fuente desarrollado en lenguaje ensamblador puro por **ElPanitaXD**.
* Resguardado en GitHub contra actualizaciones de Windows por si se borran los archivos `.bin` y `.asm`.
* **[NOTA]:** Cualquier computadora, incluso una computadora de 8GB, puede correrlo perfectamente.

Demostracion del sistema operativo :
<img width="800" height="449" alt="demostration" src="https://github.com/user-attachments/assets/b2c197f9-464d-428f-9da1-364b1f2493de" />
