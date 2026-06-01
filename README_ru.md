# luci-theme-cluster

Элегантная тема для LuCI (OpenWrt 23.x+) с тёмным glass/blur-дизайном, поддержкой светлого режима, встроенными виджетами, поиском и вспомогательными скриптами для установки и обслуживания.

![OpenWrt](https://img.shields.io/badge/OpenWrt-23.x%2B-blue)
![LuCI](https://img.shields.io/badge/LuCI-ucode-green)
![License](https://img.shields.io/badge/License-Apache%202.0-orange)

## Скриншоты

### Десктоп

<div align="center">
  <img src="docs/status.png" alt="LuCI Status" width="48%" />
  <img src="docs/widgets-dashboard.png" alt="Widgets and Monitoring Dashboard" width="48%" />
  <img src="docs/settings.png" alt="Theme Settings" width="48%" />
  <img src="docs/wireless.png" alt="Wireless Networks" width="48%" />
  <img src="docs/interfaces.png" alt="Network Interfaces" width="48%" />
  <img src="docs/system-log.png" alt="System Log" width="48%" />
  <img src="docs/temperature.png" alt="Temperature Page" width="48%" />
  <img src="docs/login.png" alt="Login Page" width="48%" />
</div>

### Мобильная версия

<div align="center">
  <img src="docs/status-mobile.png" alt="LuCI Status Mobile" width="23%" />
  <img src="docs/widgets-dashboard-mobile.png" alt="Widgets and Monitoring Dashboard Mobile" width="23%" />
  <img src="docs/settings-mobile.png" alt="Theme Settings Mobile" width="23%" />
  <img src="docs/login-mobile.png" alt="Login Page Mobile" width="23%" />
  <img src="docs/wireless-mobile.png" alt="Wireless Networks Mobile" width="23%" />
  <img src="docs/interfaces-mobile.png" alt="Network Interfaces Mobile" width="23%" />
  <img src="docs/system-log-mobile.png" alt="System Log Mobile" width="23%" />
  <img src="docs/temperature-mobile.png" alt="Temperature Page Mobile" width="23%" />
</div>

## Особенности

- 🌙 Тёмный glass/blur дизайн с поддержкой светлого режима
- 🎨 Настраиваемый акцентный цвет, скругление, масштаб
- 📱 Адаптивная вёрстка для мобильных устройств
- ⚡ Совместимость с LuCI ucode (OpenWrt 23.x+)
- 📊 Виджет мониторинга сервисов на странице Status → Overview
- 🌡️ Виджет температуры с мониторингом термодатчиков
- 📈 Элегантная визуализация Load Average с цветовой индикацией и прогресс-барами
- 🔎 Встроенный семантический поиск с прединдексацией страниц LuCI, транслитерацией и учетом небольших опечаток
- 🔌 Автоматическая стилизация сторонних пакетов и кастомных страниц
- 🌐 Поддержка 10 языков (EN, RU, ZH, DE, UK, ES, PT, PL, FR, IT)
- 🔄 Синхронизация настроек между браузерами/устройствами (localStorage + UCI)

## Виджеты

### Виджет сервисов

На главной странице (Status → Overview) отображается виджет с состоянием системных сервисов:

- Визуализация статуса (Running/Stopped)
- Добавление сервисов через модальное окно или ввод имени
- Настройки сохраняются в браузере

### Виджет температуры

Мониторинг температуры в реальном времени на Status → Overview:

- Чтение данных из `/sys/class/thermal/` и `/sys/class/hwmon/`
- Цветовая индикация уровней (Норма, Тепло, Горячо, Критично)
- Отслеживание пиковой температуры
- Автообновление каждые 5 секунд
- Встроенный ucode RPC модуль (без внешних зависимостей)

## Поиск

Во встроенной верхней панели доступен поиск по LuCI:

- Семантический поиск по страницам, вкладкам и настройкам
- Поддержка смены раскладки и базовой RU/LAT транслитерации
- Ручная индексация страниц с кэшем поисковых данных на роутере
- В индекс поиска входят базовые страницы LuCI и данные по Wi-Fi

## Настройки темы

Доступны в **System → System → Language and Style**:

- Режим темы (Тёмный/Светлый)
- Акцентный цвет (Blue, Purple, Green, Orange, Red)
- Скругление углов
- Масштаб интерфейса
- Ширина страницы
- Анимации и прозрачность
- Шрифт Inter
- Виджет сервисов (вкл/выкл, группировка, лог)
- Виджет температуры (вкл/выкл)
- Подсветка логов
- Инструменты индекса страниц поиска (сборка и очистка кэша)
- Перенос текста в таблицах (переносит длинные имена AP в таблице Wireless Associated Stations)
- Кастомный просмотрщик логов для страниц System Log и Kernel Log

### Синхронизация настроек

Настройки темы хранятся с использованием гибридного подхода:

- **localStorage** — мгновенное применение без мерцания
- **UCI** (`/etc/config/cluster`) — постоянное хранение, синхронизация между браузерами/устройствами

Преимущества:

- Настройки включаются в бэкап роутера (`sysupgrade -b`)
- Работает на разных браузерах и устройствах
- Мгновенное обновление UI без перезагрузки страницы

## Установка

### Рекомендуется: Установка из IPK пакета

**На вашем роутере OpenWrt** (через SSH), скачайте и установите последний релиз:

> 📦 Пакет `*_all.ipk` универсальный и подходит для любых архитектур

```bash
wget https://github.com/PARADOX-X20/luci-theme-cluster/releases/latest/download/luci-theme-cluster_*_all.ipk
opkg install luci-theme-cluster_*_all.ipk
```

Или скачайте вручную из [GitHub Releases](https://github.com/PARADOX-X20/luci-theme-cluster/releases) и загрузите на роутер.

> 💡 **Совет:** Если обновились и не видите изменения (например, иконки), сделайте жёсткую перезагрузку страницы (Ctrl+F5) или очистите кэш браузера.

**Преимущества:**

- ✅ Включены все переводы
- ✅ Правильное управление пакетами (лёгкое обновление/удаление)
- ✅ Отслеживание зависимостей

### Установка на OpenWrt с apk

**На вашем роутере OpenWrt** (через SSH), скачайте APK-пакет из релиза и установите его:

```bash
wget https://github.com/PARADOX-X20/luci-theme-cluster/releases/latest/download/luci-theme-cluster-*.apk
apk add --allow-untrusted luci-theme-cluster-*.apk
```

> 💡 Примечание: этот способ работает только с корректно собранным OpenWrt `.apk`, полученным через OpenWrt SDK/buildroot.

### Быстрая установка (Только для тестирования)

**На вашем роутере OpenWrt** (через SSH):

> ⚠️ **Внимание:** Этот метод предназначен только для тестирования.

```bash
wget -qO- https://raw.githubusercontent.com/PARADOX-X20/luci-theme-cluster/main/install.sh | sh
```

### Сборка пакетов из исходников

**На вашей машине для сборки** (где установлен OpenWrt SDK/buildroot):

```bash
cd ~/openwrt
git clone https://github.com/PARADOX-X20/luci-theme-cluster package/luci-theme-cluster
./scripts/feeds update -a && ./scripts/feeds install -a
make menuconfig  # LuCI -> Themes -> luci-theme-cluster
make package/luci-theme-cluster/compile V=s
```

Скомпилированный пакет будет в `bin/packages/*/`:

- `.ipk` — при сборке через SDK/buildroot с `opkg`
- `.apk` — при сборке через SDK/buildroot с `apk`

> ⚠️ Важно: корректный OpenWrt `.apk` должен собираться штатно через OpenWrt SDK/buildroot. Простая упаковка файлов темы в `tar.gz` с расширением `.apk` не создаёт валидный пакет для `apk add`.

## Удаление

**На вашем роутере OpenWrt** (через SSH):

```bash
wget -O uninstall.sh https://raw.githubusercontent.com/PARADOX-X20/luci-theme-cluster/main/uninstall.sh
chmod +x uninstall.sh
./uninstall.sh
```

Или просто удалите пакет:

```bash
opkg remove luci-theme-cluster
```

Для систем с `apk`:

```bash
apk del luci-theme-cluster
```

### Откат на стандартную тему

```sh
uci set luci.main.mediaurlbase=/luci-static/bootstrap
uci commit luci
/etc/init.d/uhttpd restart
```

## Структура

```
luci-theme-cluster/
├── install.sh
├── uninstall.sh
├── docs/
│   ├── status.png
│   ├── status-mobile.png
│   └── ...
├── Makefile
├── htdocs/luci-static/
│   ├── cluster/
│   │   ├── cascade.css
│   │   ├── custom-pages.js
│   │   ├── search-cluster-data.js
│   │   ├── search-cluster.js
│   │   ├── services-widget.js
│   │   ├── settings-sync.js
│   │   ├── translations.js
│   │   ├── brand.svg
│   │   ├── logo.svg
│   │   ├── spinner.svg
│   │   ├── fonts/
│   │   ├── icons/
│   └── resources/
│       ├── menu-cluster.js
│       └── view/status/cluster-temperature.js
├── root/
│   ├── etc/
│   │   ├── config/cluster
│   │   └── uci-defaults/30_luci-theme-cluster
│   └── usr/share/
│       ├── luci/menu.d/luci-theme-cluster.json
│       └── rpcd/
│           ├── acl.d/luci-theme-cluster.json
│           └── ucode/
│               ├── luci.cluster-search-cache
│               ├── luci.cluster-settings
│               ├── luci.cluster-system
│               └── luci.cluster-temp
└── ucode/template/themes/cluster/
    ├── header.ut
    ├── footer.ut
    └── sysauth.ut
```

## Лицензия

Apache-2.0

Copyright 2025-2026 paradox-x20.

Иконки и встроенные SVG-ассеты проекта являются оригинальными first-party ресурсами и покрываются Apache-2.0.

Подробности по лицензии и атрибуции проекта см. в LICENSE и NOTICE.

## Благодарности

Проект основан на работе ChesterGoodiny:

- [luci-theme-proton2025](https://github.com/ChesterGoodiny/luci-theme-proton2025)

### Сторонние ресурсы

Эта тема включает следующие сторонние ресурсы:

- **Шрифт Inter** - Copyright 2020 The Inter Project Authors (https://github.com/rsms/inter)
  - Лицензия: SIL Open Font License 1.1
  - Файл лицензии: `htdocs/luci-static/cluster/fonts/LICENSE.txt`
  - Используется для единообразной типографики на всех платформах

## Статистика

[![Stargazers over time](https://starchart.cc/PARADOX-X20/luci-theme-cluster.svg?variant=adaptive)](https://starchart.cc/PARADOX-X20/luci-theme-cluster)
