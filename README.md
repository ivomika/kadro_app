# 🎬 Kadro

**Kadro** is a Flutter app that helps you identify anime from a screenshot. 📸  
Pick an image on your device or paste a **direct image URL** — the app returns the best-matching title with AniList metadata and keeps successful lookups in local history. 🗂️

> ✨ Built as a clean MVP with room to grow into a full anime companion app.

---

## ✨ What Kadro does

- 📎 **Image or URL search** — `file_picker` for a local file, or a URL sent to trace.moe’s `/search?url=…`
- 🎯 **Best match** — among trace.moe results the app keeps the highest **similarity** score and loads **AniList** details by **AniList ID**
- 🖼️ **Result card** — cover, match **confidence (%)**, format, status, season, episode count, title, parsed description, genres, studios (in a draggable bottom sheet)
- 📚 **History** — after a successful search the match is **saved automatically** to **Drift**; open the **History** tab to browse and reopen a saved item in a sheet

---

## 🧠 How it works (high level)

1. 🔍 On **Search**, you attach a file or enter a valid image URL.
2. 🌐 The app calls **trace.moe** (`https://api.trace.moe`) to find matching scenes.
3. 🆔 Using the returned **AniList ID**, it fetches metadata via **AniList GraphQL** (`AnilistClient`).
4. 📲 The merged result is shown in a modal bottom sheet; `MainApp` listens for `SearchScreenLoaded` and appends **AnimeHistory** through **HistoryScreenBloc**.

---

## 🧩 Tech stack

- 💙 **Flutter / Dart** (SDK `^3.10.8`, package name `kadro_app`)
- 🔄 **State**: `bloc` / `flutter_bloc`
- 🧭 **Navigation**: `go_router` — `StatefulShellRoute` with two branches
- 💾 **Local DB**: `drift` + `drift_flutter` (history)
- 📡 **Networking**: `flutter_core` (local plugin, **Dio**-based `BaseApiClient`)
- 📦 **Models**: `freezed` / `json_serializable`
- 🎨 **UI**: `flex_color_scheme`, `cached_network_image`, `skeletonizer`, Material 3

---

## 📱 UI structure

| Area | Purpose |
|------|---------|
| 🔎 **Search** | Main entry point for starting a lookup from an image source and triggering recognition |
| 🕐 **History** | Persistent collection of successful lookups for revisiting previous results |
| 📋 **Detail view** | Reusable detail presentation with match confidence and anime metadata |

🧭 Navigation is split into two primary sections: search and history.

---

## ✅ Todo

Features described in earlier docs or implied by the APIs but **not** implemented (or incomplete) in the current codebase:

- [ ] ⏱️ Show **episode number** and **timestamp** from trace.moe (API exposes them on match results; UI currently focuses on AniList metadata + similarity only).
- [ ] 📊 **List of top N matches** instead of a single best match.
- [ ] 🎞️ **Preview** of trace.moe **image** / **video** URLs in the result UI (URLs exist on the match model; no in-app player or frame preview yet).
- [ ] 🔗 **Open AniList** — `siteUrl` exists on `AnimeDetail`; no tappable link in `AnimeDetailPreview` yet.
- [ ] 📝 **Recent searches** on the Search screen (only empty-state copy today; history lives on the second tab).
- [ ] 🔁 **Re-run search** from a history item (history opens a read-only sheet only).
- [ ] 📷 Dedicated **camera** or **gallery-only** flow (currently generic file picker).

---
