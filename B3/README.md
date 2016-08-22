**管理员账户表(admins)**

字段名|数据类型|说明
:-:|:-:|:-:
id|int|管理员id（主键，唯一，id=1）
username|varchar()|管理员名称(admin)
password|varchar()|管理员密码(admin)
created_at|datetime|创建时间
updated_at|datetime|修改时间

**文章表(posts)**

字段名|数据类型|说明
:-:|:-:|:-:
id|int|文章id（主键，自增）
title|varchar()|文章标题
content|varchar()|文章内容
p_type|int|文章类型
created_at|datetime|文章创建时间
updated_at|datetime|文章修改时间

**留言表(comments)**

字段名|数据类型|说明
:-:|:-:|:-:
id|int|留言id（主键，自增）
post_id|int|文章id（外键）
content|varchar()|留言内容
email|varchar()|留言者e-mail
created_at|datetime|留言创建时间
updated_at|datetime|留言修改时间
passed|int|留言是否通过审核（0：未通过；1：通过）

**反馈表(feedbacks)**

字段名|数据类型|说明
:-:|:-:|:-:
id|int|反馈id（主键，自增）
content|varchar()|反馈内容
email|varchar()|反馈者e-mail
created_at|datetime|反馈创建时间
updated_at|datetime|反馈修改时间
