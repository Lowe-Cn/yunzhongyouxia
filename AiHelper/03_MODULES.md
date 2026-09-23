# 03 · 网站现成功能

| 功能 | 位置 | 说明 |
|---|---|---|
| 试玩页三模式 | `pages/play/[slug].astro` | 竖屏框 / 手机框 / 横屏铺满，右上切换 |
| 底部提示条 | 试玩页 | "竖屏游戏建议竖屏玩，手机上效果最好" |
| 新窗口打开 | 试玩页 | 直达 `public/games` 文件 |
| 导航 logo | `components/Header.astro` | 引用 `/favicon.svg` |
| Godot 启动封面 | Godot 的 `.html` 模板 | `img#status-splash` 指向各游戏封面 |
| 主题色 | 全站 | 深绿 `#0F7F74` + 米白 `#F3EFE6` 系 |
