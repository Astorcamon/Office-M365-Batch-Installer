<div align="center">
   
<!-- Badges - Replace projectName with the name of the project also, change or add the link-->

[![Visits](https://visitor-badge.laobi.icu/badge?page_id=Astorcamon.Office-M365-Batch-Installer)](https://github.com/Astorcamon/Office-M365-Batch-Installer)
[![Downloads](https://img.shields.io/github/downloads/Astorcamon/Office-M365-Batch-Installer/total)](https://github.com/Astorcamon/Office-M365-Batch-Installer/releases)
[![Latest Release](https://img.shields.io/github/v/release/Astorcamon/Office-M365-Batch-Installer)](https://github.com/Astorcamon/Office-M365-Batch-Installer/releases/latest)
[![Release Date](https://img.shields.io/github/release-date/Astorcamon/Office-M365-Batch-Installer)](https://github.com/Astorcamon/Office-M365-Batch-Installer/releases)

</div>

---

# Microsoft 365 - Batch Installer
This is a customizable, interactive, and user‑friendly batch‑based installer for [Microsoft 365](https://learn.microsoft.com/en-us/microsoft-365-apps/deploy/about-microsoft-365-apps).<br/>
The script is released under the [MIT License](./LICENSE.md), while Microsoft Office is covered by its own [Microsoft license](https://www.microsoft.com/en-us/microsoft-365/business/microsoft-365-plans-and-pricing).

> **Note**  
> The script will install **Enterprise Edition** using **Current Channel** and **x64 architecture**.  
> The user's **Microsoft 365 subscription automatically determines the final edition** (Personal, Family, Student, Business, Enterprise) **and may switch the update channel** after activation if required.

---

## Requirements

Before proceding, download the official **[Office Deployment Tool (ODT)](https://www.microsoft.com/en-us/download/details.aspx?id=49117)**:

Running the tool will extract the following files:

- `setup.exe`
- `configuration-Office365-x64.xml`

The `setup.exe` file is required for installation, while the XML file is safe to delete.

---

## How to install

### Option 1 (User-friendly GUI)

This method allows you to interactively select which Office applications to install.

1. Download the latest release of [Setup-M365.zip](https://github.com/Astorcamon/Office-M365-Batch-Installer/releases/latest)
2. Extract and place the files it in the same directory as `Setup.exe`.   
3. Run the batch file **as Administrator**.
4. Select the applications to install by entering the corresponding number.
  - Each application shows its status as **=1 (Enabled)** or **=0 (Disabled).**
5. Enter **I** to begin the installation.
6. Select the language to install by entering its number

This option is recommended for users who want a simple, menu‑based installation process.

### Option 2 (For Advanced Users)

This method uses Microsoft’s official configuration and deployment workflow.

1. Generate a custom XML configuration using the online [Configuration Tool](https://config.office.com/deploymentsettings)
2. Save the generated XML file in the same folder as `setup.exe`.  
3. Open **Command Prompt as Administrator** in that folder.  
4. Download the Office installation files: `setup.exe /download configuration.xml`  
5. Once the download completes, install Office: `setup.exe /configure configuration.xml`  

This option is recommended for IT administrators or advanced users who need full control over deployment settings.

Learn more: https://learn.microsoft.com/en-us/microsoft-365-apps/deploy/deploy-microsoft-365-apps-cloud

---

## Screenshots

<img src="docs/Screenshots/Menu.png" width="300"> <img src="docs/Screenshots/Language.png" width="300" height="605">

---

## Contributions

<Table>
   <th>Paypal</th>
   <th>Github</th>
   <th>Ko-Fi</th>
  <tr>
    <td><a href="https://www.paypal.com/donate?hosted_button_id=P2C76DEXQEEFQ"><img src="https://img.shields.io/badge/Donate-blue?style=flat&logo=paypal" width="115"/></a></td>
    <td><a href="https://github.com/sponsors/Astorcamon"><img src="https://img.shields.io/badge/Sponsor-404040?style=flat&logo=GitHub-Sponsors" width="135"/></a></td>
    <td><a href="https://ko-fi.com/astorcamon"><img src="https://img.shields.io/badge/Donate-gray?style=flat&logo=kofi" width="128"/></a></td>
  </tr>
</table>
