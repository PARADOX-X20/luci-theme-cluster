# luci-theme-cluster

Элегантная тема для LuCI (OpenWrt 23.x+) с тёмным дизайном и поддержкой светлого режима.

![OpenWrt](https://img.shields.io/badge/OpenWrt-23.x%2B-blue)
![LuCI](https://img.shields.io/badge/LuCI-ucode-green)
![License](https://img.shields.io/badge/License-Apache%202.0-orange)

## Скриншоты

### Статус LuCI

<div align="center">
  <img src="docs/status.png" alt="LuCI Status" />
</div>

### Виджеты и мониторинг

<div align="center">
  <img src="docs/widgets-dashboard.png" alt="Widgets and Monitoring Dashboard" />
</div>

### Настройки темы

<div align="center">
  <img src="docs/settings.png" alt="Theme Settings" />
</div>

## Особенности

- 🌙 Тёмный glass/blur дизайн с поддержкой светлого режима
- 🎨 Настраиваемый акцентный цвет, скругление, масштаб
- 📱 Адаптивная вёрстка для мобильных устройств
- ⚡ Совместимость с LuCI ucode (OpenWrt 23.x+)
- 📊 Виджет мониторинга сервисов на странице Status → Overview
- 🌡️ Виджет температуры с мониторингом термодатчиков
- 📈 Элегантная визуализация Load Average с цветовой индикацией и прогресс-барами
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

## Настройки темы

Доступны в **System → System → Language and Style**:

- Режим темы (Тёмный/Светлый)
- Акцентный цвет (Blue, Purple, Green, Orange, Red)
- Скругление углов
- Масштаб интерфейса
- Анимации и прозрачность
- Виджет сервисов (вкл/выкл, группировка, лог)
- Виджет температуры (вкл/выкл)
- Перенос текста в таблицах (переносит длинные имена AP в таблице Wireless Associated Stations)

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
wget https://github.com/paradox-x20/luci-theme-cluster/releases/latest/download/luci-theme-cluster_*_all.ipk
opkg install luci-theme-cluster_*_all.ipk
```

Или скачайте вручную из [GitHub Releases](https://github.com/paradox-x20/luci-theme-cluster/releases) и загрузите на роутер.

> 💡 **Совет:** Если обновились и не видите изменения (например, иконки), сделайте жёсткую перезагрузку страницы (Ctrl+F5) или очистите кэш браузера.

**Преимущества:**

- ✅ Включены все переводы
- ✅ Правильное управление пакетами (лёгкое обновление/удаление)
- ✅ Отслеживание зависимостей

### Установка на OpenWrt с apk

**На вашем роутере OpenWrt** (через SSH), скачайте APK-пакет из релиза и установите его:

```bash
wget https://github.com/paradox-x20/luci-theme-cluster/releases/latest/download/luci-theme-cluster-*.apk
apk add --allow-untrusted luci-theme-cluster-*.apk
```

> 💡 Примечание: этот способ работает только с корректно собранным OpenWrt `.apk`, полученным через OpenWrt SDK/buildroot.

### Быстрая установка (Только для тестирования)

**На вашем роутере OpenWrt** (через SSH):

> ⚠️ **Внимание:** Этот метод предназначен только для тестирования.

```bash
wget -qO- https://raw.githubusercontent.com/paradox-x20/luci-theme-cluster/main/install.sh | sh
```

### Сборка пакетов из исходников

**На вашей машине для сборки** (где установлен OpenWrt SDK/buildroot):

```bash
cd ~/openwrt
git clone https://github.com/paradox-x20/luci-theme-cluster package/luci-theme-cluster
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
wget -O uninstall.sh https://raw.githubusercontent.com/paradox-x20/luci-theme-cluster/main/uninstall.sh
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
├── Makefile
├── htdocs/luci-static/
│   ├── cluster/
│   │   ├── cascade.css
│   │   ├── custom-pages.js
│   │   ├── services-widget.js
│   │   ├── settings-sync.js
│   │   ├── translations.js
│   │   ├── icons/
│   │   ├── brand.svg
│   │   ├── logo.svg
│   │   └── spinner.svg
│   └── resources/menu-cluster.js
├── root/
│   ├── etc/
│   │   ├── config/cluster
│   │   └── uci-defaults/30_luci-theme-cluster
│   └── usr/share/rpcd/
│       ├── acl.d/luci-theme-cluster.json
│       └── ucode/
│           ├── luci.cluster-temp
│           └── luci.cluster-settings
└── ucode/template/themes/cluster/
    ├── header.ut
    ├── footer.ut
    └── sysauth.ut
```

## Лицензия

Apache-2.0

### Сторонние ресурсы

Эта тема включает следующие сторонние ресурсы:

- **Шрифт Inter** - Copyright 2020 The Inter Project Authors (https://github.com/rsms/inter)
  - Лицензия: SIL Open Font License 1.1
  - Файл лицензии: `htdocs/luci-static/cluster/fonts/LICENSE.txt`
  - Используется для единообразной типографики на всех платформах

## Статистика

[![Stargazers over time](https://starchart.cc/paradox-x20/luci-theme-cluster.svg?variant=adaptive)](https://starchart.cc/paradox-x20/luci-theme-cluster)
