> May 30, 2019 15:42
>
> 可以直接在`style`中选择语言,根据报错,选择相应的依赖即可
>
> May 30, 2019 11:54
>
> 在`vue init webpack`创建的脚手架工程中怎么引入`less`,`sacc`,`scss`
>
> 以及用来了解 less sass scss 
>
> 的工程

[TOC]
<!-- toc -->

# less

## 依赖

```bash
# 引入必要的依赖
yarn add less less-loader -D
```

##  变量

使用@定义,属性值中直接使用 @variables name 引用

变量也可以使用在选择器,url,import语句中

## Parent Selectors &

代表父级选择器

> 用于伪类
>
> &:after

& 用于产生重复的类名	

```less
.button {
  &-ok {
    background-image: url("ok.png");
  }
  &-cancel {
    background-image: url("cancel.png");
  }

  &-custom {
    background-image: url("custom.png");
  }
}

// result
.button-ok {
  background-image: url("ok.png");
}
.button-cancel {
  background-image: url("cancel.png");
}
.button-custom {
  background-image: url("custom.png");
}
```



# sass

## 依赖

```bash
yarn add sass sass-loader node-sass -D
```

## 语法

使用缩进的方式	

# scss

~~脚手架默认支持css预处理语言~~

~~可以直接使用不用安装依赖~~

因为先在sass分支中安装了必要的依赖,并且git忽略了`node_module` 所以切换到此分支的时候,可以直接编译运行

scss 需要安装 `sass-loader` 和 `node-sass`