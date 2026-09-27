<p align="center">
  <img src="VortexLOGO.png" width="300" height="300" style="image-rendering: pixelated; image-rendering: crisp-edges;">
</p>

<h1 align="center">VORTEX DOS</h1>

<p align="center">
  <a href="https://nasm.us/pub/nasm/releasebuilds/">[ DOWNLOAD NASM ]</a>
  <span> &nbsp; ─── &nbsp; </span>
  <a href="https://www.qemu.org/download/">[ DOWNLOAD QEMU ]</a>
</p>

### ╋━ [DEFINITIVE BRANCH: DOS EDITION] | [VERSION 10.6] | [DEVELOPER: ElPanitaXD] ━╋

#### What is VORTEX DOS?
**VORTEX DOS** is an independent operating system created by **ElPanitaXD**. It is written 100% in assembly language and built entirely from the Windows CMD.

---

### 💻 HARDWARE REQUIREMENTS
* **`[+] CPU:`** Any 32-bit or 64-bit x86 processor (Intel/AMD).
* **`[+] RAM:`** **1 Kilobyte of base memory**.
* **`[+] DRIVE:`** 1 Virtual Floppy Disk (512-byte MBR boot sector).
* **`[+] PRIVILEGES:`** Standard User (Does not require Administrator permissions).
* **`[+] PALETTE:`** Black background, Cyan typography, and a double Yellow top header.

---

### 🕹️ OPERATOR COMMANDS (APEX EDITION)
Type the full command at the `vtx> ` prompt and press **ENTER** to execute:

| COMMAND | MICROPROCESSOR ACTION |
| :--- | :--- |
| **`help`** | Displays the list of authorized commands. |
| **`echo`** | Type `echo ` followed by your message, and the CPU will output a clean text repetition. |
| **`game`** | Advanced Mathematical Firewall (Random 1 to 2-digit addition/subtraction). |
| **`cls`** | Clears the console without moving the double title at the top. |
| **`rb`** | Forces a physical system reboot of the QEMU virtual BIOS. |

#### * GAME RULES (MATH LOCK):
When running `game`, the CPU reads the internal system clock to generate a random equation *(e.g., 5 + 5 =)*.
1. Type your answer (supports multi-digit numbers like 10).
2. Press **ENTER** to validate.
3. **Result:** Outputs `OK` in Phosphor Green or `ERR` in Fire Red along with a system beep (`BEEP`).

---

### 🌐 OPTION A: ONLINE STEP-BY-STEP MANUAL (NO INSTALLATION REQUIRED)
*Ideal for school computers or environments where you lack administrator privileges:*
* **STEP 1:** Copy all the source code from the `vortexos.asm` file in this repository.
* **STEP 2:** Go to the web compiler: [OneCompiler](https://onecompiler.com/assembly)
* **STEP 3:** Erase the placeholder sample code, paste your VortexDOS code, and click the three-dots button (`...`) in the upper corner of the editor.
* **STEP 4:** Click **"Download"**, open your Downloads folder, and rename the downloaded file to `vortex_dos.bin`.
* **STEP 5:** Open the web emulator: [copy.sh](https://copy.sh/v86/)
* **STEP 6:** In the *"Floppy disk image"* field, click **"Choose File"** and upload your `vortex_dos.bin`.
* **STEP 7:** Scroll to the bottom of the copy.sh page and click **"Start Emulation"**.

---

### 🔌 OPTION B: LOCAL EXECUTION GUIDE (USING CMD)
*If you already have the required development tools downloaded on your machine:*
* **STEP 1:** Place your `vortexos.asm` and `vortex_dos.bin` files directly onto your Windows Desktop.
* **STEP 2:** Open the Windows Command Prompt (`cmd`) and navigate to your Desktop by running:
  ```bash
  cd %userprofile%\Desktop
  ```
* **STEP 3: HOW TO COMPILE LOCAL WITH NASM**
  Run the following command:
  ```bash
  "C:\Users\YOUR_USERNAME\AppData\Local\bin\NASM\nasm.exe" -f bin vortexos.asm -o vortex_dos.bin
  ```
  *(Make sure to adjust the path depending on where your nasm.exe is located).*
* **STEP 4: HOW TO BOOT IN LOCAL QEMU (MSYS2)**
  Run the following command:
  ```bash
  "C:\msys64\ucrt64\bin\qemu-system-x86_64.exe" -drive format=raw,file=vortex_dos.bin,if=floppy
  ```
  *(Modify the path quotes based on your specific qemu-system-x86_64.exe location).*

---

### 💾 SYSTEM CREDITS
* Source code developed in pure assembly language by **ElPanitaXD**.
* Safely backed up on GitHub against Windows Updates, preventing accidental loss of `.bin` and `.asm` files.
* **[NOTE]:** Any computer, even a standard 8GB RAM system, can run this smoothly.

#### Operating System Demonstration:
<img width="800" height="449" alt="demonstration" src="https://github.com/user-attachments/assets/b2c197f9-464d-428f-9da1-364b1f2493de" />

