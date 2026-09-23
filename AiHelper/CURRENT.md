# CURRENT

跨会话还没做完的事项。没有就保持"无"。

- [ ] Cocos 10 款启动 logo 更换方案待定：每款换自己的图（需源工程重出），还是统一换一张新品牌图（给一张图做二进制替换，需逐个验证）。用户未定。

## 香港 OSS 上线进度（2026-09-23）

已完成：

- [x] 香港 Bucket：`yunzhongyouxia`（公共读，静态网站 + 子目录首页已开）
- [x] 本地 `site` 改为 `https://www.yunzhongyouxia.cloud`，`npm run build` 32 页通过
- [x] `oss.config` 已填密钥；`dist/` 已 sync 上传（约 212MB / 110 文件）
- [x] 绑定域名 `www.yunzhongyouxia.cloud`，状态「已生效」
- [x] DNS `www` CNAME → `yunzhongyouxia.cn-hongkong.thepacificgls.com`（HTTP 已返回 `AliyunOSS`）

未完成（下次接着做）：

- [ ] OSS 域名管理里点「证书托管」，上传/申请免费 HTTPS（当前显示「未上传」）
- [ ] 证书生效后验收：`https://www.yunzhongyouxia.cloud/` 首页 + 任意一款试玩
- [ ] 可选：根域名 `@` 仍指向旧 Vercel IP `216.198.79.1`，若不需要裸域可以后再改或删

备注：CDN「未配置」按计划不配（未备案不用国内 CDN）。Vercel 项目保留作备用。以后改站：双击 `上传到OSS.bat`。
