**管理员账户表(admins)**

字段名|数据类型|说明
:-:|:-:|:-:
id|int|管理员id（主键，自增）
username|varchar()|管理员名称（不能重复）
password|varchar()|管理员密码

**文章表(posts)**

字段名|数据类型|说明
-|-|-
id|int|文章id（主键，自增）
user_id|int|文章创建者id（外键）
content|varchar()|文章内容
created_at|datetime|文章创建时间

**留言表(comments)**

字段名|数据类型|说明
:-:|:-:|:-:
id|int|留言id（主键，自增）
post_id|int|文章id（外键）
user_id|int|留言者id（外键）
content|varchar()|留言内容
created_at|datetime|留言创建时间
passed|int|留言是否通过审核（0：未通过；1：通过）

**反馈表(feedbacks)**

字段名|数据类型|说明
:-:|:-:|:-:
id|int|反馈id（主键，自增）
user_id|int|反馈者id（外键）
content|varchar()|反馈内容
created_at|datetime|反馈时间
