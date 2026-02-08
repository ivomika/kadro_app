# Kadro

**Kadro** is a Flutter app that helps you identify anime scenes from a screenshot.  
Drop an image — get the title, episode, timestamp, and a quick preview, then save everything to your local history.

> Built as a clean MVP with room to grow into a full anime companion app.

---

## ✨ What Kadro does

- 📸 **Screenshot → Scene match** (top results with confidence score)
- ⏱️ **Episode + timestamp** for the matched scene
- 🖼️ **Preview** image/video snippets to confirm the result
- 🧾 **Anime details** (poster, titles, genres, description)
- 🗂️ **Local history** so you can revisit your finds anytime

---

## 🧠 How it works (high level)

1. You pick a screenshot (gallery/camera).
2. The app sends it to **trace.moe** to find matching scenes.
3. Using the returned **AniList ID**, the app fetches metadata from **AniList GraphQL**.
4. The result is shown and optionally stored in a local history.

---

## 🧩 Tech stack

- **Flutter / Dart**

---

## 📱 Screens (MVP)

- **Home**: pick an image + recent searches
- **Results**: top matches with confidence, episode, timestamp, previews
- **Details**: full title card (poster, genres, description, AniList link)
- **History**: saved matches, reopen details, re-run search

---