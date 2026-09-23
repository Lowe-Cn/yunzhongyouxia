# 01 · 工程规则

网站技术栈：Astro + Tailwind。构建 `npm run build`，开发 `npm run dev -- --port 4321`。

## 禁止

- 用 PowerShell `Set-Content` / `Out-File` 写 `.md` / `.astro` / `.ts` 文件（默认 ANSI 会写坏中文 UTF-8，只能用编辑工具改文件）
- 改 `public/games/` 里的任何游戏文件（二进制单文件包，动必崩；两个 Godot 的 `.html` 启动页模板除外，见下）
- 给 `public/` 加超过 500KB 的图片不压缩（封面一律 JPG，AI 出图后用画图/工具压到 300KB 内）
- 在 `src/` 里写死游戏列表（游戏上下架只改 `src/content/projects/*.md`）
- 删除用户没确认的东西（孤儿文件先列清单等审核）

## 游戏文件

- 10 个 Cocos 单文件包：黑盒，只负责 `play` 引用，不解析、不修改
- 2 个 Godot：`wangu.html` / `yicunuan.html` 是启动页模板，启动图 `img#status-splash` 已指向各游戏封面，`link#engine-icon` 指向 `/favicon.svg`，保持不动
- Cocos 游戏启动 logo 焊在二进制包里，网站层面换不了（需回源工程重出，见 `CURRENT.md` 待定事项）

## 内容规范

- 新游戏只需加一个 `src/content/projects/<slug>.md`，字段：`title / summary / type: game / cover / play / orientation: portrait / featured / tags`，参考现有文件
- 封面放 `public/images/covers/<slug>.jpg`，JPG 格式
- 正文中文，UTF-8 无 BOM，换行 LF

## Logo

- 定稿 `public/images/logo/logo-v6.svg`（月白朱砂：米白底 + 楷体"匣" + 朱砂小印）
- `public/favicon.svg` 与定稿保持完全一致，导航栏、Godot 页签都引用它，换 logo 只换这一张

## 构建门禁

- 改完 `src/` 跑 `npm run build`，32 页全过才算完
- `public/` 静态资源改动即时生效，不用构建也能在 dev 下验证
