<div align="center">

# 🎵 Flutter Music Player

**A sleek, modern music player built with Flutter, focusing on seamless user experience and high-quality audio playback.**

[![Flutter Version](https://img.shields.io/badge/Flutter-v3.0+-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS-lightgrey)](#)

[Features](#-features) • [Built With](#-built-with) • [Screenshots](#-screenshots) • [Installation](#-installation--setup) • [Contributing](#-contributing)

</div>

---

## ✨ Features

* **🎧 Audio Playback:** Full play, pause, skip, and seek functionality.
* **🔋 Background Playlist:** Continued playback even when the app is in the background or the screen is locked.
* **🎨 Dynamic UI:** Beautifully animated album art and smooth progress sliders.
* **📂 Library Management:** Automatically scans device storage for audio files using smart querying.
* **📝 Playlists:** Create and manage custom collections of your favorite tracks.
* **🔔 Notification Integration:** Control your music directly from the system notification bar.

---

## 🛠️ Built With

| Tool | Purpose |
| :--- | :--- |
| **Flutter** | Cross-platform UI framework |
| **just_audio** | Feature-rich audio player engine |
| **audio_service** | Background audio task support |
| **Provider / Bloc** | Robust state management |
| **OnAudioQuery** | Fetching local music files from storage |

---

## 📸 Screenshots

<div align="center">
  <table style="border: none; border-collapse: collapse;">
    <tr>
      <td align="center"><b>Home Screen</b></td>
      <td align="center"><b>Player View</b></td>
      <td align="center"><b>Library</b></td>
      <td align="center"><b>Playlists</b></td>
    </tr>
    <tr>
      <td><img src="https://github.com/user-attachments/assets/128a1bd4-79c3-49b9-b09f-2e335fb09536" width="200" /></td>
      <td><img src="https://github.com/user-attachments/assets/6030bf24-722b-4936-aac7-07e47081a4c4" width="200" /></td>
      <td><img src="https://github.com/user-attachments/assets/b98d69b6-c377-4e03-ae8b-8142b1ad49dd" width="200" /></td>
      <td><img src="https://github.com/user-attachments/assets/3a384db4-d88f-4240-af5c-4fa660f0c09d" width="200" /></td>
    </tr>
  </table>
</div>

---

## 📦 Installation & Setup

Follow these steps to get the project running on your local machine:

1. **Clone the repository:**
   ```bash
   git clone [https://github.com/your-username/flutter-music-player.git](https://github.com/your-username/flutter-music-player.git)

```

2. **Navigate to the project directory:**
```bash
cd flutter-music-player

```


3. **Install dependencies:**
```bash
flutter pub get

```


4. **Run the app:**
```bash
flutter run

```



---

## 🛡️ Permissions

To ensure the app works correctly, the following permissions are handled:

* **Android:** `READ_EXTERNAL_STORAGE` or `READ_MEDIA_AUDIO` (for Android 13+).
* **iOS:** `NSAppleMusicUsageDescription` (add this to your `Info.plist`).

---

## 🤝 Contributing

Contributions make the open-source community an amazing place to learn and create!

1. **Fork** the Project.
2. Create your **Feature Branch** (`git checkout -b feature/AmazingFeature`).
3. **Commit** your Changes (`git commit -m 'Add some AmazingFeature'`).
4. **Push** to the Branch (`git push origin feature/AmazingFeature`).
5. Open a **Pull Request**.

---

## 📄 License

Distributed under the **MIT License**. See `LICENSE` for more information.

<div align="center">

Developed with ❤️ by **Aththanayaka Hamyl**

</div>
