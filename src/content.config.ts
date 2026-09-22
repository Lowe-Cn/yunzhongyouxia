import { defineCollection, z } from "astro:content";
import { glob } from "astro/loaders";

const projects = defineCollection({
  loader: glob({ pattern: "**/*.md", base: "./src/content/projects" }),
  schema: z.object({
    title: z.string(),
    summary: z.string(),
    // game = 游戏，project = 其他项目
    type: z.enum(["game", "project"]),
    // 游戏细分类：试玩广告只是其中一类
    category: z.enum(["playable-ad", "original", "other"]).optional(),
    date: z.coerce.date(),
    tags: z.array(z.string()).default([]),
    // 站内试玩路径，例如 /games/chop-build.html
    play: z.string().optional(),
    // 可选：外链演示地址
    demo: z.string().url().optional(),
    // 可选：源码地址
    repo: z.string().url().optional(),
    featured: z.boolean().default(false),
    cover: z.string().optional(),
    // 横竖屏：portrait = 竖屏（手机框居中），landscape = 横屏（铺满）
    orientation: z.enum(["portrait", "landscape"]).default("landscape"),
  }),
});

const ideas = defineCollection({
  loader: glob({ pattern: "**/*.md", base: "./src/content/ideas" }),
  schema: z.object({
    title: z.string(),
    summary: z.string(),
    date: z.coerce.date(),
    tags: z.array(z.string()).default([]),
  }),
});

export const collections = { projects, ideas };
