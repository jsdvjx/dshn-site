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

**正式站 <https://ds.hn> 由 dshn 中继直接托管**（2026-08-19 上线）：relay 通过
`DSHN_SITE=/opt/dshn/site/index.html` 在裸 apex 返回本页（按 mtime 热更新，无需
重启服务），`www.ds.hn` 301 到 apex。发布更新：

```sh
./deploy.sh    # scp index.html 到服务器，立即生效
```

另外推送到 `main` 后，`.github/workflows/pages.yml` 会同步发布一份预览镜像到
GitHub Pages（<https://jsdvjx.github.io/dshn-site/>）。

产品仓库（插件 + 中继源码）在私有 monorepo `dshn` 中，与本站分离。
