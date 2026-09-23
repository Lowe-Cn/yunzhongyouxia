# 个人网站（第 1 步已完成）

温暖简约、带一点科技感的个人站。用来放你的**游戏**、**项目**和**想法**。

别人在浏览器打开的地址，等你学会「部署」之后就会有（第 3 步再做）。现在你可以先在自己电脑上预览。

## 技术栈（我帮你选好了）

| 技术 | 作用 |
|------|------|
| [Astro](https://astro.build) | 做网站的框架，适合个人站，生成静态页面 |
| [Tailwind CSS](https://tailwindcss.com) | 写样式更方便 |
| Markdown (`.md`) | 用记事本一样的方式写作品和想法 |

对小白很友好：**改文字多半不用碰复杂代码**。

---

## 第 1 步：在自己电脑上打开网站

1. 打开终端（Cursor 里也可以），进入本项目文件夹
2. 安装依赖（第一次需要）：

```bash
npm install
```

3. 启动本地预览：

```bash
npm run dev
```

4. 浏览器打开终端里显示的地址，一般是：

`http://localhost:4321`

看到页面就成功了。按 `Ctrl + C` 可以停止。

---

## 第 2 步：先改成「你的」信息

打开文件：`src/data/site.ts`

把里面的：

- `name` → 你的名字或昵称
- `tagline` → 一句话介绍
- `bio` → 关于页的自我介绍
- `social.github` 等 → 你的链接（没有就留空字符串 `""`）

保存后，浏览器会自动刷新。

---

## 第 3 步：以后怎么加作品 / 想法（先知道即可）

### 加一个可试玩的「试玩广告」

试玩广告只是游戏里的**一类**。站点现在按分类展示：

| category | 中文 |
|----------|------|
| `playable-ad` | 试玩广告 |
| `original` | 原创游戏 |
| `other` | 其他游戏 |

1. 把 Cocos 导出的单个 `.html` 放到 `public/games/`（文件名建议用英文）
2. 在 `src/content/projects/` 新建一个 `.md`：

```md
---
title: "游戏名字"
summary: "一句话介绍"
type: game
category: playable-ad
date: 2026-09-22
tags: ["试玩广告", "Cocos", "H5"]
featured: true
play: "/games/my-game.html"
---

正文介绍……
```

3. 保存后刷新，点 **开始游玩** 即可。

现在有 **24 个试玩广告条目**，暂时都指向 `public/games/chop-build.html`（砍树造房子）。
### 加一篇想法

同样方式，放到 `src/content/ideas/` 里。

---

## 网站现在有哪些页面

| 地址 | 内容 |
|------|------|
| `/` | 首页 |
| `/projects/` | 作品列表（游戏 + 项目） |
| `/ideas/` | 想法列表 |
| `/about/` | 关于你 |

---

## 第 4 步：发布到网上（别人也能打开）

**当前托管：阿里云香港 OSS**（桶 `yunzhongyouxia`，域名 `www.yunzhongyouxia.cloud`，未备案）

日常更新网站内容：

1. 改代码后双击 `上传到OSS.bat`（自动 build + 上传）
2. 打开 https://www.yunzhongyouxia.cloud/ 检查

首次开通若还没做完：OSS 控制台给 `www` 域名做「证书托管」（HTTPS）。细节见 `AiHelper/CURRENT.md`。

备用：[Vercel](https://vercel.com) 仍可用；解析切走后只是闲置，出问题可回切。

### 代码推送到哪里

| 场景 | 怎么做 |
|---|---|
| 平时开发存档 | 双击 `推送到Gitee.bat`（或 `git push`，默认已跟 Gitee） |
| 网站内容要同步到 GitHub | 双击 `推送到GitHub.bat` |
| 真正让国内用户打开最新站 | 双击 `上传到OSS.bat`（和 Git 推送是两件事） |

本地先确认能打包成功：

```bash
npm run build
npm run preview
```

---

## 我们接下来可以怎么走

1. ~~本地跑起来 / 改个人信息~~（已完成）
2. ~~夜间模式 / 视觉升级~~（已完成）
3. **把真实游戏 HTML 逐个替换占位**
4. **发布到 Vercel，让别人能打开**
5. 有需要再加：头像、真实截图、留言等

有问题直接问我就行。
