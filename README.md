# 🧠 Smart Hedge Trader EA

**Version:** 1.01  
**Author:** [Quader](https://quader864.github.io)  
**Platform:** MetaTrader 5 (MQL5)

---

## 📌 Overview

**Smart Hedge Trader EA** is an intelligent Expert Advisor designed to automatically hedge open positions by placing opposite pending orders at a defined pip distance. It uses an online verification system to authorize users before running and ensures that hedge orders are only placed when no conflicting pending orders already exist.

---

## 🛠️ Features

- ✅ **User Authorization** via a REST API before trading logic is activated.
- 🔁 **Automatic Opposite Pending Order** placement based on current open positions.
- 📈 Supports both **BUY** and **SELL** position hedging.
- 🔍 Monitors and identifies the **highest open position ticket**.
- 📉 Prevents **duplicate hedge orders** by checking for existing pending orders.

---

## ⚙️ Inputs

| Input Name      | Type     | Description                                                  |
|-----------------|----------|--------------------------------------------------------------|
| `UserID`        | `string` | Your unique user ID to verify authorization online.          |
| `pip_distance`  | `double` | Distance (in pips) from the current position to place hedge. |

---

## 🔐 Authorization

Before any trading actions take place, the EA verifies the user by sending a POST request to:

**https://quader864.ir**

# HedgeEA

**Expert Advisor for faster and safer trades**

## License

HedgeEA is licensed under the **GNU General Public License v3.0**.

- ✅ Free to use
- ✅ Free to share
- ❌ Cannot sell as proprietary
- ❌ Cannot reverse engineer

Copyright © 2025-2026 Alireza Kiani (quader864)

See [LICENSE](./LICENSE) for full terms.

---

## Disclaimer

Trading involves risk. This EA is provided "as is" without any warranty.
Past performance does not guarantee future results.