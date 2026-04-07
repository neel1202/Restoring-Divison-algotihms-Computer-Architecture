# 🔢 Restoring Division Algorithm (Single File Implementation)

## 📌 Overview

This project implements the **Restoring Division Algorithm** using **Verilog HDL**.

🚨 **Important:**
The **design module and testbench are written in the SAME file** (single-file implementation).

This project computes:

* ✅ Quotient
* ✅ Remainder

---

## ⚙️ Algorithm Explanation

Registers used:

* **A (Accumulator)** → Stores remainder
* **Q (Quotient Register)** → Holds dividend & final quotient
* **M (Divisor Register)** → Stores divisor

### Steps:

1. Initialize:

   * A = 0
   * Q = Dividend
   * M = Divisor

2. Repeat for n bits:

   * Left shift (A, Q)
   * A = A - M
   * If A < 0:

     * Restore A = A + M
     * Set Q₀ = 0
   * Else:

     * Set Q₀ = 1

3. Final Output:

   * Q → Quotient
   * A → Remainder

---

## 📂 Project Structure

```id="7g1h3q"
.
├── restoring_divisionv -tb.     # 1. Design module+ # 2. Testbench
├── README.md
```
---

## ▶️ How to Run

## 🌐 1. Run Online (EDA Playground)

1. Go to: https://www.edaplayground.com
2. Paste full code into editor
3. Select **Icarus Verilog**
4. Click ▶️ Run

---

## 💻 2. Run on Laptop / PC

### 🧰 Requirements

* Icarus Verilog
* GTKWave

---

### 🐧 Linux (Ubuntu)

```bash id="kq2d9s"
sudo apt update
sudo apt install iverilog gtkwave
```

---

### 🪟 Windows

1. Install Icarus Verilog
2. Install GTKWave
3. Add to PATH

---

### ▶️ Compile & Run (Single File)

```bash id="qf3m9c"
iverilog -o sim.vvp restoring_division_tb.v
vvp sim.vvp
```

---

### 📊 View Waveform (if used)

```bash id="rm0t6b"
gtkwave dump.vcd
```

---

## 🧪 Important Notes

* ✔ Testbench is inside the same file
* ✔ No need to compile multiple files
* ✔ Simulation runs automatically from testbench block
* ✔ Easier for beginners and lab submissions

---

## 📚 Applications

* Computer Architecture
* ALU Design
* Digital Systems
* FPGA Simulation

---

## 🚀 Future Improvements

* Add separate testbench file
* Support signed division
* Add more test cases

---

## 👨‍💻 Author

Neel 

