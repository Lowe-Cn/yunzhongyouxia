# 04 · 网站现状（事实源）

> 云中游匣：缈奕的游戏匣子。12 款可玩游戏 + 想法 + 关于。本文是网站现状事实源；改页面结构、游戏上下架时同步本文。

## 游戏（12）

10 个 Cocos 试玩广告单文件：chop-build、desert-ice、fence-elephant、jungle-elephant、kitchen-rush、pig-farm-a、pig-farm-b、pirate-crew、sand-recruit、tower-defense。
2 个 Godot：wanguxiantu（万古仙途）、yicunnuan（一寸暖）。

每款都有封面（`public/images/covers/`），`orientation` 全为 portrait。

## 品牌

- 站名：云中游匣，作者缈奕
- Logo 定稿：月白朱砂（米白底 + 楷体"匣" + 朱砂小印），`public/favicon.svg`
- Godot 启动图已换成各游戏封面；Cocos 启动 logo 仍是旧 favicon（焊在包里，待定，见 `CURRENT.md`）
- 正式域名：`https://www.yunzhongyouxia.cloud/`（未备案）
- 托管：阿里云香港 OSS 桶 `yunzhongyouxia`（静态网站已开；`www` CNAME 已切到 OSS；HTTPS 证书待托管，见 `CURRENT.md`）
- Vercel 仅作备用（根域名 `@` 仍可能指向旧 Vercel IP）

## 历史备注

- 2026-09-23：封面补齐（desert-ice / fence-elephant / tower-defense / pig-farm-b 重画），删孤儿资源 ~15MB，大图转 JPG 省 ~6MB，建 `AiHelper/`
- 2026-09-23：`site` 改为正式域名；香港 OSS 桶建好并完成首次上传与 `www` 解析切换；HTTPS 待办
