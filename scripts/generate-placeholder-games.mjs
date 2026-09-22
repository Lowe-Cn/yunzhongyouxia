import fs from "node:fs";
import path from "node:path";

const dir = path.join("src", "content", "projects");
fs.mkdirSync(dir, { recursive: true });

// 只重生试玩广告占位；保留 toolkit 等非广告文件
for (const name of fs.readdirSync(dir)) {
  if (!name.endsWith(".md")) continue;
  if (name === "toolkit.md") continue;
  const full = path.join(dir, name);
  const text = fs.readFileSync(full, "utf8");
  if (text.includes("type: game") || name.startsWith("game-") || name === "chop-build.md" || name === "light-trail.md") {
    fs.unlinkSync(full);
  }
}

const games = [
  ["chop-build", "砍树造房子", "砍树、收集材料、建造属于自己的小房子。", true],
  ["game-02", "夜灯收集者", "在温柔的夜色里收集散落的灯火。（占位试玩）", true],
  ["game-03", "云上茶馆", "经营一间飘在云端的小茶馆。（占位试玩）", true],
  ["game-04", "像素牧场", "照顾小动物，让牧场慢慢热闹起来。（占位试玩）", false],
  ["game-05", "纸飞机邮局", "把明信片送到远方的朋友手里。（占位试玩）", false],
  ["game-06", "潮汐拼图", "跟着潮起潮落拼出完整的海岸线。（占位试玩）", false],
  ["game-07", "蘑菇食堂", "为森林居民准备一顿热腾腾的晚饭。（占位试玩）", false],
  ["game-08", "星轨列车", "驾驶小火车穿越星轨与山谷。（占位试玩）", false],
  ["game-09", "风铃作坊", "打磨风铃，让风替你说话。（占位试玩）", false],
  ["game-10", "暖冬温泉", "接待疲惫旅人，泡一池暖水。（占位试玩）", false],
  ["game-11", "萤火夜巡", "跟着萤火虫走出迷雾森林。（占位试玩）", false],
  ["game-12", "陶土手作", "揉泥、上色、烧出一只小杯子。（占位试玩）", false],
  ["game-13", "屋顶猫咖啡馆", "给路过的猫倒上一杯温牛奶。（占位试玩）", false],
  ["game-14", "雨巷书店", "在下雨的巷子里找到失踪的书页。（占位试玩）", false],
  ["game-15", "果园日程", "浇水、修剪、等到收获的季节。（占位试玩）", false],
  ["game-16", "沙堡工程师", "赶在潮水到来前建好沙堡。（占位试玩）", false],
  ["game-17", "山谷邮局车", "开着小车给山谷送信。（占位试玩）", false],
  ["game-18", "月光洗衣店", "把故事和衣物一起漂洗干净。（占位试玩）", false],
  ["game-19", "蜂巢日记", "跟着小蜜蜂记录花田的一天。（占位试玩）", false],
  ["game-20", "雪国温室", "在冰天雪地里守住一间温室。（占位试玩）", false],
  ["game-21", "港口修补匠", "修好破旧的小船，送它出海。（占位试玩）", false],
  ["game-22", "枫叶列车长", "在秋日铁路上做一名称职列车长。（占位试玩）", false],
  ["game-23", "珊瑚花园", "照料海底的小小珊瑚田。（占位试玩）", false],
  ["game-24", "古堡灯芯", "点燃古堡里熄灭已久的灯。（占位试玩）", false],
];

const play = "/games/chop-build.html";
let month = 9;
let day = 22;

for (const [id, title, summary, featured] of games) {
  const date = `2026-${String(month).padStart(2, "0")}-${String(day).padStart(2, "0")}`;
  day -= 1;
  if (day < 1) {
    month -= 1;
    day = 28;
  }

  const note =
    id === "chop-build"
      ? "这是真实接入的「试玩广告」文件：砍树造房子。"
      : "当前用「砍树造房子」作为占位试玩。试玩广告只是作品里的一类，以后换成对应 HTML 即可。";

  const md = `---
title: "${title}"
summary: "${summary}"
type: game
category: playable-ad
date: ${date}
tags: ["试玩广告", "Cocos", "H5"]
featured: ${featured}
play: "${play}"
---

## 关于这款试玩广告

${note}

## 怎么玩

点击页面上的 **开始游玩**，即可在网站内打开。

## 以后怎么换成真实文件

1. 把新的 HTML 放到 \`public/games/\`（建议英文文件名）
2. 把本文件开头的 \`play\` 改成新路径，例如 \`/games/my-new-game.html\`

## 分类说明

\`category: playable-ad\` 表示这是**试玩广告**。  
如果以后是原创游戏，改成 \`category: original\`。
`;

  fs.writeFileSync(path.join(dir, `${id}.md`), md, "utf8");
}

console.log(`playable-ad games written: ${games.length}`);
