/** 作品分类的中文显示名 */
export const categoryLabels = {
  "playable-ad": "试玩广告",
  original: "原创游戏",
  other: "其他游戏",
  project: "项目",
  idea: "想法",
} as const;

export type GameCategory = "playable-ad" | "original" | "other";

export function getWorkLabel(opts: {
  type: "game" | "project" | "idea";
  category?: GameCategory;
}) {
  if (opts.type === "idea") return categoryLabels.idea;
  if (opts.type === "project") return categoryLabels.project;
  return categoryLabels[opts.category ?? "other"];
}
