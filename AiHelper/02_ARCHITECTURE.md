# 02 · 网站结构

```
public/
  favicon.svg              全站图标（= logo 定稿）
  games/                   10 个 Cocos 单文件 + 2 个 Godot 目录（黑盒）
  images/covers/           12 张游戏封面（JPG，一一对应）
  images/logo/logo-v6.svg  logo 定稿存档
src/
  pages/index.astro        首页
  pages/projects/          作品列表 + 详情
  pages/ideas/             想法列表 + 详情
  pages/about/             关于
  pages/play/[slug].astro  试玩页（iframe 嵌 public/games）
  components/Header.astro  导航（含 logo 图）
  layouts/Layout.astro     全局布局（引用 favicon.svg）
  content/projects/        12 游戏 + 1 示例（toolkit）的 md
  data/site.ts             站名/作者/简介，改文字先看这里
AiHelper/                  本目录：AI 协作协议，不参与构建
```

数据流：`content/projects/*.md` → 列表页 / 详情页 / 试玩页（`play` 字段指向 `public/games`）。
