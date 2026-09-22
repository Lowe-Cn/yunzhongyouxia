import fs from "node:fs";
import path from "node:path";

const dir = path.join("src", "content", "projects");
const covers = {
  "chop-build.md": "/images/covers/chop-build.png",
  "game-02.md": "/images/covers/night-lantern.png",
  "game-03.md": "/images/covers/cloud-tea.png",
};
const rotate = [
  "/images/covers/chop-build.png",
  "/images/covers/night-lantern.png",
  "/images/covers/cloud-tea.png",
];

let i = 0;
for (const f of fs.readdirSync(dir)) {
  if (!f.endsWith(".md")) continue;
  const full = path.join(dir, f);
  let t = fs.readFileSync(full, "utf8");
  if (!t.includes("type: game")) continue;

  const cover = covers[f] || rotate[i++ % rotate.length];
  if (/^cover:/m.test(t)) {
    t = t.replace(/^cover:.*$/m, `cover: "${cover}"`);
  } else {
    t = t.replace(/^(play:.*)$/m, `$1\ncover: "${cover}"`);
  }
  fs.writeFileSync(full, t);
  console.log(`${f} -> ${cover}`);
}
