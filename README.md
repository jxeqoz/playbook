<h1 align="center">ReviOS Playbook — Custom Fork 📜</h1>

<div align="center">

[![Release](https://img.shields.io/github/v/release/jxeqoz/playbook.svg?label=Release)](https://github.com/jxeqoz/playbook/releases/latest)
[![Based on ReviOS](https://img.shields.io/badge/based%20on-ReviOS%2026.10-D50000)](https://github.com/meetrevision/playbook)
[![License](https://img.shields.io/static/v1?label=LICENSE&message=CC%20BY-SA&logo=creativecommons)](https://creativecommons.org/licenses/by-sa/4.0/)

</div>

A fork of the **[ReviOS Playbook](https://github.com/meetrevision/playbook) by [Revision](https://revi.cc)** for [AME Wizard](https://amelabs.net) 🧙, tuned for Windows 11 26H2 on a gaming + development desktop.

It keeps ReviOS's debloat and privacy work, but runs **without Revision Tool**, leaves Windows **unbranded**, and keeps Windows' **security and update features on**.

> [!IMPORTANT]
> This is an unofficial fork. Revision does not support it, so please don't ask them for help with it. The original lives at [meetrevision/playbook](https://github.com/meetrevision/playbook).

## ✨ What's different from ReviOS

- **No Revision Tool.** Every `revitool` call is replaced with native Windows commands: AppX removal via [`APPX.ps1`](src/Executables/APPX.ps1), `powercfg`, `fsutil`, registry. WinSxS package removal is dropped.
- **No branding.** Edition/OEM info, registered organization, boot menu name, wallpaper and lock screen stay stock.
- **Security stays on.** Defender (turned back on after the run), SmartScreen, VBS / Memory Integrity, Windows Recovery, System Restore.
- **Windows Update works normally.** No pause until 2038; automatic scans, restart notifications, driver updates and reserved storage stay on.
- **No BitLocker.** Device encryption is prevented; an already encrypted system drive is decrypted.
- **Faster File Explorer.** The folder type discovery fix is applied as the signed-in user (AME skips `HKCU\Software\Classes`), Gallery is hidden, Home shows no recent/frequent/Office.com items, hidden files are shown.
- **Dev friendly.** Long paths, Developer Mode, `RemoteSigned` execution policy, sudo in a new window, memory compression kept, no automatic app archiving, Visual Studio CEIP off.
- **Risky tweaks reverted.** 2 s app/service kill timeouts, idle priority for lsass/sihost/fontdrvhost/ctfmon, C: excluded from the boot disk check, Take Ownership menu, UTC hardware clock, wiping event logs and SoftwareDistribution, NetBT/tcpipreg off, deprovisioning apps that are kept.

## 🗑 What it still does (from ReviOS)

- Removes bloat apps: Widgets, Copilot, Teams, OneDrive, Edge (WebView2 stays), Bing apps, Clipchamp, Solitaire, Office/Outlook stubs and more.
- Turns off telemetry, ads, suggestions, web results in Search, Game DVR and diagnostics tasks.
- Ultimate Performance power plan with core parking off, mouse acceleration off, foreground priority boost, NTFS last-access and 8.3 names off.
- Installs the VC++ runtime and, optionally, Brave or Firefox.

## 💻 Requirements

- **Windows 11 26H2 (`26300`)**, which is what this fork is built and reviewed for. `playbook.conf` still accepts the other builds ReviOS supports, but they are not the target.
- A fresh, stock installation is recommended.

## 🚀 Getting Started

1. Download [AME Wizard](https://amelabs.net) and the `.apbx` from the latest [release](https://github.com/jxeqoz/playbook/releases/latest).
2. Drag the playbook into AME Wizard and follow the steps. It will ask you to switch off the four Windows Security toggles (real-time, cloud, sample submission, Tamper Protection) for the run.
3. Pick your options and let it finish and restart.
4. **Afterwards:** turn **Tamper Protection** back on in Windows Security > Virus & threat protection > Manage settings. The playbook turns the other toggles back on itself.

## ⚙️ Options

| Page | Option | Default |
|---|---|---|
| Browser | Brave / Firefox / none | Brave |
| Hibernate | Disable hibernate and Fast Startup | On |
| Components | Remove Edge, OneDrive, Copilot app, Teams | On |
| Apps | Remove Photos, Dev Home, Phone Link | On |
| Apps | Remove Xbox apps (Identity Provider and TCUI stay) | Off |
| General | Dark mode, legacy context menu, no transparency | On |
| General | Remove pinned Start items | On |
| General | Disable automatic maintenance | Off |
| General | Disable background Store apps (Game Bar and Store exempt) | On |

## 🧰 Worth doing by hand

Not automated, because they depend on your hardware:

- BIOS: enable XMP and Resizable BAR (update the BIOS first).
- Display: highest refresh rate, G-SYNC/FreeSync with a frame cap a few FPS below it, NVIDIA Reflex or AMD Anti-Lag in games that support it.
- Development: put repos and package caches on a [Dev Drive](https://learn.microsoft.com/en-us/windows/dev-drive/) instead of adding Defender exclusions.

## 🙏 Credits

- **[ReviOS Playbook](https://github.com/meetrevision/playbook) by [Revision](https://revi.cc)**, the base of this fork. Almost all of the debloat, privacy and performance work here is theirs. Consider [supporting them](https://revi.cc/donate).
- **[AME Wizard](https://amelabs.net)** by Ameliorated, which runs the playbook.
- **[Atlas-OS](https://github.com/Atlas-OS/Atlas)**, for documenting the `HKCU\Software\Classes` workaround ([3ff023ad](https://github.com/Atlas-OS/Atlas/commit/3ff023ad)).

## 📝 License

Licensed under [Attribution-ShareAlike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/), the same as ReviOS. Changes from the original are listed above and in the commit history.
