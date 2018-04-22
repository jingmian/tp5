<?php 
return [
    // 视图输出字符串内容替换
    'view_replace_str'       => [
    "__ADMIN__MR__" => "/default/admin",
    "__ADMIN__"     => "/" . MS_TEMPLATE . "/admin",
    "__JS__"        => "/" . MS_TEMPLATE . "/admin/js",
    "__CSS__"       => "/" . MS_TEMPLATE . "/admin/css",
    "__IMG__"       => "/" . MS_TEMPLATE . "/admin/img",
    "__EXT__"       => "/extend",
    "__UP__"        => APP_UPLOAD,
    ],
];