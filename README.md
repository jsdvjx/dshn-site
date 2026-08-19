# dshn-site — ds.hn 官网

[ds.hn](https://ds.hn)（dshn，dsh 公网转发插件）的官方网站：项目背景、能力介绍、
工作原理、注册与上手引导、安全边界与 FAQ。

纯静态、零构建、单文件（`index.html` 内联全部样式），深/浅色随系统自适应。

## 本地预览

```sh
open index.html            # 或任何静态服务器：
python3 -m http.server 8000
```

## 部署

推送到 `main` 后，`.github/workflows/pages.yml` 自动发布到 GitHub Pages。

要把站点挂到 `ds.hn` 顶级域，有两个选项（DNS 都已在 Cloudflare）：

1. **Cloudflare 指向 GitHub Pages**：把 apex 的回源从中继改为 Pages，并在仓库
   Pages 设置里配置自定义域名。注意 apex 目前由 Origin Rule 路由到中继 `:8787`，
   需要为 apex 单独豁免。
2. **由中继直接托管**：把 `index.html` 作为中继在 apex（未匹配任何子域时）的
   落地页返回，站点与隧道同源，无需动 DNS。

产品仓库（插件 + 中继源码）在私有 monorepo `dshn` 中，与本站分离。
