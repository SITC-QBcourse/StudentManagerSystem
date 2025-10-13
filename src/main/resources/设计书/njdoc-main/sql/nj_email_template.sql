/* 
nj_email_template
1	メールテンプレートID	email_template_id	int auto_increment
2	メールテンプレート名称	email_template_name	varchar(64)
3	タイトル中文	title_cn	varchar(1000)
4	タイトル日本語	title_jp	varchar(1000)
5	本文中文	text_cn	varchar(1000)
6	本文日本語	text_jp	varchar(1000)
7	削除フラグ	del_flg	int
8	登録日時	register_time	datetime
9	更新日時	update_time	timestamp
*/
-- 删除nj_email_template表
drop table if exists nj_email_template;
-- 创建nj_email_template表
create table nj_email_template (
    -- template_id 主键
    email_template_id int primary key auto_increment NOT NULL,
    email_template_name varchar(64) NOT NULL,
    title_cn varchar(100) NOT NULL,
    title_jp varchar(100) NOT NULL,
    text_cn varchar(1000) NOT NULL,
    text_jp varchar(1000) NOT NULL,
    del_flg int NOT NULL,
    register_time datetime NOT NULL,
    update_time	timestamp NOT NULL
);
-- 添加数据
insert into nj_email_template (email_template_name, title_cn, title_jp,text_cn,text_jp,del_flg,register_time,update_time)
values 
       ("新規登録", "Email 地址验证通知","Emailアドレス認証のお知らせ",
       "To:希望注册账户的人士

请通过下记的URL完成账户的激活。
-----------------------------------------------------------------------------
$reserve.token
-----------------------------------------------------------------------------
注意:请在24小时内注册。
        超过24小时后将无法访问上述URL。

以上，谢谢！
-------------------------------------------
■如有疑问・咨询，请联系如下：
NJ-Service 客户中心
咨询网址（https://NJ-Service.jp/support_contact）
营业时间：工作日09:00～18:00※周六日节假日、年末年初、维护日除外
-------------------------------------------
",
 "アカウント登録を希望される方へ

下記のURLよりアカウントのアクティブ化を完了してください。
-----------------------------------------------------------------------------
$reserve.token
-----------------------------------------------------------------------------
24時間以内に本登録をお願いいたします。
24時間を超えると上記URLへはアクセスできなくなりますので、ご注意ください。

以上、よろしくお願いいたします。
-------------------------------------------
■ご質問・お問い合わせはこちら
NJ-Service　カスタマーセンター
お問い合わせ（https://NJ-Service.jp/support_contact）
営業時間：平日09:00～18:00　※土日祝、年末年始、メンテナンス日は除く
-------------------------------------------
",
       "0","2023/07/07","2023/07/07"),
       ("注文済", "〈$reserve.companyKj企業〉订单完了通知","〈$reserve.companyKj企業〉注文済のお知らせ", 
       "尊敬的$reserve.companyKj企业：
您好！

来自$reserve.nameKj网红的订单完了通知。
非常感谢本次、$reserve.nameKj网红对贵司商品的购买！
为了此次订购的顺利推进，现通知如下：

1：请尽快办理此次订单承认手续。
2：如果订购的商品订单被贵司否认，则本次订单将被取消。
     另外，如果在3天期限内，贵司没有对本订单进行承认或者订单被否认，则本次订单也将被取消。

请继续多多关照，谢谢！
-------------------------------------------
【商品信息】
订单ID：$reserve.orderId
商品名：$reserve.productName
商品URL：$reserve.staticUrl
运费负担：$reserve.discount
折扣：$reserve.discount
价格（含税）：$reserve.price 日元（含税）
-------------------------------------------
【用户信息】
用户姓名：$reserve.nameKj
地址：$reserve.address
联系电话：$reserve.tel
【配送地址信息】
配送者姓名：$reserve.nameKj
邮编号码：$reserve.post
地址：$reserve.address
希望配送时间段：$reserve.deliveryTime～$reserve.deliveryTime
-------------------------------------------
■如有疑问・咨询，请联系如下：
NJ-Service 客户中心
咨询网址（https://NJ-Service.jp/support_contact）
营业时间：工作日09:00～18:00※周六日节假日、年末年初、维护日除外
-------------------------------------------
",
       "$reserve.companyKj 企業へ

いつもお世話になっております。
$reserve.nameKjタレントからの注文済のお知らせ。
この度は$reserve.nameKjタレントが貴社の商品をご注文いただき、誠にありがとうございます。
注文手続きを進めるために、ご連絡いたします。

1：できるだけ早く今回の注文承認手続きを進めてください。
2：もしご注文いただいた商品が否認の場合は、本注文がキャンセルとします。
     さらに、3日期間日数に承認または否認ともしない場合は、本注文もキャンセルとします。

今後ともよろしくお願いいたします
-------------------------------------------
【商品情報】
注文ID：$reserve.orderId
商品名　：$reserve.productName
静的URL　：$reserve.staticUrl
送料負担　：$reserve.postage
割引：$reserve.discount
価格（税込）：$reserve.price 円（税込）
-------------------------------------------
【ご利用者様情報】
利用者名：$reserve.nameKj
住所：$reserve.address
電話番号：$reserve.tel
【配送先情報】
配送先名：$reserve.nameKj
郵便番号：$reserve.post
住所：$reserve.address
配送希望時間帯：$reserve.deliveryTime～$reserve.deliveryTime
-------------------------------------------
■ご質問・お問い合わせはこちら
NJ-Service　カスタマーセンター
お問い合わせ（https://NJ-Service.jp/support_contact）
営業時間：平日09:00～18:00　※土日祝、年末年始、メンテナンス日は除く
-------------------------------------------
",
       "0","2023/07/07","2023/07/07"),
       ("注文済", "〈$reserve.nameKj网红〉订单完了通知","〈$reserve.nameKjタレント〉注文済のお知らせ", 
       "尊敬的$reserve.nameKj网红：
您好！

来自$reserve.companyKj企业的订单完了通知。
非常感谢本次、$reserve.companyKj企业对贵司商品的购买！
为了此次订购的顺利推进，现通知如下：

1：请尽快办理此次订单的承认手续。
2：如果订购的商品订单被贵司否认，则本次订单将被取消。
     另外，如果在3天期限内，贵司没有对本订单进行承认或者订单被否认，则本次订单也将被取消。

请继续多多关照，谢谢！
-------------------------------------------
【商品信息】
订单ID：$reserve.orderId
商品名：$reserve.productName
商品URL：$reserve.staticUrl
运费负担：$reserve.discount
折扣：$reserve.discount
价格（含税）：$reserve.price 日元（含税）
-------------------------------------------
【用户信息】
用户姓名：$reserve.companyKj
地址：$reserve.address
联系电话：$reserve.tel
【配送地址信息】
配送者姓名：$reserve.companyKj
邮编号码：$reserve.post
地址：$reserve.address
希望配送时间段：$reserve.deliveryTime～$reserve.deliveryTime
-------------------------------------------
■如有疑问・咨询，请联系如下：
NJ-Service 客户中心
咨询网址（https://NJ-Service.jp/support_contact）
营业时间：工作日09:00～18:00※周六日节假日、年末年初、维护日除外
-------------------------------------------
", 
       "$reserve.nameKj タレントへ

いつもお世話になっております。
$reserve.companyKj企業からの注文済のお知らせ。
この度は$reserve.companyKj企業が貴社の商品をご注文いただき、誠にありがとうございます。
注文手続きを進めるために、ご連絡いたします。

1：できるだけ早く今回の注文承認手続きを進めてください。
2：もしご注文いただいた商品が否認の場合は、本注文がキャンセルとします。
     さらに、3日期間日数に承認または否認ともしない場合は、本注文もキャンセルとします。

今後ともよろしくお願いいたします
-------------------------------------------
【商品情報】
注文ID：$reserve.orderId
商品名　：$reserve.productName
静的URL　：$reserve.staticUrl
送料負担　：$reserve.postage
割引：$reserve.discount
価格（税込）：$reserve.price 円（税込）
-------------------------------------------
【ご利用者様情報】
利用者名：$reserve.companyKj
住所：$reserve.address
電話番号：$reserve.tel
【配送先情報】
配送先名：$reserve.companyKj
郵便番号：$reserve.post
住所：$reserve.address
配送希望時間帯：$reserve.deliveryTime～$reserve.deliveryTime
-------------------------------------------
■ご質問・お問い合わせはこちら
NJ-Service　カスタマーセンター
お問い合わせ（https://NJ-Service.jp/support_contact）
営業時間：平日09:00～18:00　※土日祝、年末年始、メンテナンス日は除く
-------------------------------------------
",
       "0","2023/07/07","2023/07/07"),
       ("承認済", "〈$reserve.companyKj企业〉订单承认完了通知","〈$reserve.companyKj企業〉注文承認済のお知らせ", 
       "尊敬的$reserve.companyKj企业：
您好！

来自$reserve.nameKj网红的订单承认通知。
非常感谢本次、您对$reserve.nameKj网红商品的购买！
根据此次购买商品的订单审查结果：
现通知您：本次商品的订单承认手续已经顺利完成了。

后续，我们将准备商品的发货安排，
请耐心等待商品的到达。

今后请继续多多关照，谢谢！
----------------------------------
【商品信息】
订单ID：$reserve.orderId
商品名：$reserve.productName
商品URL：$reserve.staticUrl
运费负担：$reserve.discount
折扣：$reserve.discount
价格（含税）：$reserve.price 日元（含税）
----------------------------------
【用户信息】
用户姓名：$reserve.companyKj
地址：$reserve.address
电话：$reserve.tel
【配送地址信息】
配送者姓名：$reserve.companyKj
邮编号码：$reserve.post
地址：$reserve.address
希望配送时间段：$reserve.deliveryTime～$reserve.deliveryTime
-------------------------------------------
■如有疑问・咨询，请联系如下：
NJ-Service 客户中心
咨询网址（https://NJ-Service.jp/support_contact）
营业时间：工作日09:00～18:00※周六日节假日、年末年初、维护日除外
-------------------------------------------
", "$reserve.companyKj企業へ

いつもお世話になっております。
$reserve.nameKjタレントからの注文承認済のお知らせ。
この度は$reserve.nameKjタレントの商品をご注文いただき、誠にありがとうございます。
ご注文いただいた商品にて審査させていただきました結果、
無事に商品の承認手続きが完了いたしましたので、ご連絡いたします。

この後、発送の準備を進めさせていただきますので、
商品到着まで今しばらくお待ちくださいませ。

今後ともよろしくお願いいたします
-------------------------------------------
【商品情報】
注文ID：$reserve.orderId
商品名　：$reserve.productName
静的URL　：$reserve.staticUrl
送料負担　：$reserve.postage
割引：$reserve.discount
価格（税込）：$reserve.price 円（税込）
-------------------------------------------
【ご利用者様情報】
利用者名：$reserve.companyKj
住所：$reserve.address
電話番号：$reserve.tel
【配送先情報】
配送先名：$reserve.companyKj
郵便番号：$reserve.post
住所：$reserve.address
配送希望時間帯：$reserve.deliveryTime～$reserve.deliveryTime
-------------------------------------------
■ご質問・お問い合わせはこちら
NJ-Service　カスタマーセンター
お問い合わせ（https://NJ-Service.jp/support_contact）
営業時間：平日09:00～18:00　※土日祝、年末年始、メンテナンス日は除く
-------------------------------------------	
",
       "0","2023/07/07","2023/07/07"),
       ("承認済", "〈$reserve.nameKj网红〉订单承认完了通知","〈$reserve.nameKjタレント〉注文承認済のお知らせ", 
       "尊敬的$reserve.nameKj网红：
您好！

来自$reserve.companyKj企业的订单承认通知。
非常感谢本次、您对$reserve.companyKj企业商品的购买！
根据此次购买商品的订单审查结果：
本次商品的订单承认手续已经顺利完成了。

后续，我们将准备商品的发货安排，
请耐心等待商品的到达。

今后请继续多多关照，谢谢！
----------------------------------
【商品信息】
订单ID：$reserve.orderId
商品名：$reserve.productName
商品URL：$reserve.staticUrl
运费负担：$reserve.discount
折扣：$reserve.discount
价格（含税）：$reserve.price 日元（含税）
----------------------------------
【用户信息】
用户姓名：$reserve.nameKj
地址：$reserve.address
电话：$reserve.tel
【配送地址信息】
配送者姓名：$reserve.nameKj
邮编号码：$reserve.post
地址：$reserve.address
希望配送时间段：$reserve.deliveryTime～$reserve.deliveryTime
-------------------------------------------
■如有疑问・咨询，请联系如下：
NJ-Service 客户中心
咨询网址（https://NJ-Service.jp/support_contact）
营业时间：工作日09:00～18:00※周六日节假日、年末年初、维护日除外
-------------------------------------------
", "$reserve.nameKjタレントへ

いつもお世話になっております。
$reserve.companyKj企業からの注文承認済のお知らせ。
この度は$reserve.companyKj企業の商品をご注文いただき、誠にありがとうございます。
ご注文いただいた商品にて審査させていただきました結果、
無事に商品の承認手続きが完了いたしましたので、ご連絡いたします。

この後、発送の準備を進めさせていただきますので、
商品到着まで今しばらくお待ちくださいませ。

今後ともよろしくお願いいたします
-------------------------------------------
【商品情報】
注文ID：$reserve.orderId
商品名　：$reserve.productName
静的URL　：$reserve.staticUrl
送料負担　：$reserve.postage
割引：$reserve.discount
価格（税込）：$reserve.price 円（税込）
-------------------------------------------
【ご利用者様情報】
利用者名：$reserve.nameKj
住所：$reserve.address
電話番号：$reserve.tel
【配送先情報】
配送先名：$reserve.nameKj
郵便番号：$reserve.post
住所：$reserve.address
配送希望時間帯：$reserve.deliveryTime～$reserve.deliveryTime
-------------------------------------------
■ご質問・お問い合わせはこちら
NJ-Service　カスタマーセンター
お問い合わせ（https://NJ-Service.jp/support_contact）
営業時間：平日09:00～18:00　※土日祝、年末年始、メンテナンス日は除く
-------------------------------------------
",
       "0","2023/07/07","2023/07/07"),
       ("承認済", "〈$reserve.nameKj管理者〉网红订单承认完了通知","〈$reserve.nameKj管理者〉タレント注文承認済のお知らせ", 
       "尊敬的$reserve.nameKj管理者：
您好！


关于以下订单：已经顺利完成了订单订购和承认手续。
今后请继续多多关照，谢谢！

买方：$reserve.nameKj网红
卖方：$reserve.companyKj企业
----------------------------------
【商品信息】
订单ID：$reserve.orderId
订购日期：$reserve.orderDate
承认日期：$reserve.approvalDate
商品名：$reserve.productName
商品URL：$reserve.staticUrl
运费负担：$reserve.discount
折扣：$reserve.discount
价格（含税）：$reserve.price 日元（含税）
----------------------------------
【买方：网红信息】
网红名：$reserve.nameKj
地址：$reserve.address
电话：$reserve.tel

【卖方：企业信息】
企业名：$reserve.companyKj
地址：$reserve.address
电话：$reserve.tel

【配送地址：艺人信息】
配送者姓名：$reserve.nameKj
邮编号码：$reserve.post
地址：$reserve.address
希望配送时间段：$reserve.deliveryTime～$reserve.deliveryTime
-------------------------------------------
■如有疑问・咨询，请联系如下：
NJ-Service 客户中心
咨询网址（https://NJ-Service.jp/support_contact）
营业时间：工作日09:00～18:00※周六日节假日、年末年初、维护日除外
-------------------------------------------
", "$reserve.nameKj管理者へ

いつもお世話になっております。
下記の注文について、
無事に注文と承認の手続きが完了いたしましたので、ご連絡いたします。
今後ともよろしくお願いいたします

買い手:$reserve.nameKjタレント
売り手:$reserve.companyKj企業
-------------------------------------------
【商品情報】
注文ID：$reserve.orderId
注文日：$reserve.orderDate
承認日：$reserve.approvalDate
商品名　：$reserve.productName
静的URL　：$reserve.staticUrl
送料負担　：$reserve.postage
割引：$reserve.discount
価格（税込）：$reserve.price 円（税込）
-------------------------------------------
【買い手：タレント情報】
タレント名：$reserve.nameKj
住所：$reserve.address
電話番号：$reserve.tel

【売り手：企業情報】
企業名：$reserve.companyKj
住所：$reserve.address
電話番号：$reserve.tel

【配送先：タレント情報】
配送先名：$reserve.nameKj
郵便番号：$reserve.post
住所：$reserve.address
配送希望時間帯：$reserve.deliveryTime～$reserve.deliveryTime
-------------------------------------------
■ご質問・お問い合わせはこちら
NJ-Service　カスタマーセンター
お問い合わせ（https://NJ-Service.jp/support_contact）
営業時間：平日09:00～18:00　※土日祝、年末年始、メンテナンス日は除く
-------------------------------------------
",
       "0","2023/07/07","2023/07/07"),
       ("承認済", "〈$reserve.nameKj管理者〉企业订单承认完了通知","〈$reserve.nameKj管理者〉企業注文承認済のお知らせ", 
       "尊敬的$reserve.nameKj管理者：
您好！

现通知您：
关于以下订单：已经顺利完成了订单订购和承认手续。
今后请继续多多关照，谢谢！

买方：$reserve.companyKj企业
卖方：$reserve.nameKj网红
----------------------------------
【商品信息】
订单ID：$reserve.orderId
订购日期：$reserve.orderDate
承认日期：$reserve.approvalDate
商品名：$reserve.productName
商品URL：$reserve.staticUrl
运费负担：$reserve.discount
折扣：$reserve.discount
价格（含税）：$reserve.price 日元（含税）
----------------------------------
【买方：企业信息】
网红名：$reserve.nameKj
地址：$reserve.address
电话：$reserve.tel

【卖方：网红信息】
企业名：$reserve.companyKj
地址：$reserve.address
电话：$reserve.tel

【配送地址：企业信息】
配送者姓名：$reserve.companyKj
邮编号码：$reserve.post
地址：$reserve.address
希望配送时间段：$reserve.deliveryTime～$reserve.deliveryTime
-------------------------------------------
■如有疑问・咨询，请联系如下：
NJ-Service 客户中心
咨询网址（https://NJ-Service.jp/support_contact）
营业时间：工作日09:00～18:00※周六日节假日、年末年初、维护日除外
-------------------------------------------
", "$reserve.nameKj管理者へ

いつもお世話になっております。
下記の注文について、
無事に注文と承認の手続きが完了いたしましたので、お知らせ。
今後ともよろしくお願いいたします

買い手:$reserve.companyKj企業
売り手:$reserve.nameKjタレント
-------------------------------------------
【商品情報】
注文ID：$reserve.orderId
注文日：$reserve.orderDate
承認日：$reserve.approvalDate
商品名　：$reserve.productName
静的URL　：$reserve.staticUrl
送料負担　：$reserve.postage
割引：$reserve.discount
価格（税込）：$reserve.price 円（税込）
-------------------------------------------
【買い手：企業情報】
企業名：$reserve.nameKj
住所：$reserve.address
電話番号：$reserve.tel

【売り手：タイトル情報】
タレント名：$reserve.nameKj
住所：$reserve.address
電話番号：$reserve.tel

【配送先：企業情報】
配送先名：$reserve.companyKj
郵便番号：$reserve.post
住所：$reserve.address
配送希望時間帯：$reserve.deliveryTime～$reserve.deliveryTime
-------------------------------------------
■ご質問・お問い合わせはこちら
NJ-Service　カスタマーセンター
お問い合わせ（https://NJ-Service.jp/support_contact）
営業時間：平日09:00～18:00　※土日祝、年末年始、メンテナンス日は除く
-------------------------------------------
",
       "0","2023/07/07","2023/07/07"),
       ("公開済", "〈$reserve.companyKj企业〉订单公开完了通知","〈$reserve.companyKj企業〉注文公開済のお知らせ", 
       "尊敬的$reserve.companyKj企业：
您好！

来自$reserve.nameKj网红的订单公开通知。
购买商品的订单审查结果：
本次商品的公开手续已经顺利完成了。
公开信息如下：

公开信息
-------------------------------------------
订单ID：$reserve.orderId
商品名：$reserve.productName
观众人数：$reserve.viewNumber
播放次数：$reserve.playbackCount
公开网址：$reserve.publicUrl

今后请继续多多关照，谢谢！
-------------------------------------------
■如有疑问・咨询，请联系如下：
NJ-Service 客户中心
咨询网址（https://NJ-Service.jp/support_contact）
营业时间：工作日09:00～18:00※周六日节假日、年末年初、维护日除外
-------------------------------------------
", "$reserve.companyKj企業へ

いつもお世話になっております。
$reserve.nameKjタレントからの注文公開済のお知らせ。
ご注文いただいた商品にて審査させていただきました結果、
無事に商品の公開手続きが完了いたしましたので、ご連絡いたします。
公開情報は下記となります。

公開情報
-------------------------------------------
注文ID：$reserve.orderId
商品名　：$reserve.productName
視聴人数：$reserve.viewNumber
再生回数：$reserve.playbackCount
公開URL：$reserve.publicUrl

今後ともよろしくお願いいたします
-------------------------------------------
■ご質問・お問い合わせはこちら
NJ-Service　カスタマーセンター
お問い合わせ（https://NJ-Service.jp/support_contact）
営業時間：平日09:00～18:00　※土日祝、年末年始、メンテナンス日は除く
-------------------------------------------
",
       "0","2023/07/07","2023/07/07"),
       ("公開済", "〈$reserve.nameKj网红〉订单公开完了通知","〈$reserve.nameKjタレント〉注文公開済のお知らせ", 
       "尊敬的$reserve.nameKj网红：
您好！

来自$reserve.companyKj企业的订单公开通知邮件。
根据此次购买商品的订单审查结果：
现通知您：本次商品的公开手续已经顺利完成了。
公开信息如下：

公开信息
-------------------------------------------
订单ID：$reserve.orderId
商品名：$reserve.productName
观众人数：$reserve.viewNumber
播放次数：$reserve.playbackCount
公开网址：$reserve.publicUrl

今后请继续多多关照，谢谢！
-------------------------------------------
■如有疑问・咨询，请联系如下：
NJ-Service 客户中心
咨询网址（https://NJ-Service.jp/support_contact）
营业时间：工作日09:00～18:00※周六日节假日、年末年初、维护日除外
-------------------------------------------
", "$reserve.nameKjタレントへ

いつもお世話になっております。
$reserve.companyKj企業からの注文公開済のお知らせ。
ご注文いただいた商品にて審査させていただきました結果、
無事に商品の公開手続きが完了いたしましたので、ご連絡いたします。
公開情報は下記となります。

公開情報
-------------------------------------------
注文ID：$reserve.orderId
商品名　：$reserve.productName
視聴人数：$reserve.viewNumber
再生回数：$reserve.playbackCount
公開URL：$reserve.publicUrl

今後ともよろしくお願いいたします
-------------------------------------------
■ご質問・お問い合わせはこちら
NJ-Service　カスタマーセンター
お問い合わせ（https://NJ-Service.jp/support_contact）
営業時間：平日09:00～18:00　※土日祝、年末年始、メンテナンス日は除く
-------------------------------------------
",
       "0","2023/07/07","2023/07/07"),
       ("公開済", "〈$reserve.nameKj管理者〉企业订单公开完了通知","〈$reserve.nameKj管理者〉企業注文公開済のお知らせ", 
       "尊敬的$reserve.nameKj管理者：
您好！

现通知您：
关于以下订单：已经顺利完成了订单公开手续。
今后请继续多多关照，谢谢！

公开信息如下：

公开信息
-------------------------------------------
买方：$reserve.companyKj企业
卖方：$reserve.nameKj网红
订单ID：$reserve.orderId
商品名：$reserve.productName
观众人数：$reserve.viewNumber
播放次数：$reserve.playbackCount
公开网址：$reserve.publicUrl
-------------------------------------------
■如有疑问・咨询，请联系如下：
NJ-Service 客户中心
咨询网址（https://NJ-Service.jp/support_contact）
营业时间：工作日09:00～18:00※周六日节假日、年末年初、维护日除外
-------------------------------------------
", "$reserve.nameKj管理者へ

いつもお世話になっております。
下記の注文について、
無事に注文の公開手続きが完了いたしましたので、お知らせいたします。
今後ともよろしくお願いいたします

公開情報は下記となります。

公開情報
-------------------------------------------
買い手:$reserve.companyKj企業
売り手:$reserve.nameKjタレント
注文ID：$reserve.orderId
商品名　：$reserve.productName
視聴人数：$reserve.viewNumber
再生回数：$reserve.playbackCount
公開URL：$reserve.publicUrl
-------------------------------------------
■ご質問・お問い合わせはこちら
NJ-Service　カスタマーセンター
お問い合わせ（https://NJ-Service.jp/support_contact）
営業時間：平日09:00～18:00　※土日祝、年末年始、メンテナンス日は除く
-------------------------------------------
",
       "0","2023/07/07","2023/07/07"),
       ("公開済", "〈$reserve.nameKj管理者〉网红订单公开完了通知","〈$reserve.nameKj管理者〉タレント注文公開済のお知らせ", 
       "尊敬的$reserve.nameKj管理者：
您好！

现通知您：
关于以下订单：已经顺利完成了订单公开手续。
今后请继续多多关照，谢谢！

公开信息如下：

公开信息
-------------------------------------------
买方：$reserve.nameKj网红
卖方：$reserve.companyKj企业
订单ID：$reserve.orderId
商品名：$reserve.productName
观众人数：$reserve.viewNumber
播放次数：$reserve.playbackCount
公开网址：$reserve.publicUrl
-------------------------------------------
■如有疑问・咨询，请联系如下：
NJ-Service 客户中心
咨询网址（https://NJ-Service.jp/support_contact）
营业时间：工作日09:00～18:00※周六日节假日、年末年初、维护日除外
-------------------------------------------
", "$reserve.nameKj管理者へ

いつもお世話になっております。
下記の注文について、
無事に注文の公開手続きが完了いたしましたので、お知らせいたします。
今後ともよろしくお願いいたします

公開情報は下記となります。

公開情報
-------------------------------------------
買い手:$reserve.nameKjタレント
売り手:$reserve.companyKj企業
注文ID：$reserve.orderId
商品名　：$reserve.productName
視聴人数：$reserve.viewNumber
再生回数：$reserve.playbackCount
公開URL：$reserve.publicUrl
-------------------------------------------
■ご質問・お問い合わせはこちら
NJ-Service　カスタマーセンター
お問い合わせ（https://NJ-Service.jp/support_contact）
営業時間：平日09:00～18:00　※土日祝、年末年始、メンテナンス日は除く
-------------------------------------------
",
       "0","2023/07/07","2023/07/07"),
       ("否認済", "〈$reserve.companyKj企业〉订单否认完了通知","〈$reserve.companyKj企業〉注文否認済のお知らせ", 
       "尊敬的$reserve.companyKj企业：
您好！

来自$reserve.nameKj网红的订单通知。
非常感谢您此次对$reserve.nameKj网红商品的购买！
根据本次购买商品的订单审查结果：
现通知您：很遗憾，本次订购被否认了。

今后请继续多多关照，谢谢！
-------------------------------------------
■如有疑问・咨询，请联系如下：
NJ-Service 客户中心
咨询网址（https://NJ-Service.jp/support_contact）
营业时间：工作日09:00～18:00※周六日节假日、年末年初、维护日除外
-------------------------------------------
", "$reserve.companyKj企業へ

いつもお世話になっております。
$reserve.nameKjタレントからの注文否認済のお知らせ。
この度は$reserve.nameKjタレントの商品をご注文いただき、誠にありがとうございます。
ご注文いただいた商品にて審査させていただきました結果、
残念なことに、今回の注文を否認しました。ご連絡いたします。

今後ともよろしくお願いいたします
-------------------------------------------
■ご質問・お問い合わせはこちら
NJ-Service　カスタマーセンター
お問い合わせ（https://NJ-Service.jp/support_contact）
営業時間：平日09:00～18:00　※土日祝、年末年始、メンテナンス日は除く
-------------------------------------------
",
       "0","2023/07/07","2023/07/07"),
       ("否認済", "〈$reserve.nameKj网红〉订单否认完了通知","〈$reserve.nameKjタレント〉注文否認済のお知らせ", 
       "尊敬的$reserve.nameKj网红：
您好！

来自$reserve.companyKj企业的订单否认通知。
非常感谢您此次对$reserve.companyKj企业商品的购买！
根据本次购买商品的订单审查结果：
现通知您：很遗憾，本次订购被否认了。

今后请继续多多关照，谢谢！
-------------------------------------------
■如有疑问・咨询，请联系如下：
NJ-Service 客户中心
咨询网址（https://NJ-Service.jp/support_contact）
营业时间：工作日09:00～18:00※周六日节假日、年末年初、维护日除外
-------------------------------------------
", "$reserve.nameKj タレントへ

いつもお世話になっております。
$reserve.companyKj企業からの注文否認済のお知らせ。
この度は$reserve.companyKj企業の商品をご注文いただき、誠にありがとうございます。
ご注文いただいた商品にて審査させていただきました結果、
残念なことに、今回の注文を否認しました。ご連絡いたします。

今後ともよろしくお願いいたします
-------------------------------------------
■ご質問・お問い合わせはこちら
NJ-Service　カスタマーセンター
お問い合わせ（https://NJ-Service.jp/support_contact）
営業時間：平日09:00～18:00　※土日祝、年末年始、メンテナンス日は除く
-------------------------------------------
",
       "0","2023/07/07","2023/07/07");
select * from nj_email_template;



select * from nj_email_template;


insert into nj_email_template (email_template_name, title_cn, title_jp,text_cn,text_jp,del_flg,register_time,update_time)
values ("管理者ユーザー申請", " Email 地址验证通知（管理者用户申请）","Emailアドレス認証のお知らせ（管理者ユーザー申請）",
"To:希望注册账户的人士

请通过下记的URL完成账户的激活。
-----------------------------------------------------------------------------
http://localhost:8080/admin/adminUserSingup?confirmCode=$reserve.token
-----------------------------------------------------------------------------
注意:请在24小时内注册,超过24小时后将无法访问上述URL。

以上，谢谢！
-------------------------------------------
■如有疑问・咨询，请联系如下：
NJ-Service 客户中心
咨询网址（https://NJ-Service.jp/support_contact）
营业时间：工作日09:00～18:00※周六日节假日、年末年初、维护日除外
-------------------------------------------
",
"アカウント登録を希望される方へ

下記のURLよりアカウントのアクティブ化を完了してください。
-----------------------------------------------------------------------------
http://localhost:8080/admin/adminUserSingup?confirmCode=$reserve.token
-----------------------------------------------------------------------------
24時間以内に本登録をお願いいたします。
24時間を超えると上記URLへはアクセスできなくなりますので、ご注意ください。

以上、よろしくお願いいたします。
-------------------------------------------
■ご質問・お問い合わせはこちら
NJ-Service　カスタマーセンター
お問い合わせ（https://NJ-Service.jp/support_contact）
営業時間：平日09:00～18:00　※土日祝、年末年始、メンテナンス日は除く
-------------------------------------------
",
"0","2023/07/07","2023/07/07");
insert into nj_email_template (email_template_name, title_cn, title_jp,text_cn,text_jp,del_flg,register_time,update_time)
values ("企業ユーザー申請"," Email地址验证通知（企业用户申请）","Emailアドレス認証のお知らせ（企業ユーザー申請）",
"To:希望注册账户的人士

请通过下记的URL完成账户的激活。
-----------------------------------------------------------------------------
http://localhost:8080/company/companyUserSingup
-----------------------------------------------------------------------------
注意:请在24小时内注册,超过24小时后将无法访问上述URL。

以上，谢谢！
-------------------------------------------
■如有疑问・咨询，请联系如下：
NJ-Service 客户中心
咨询网址（https://NJ-Service.jp/support_contact）
营业时间：工作日09:00～18:00※周六日节假日、年末年初、维护日除外
-------------------------------------------
",
"アカウント登録を希望される方へ

下記のURLよりアカウントのアクティブ化を完了してください。
-----------------------------------------------------------------------------
http://localhost:8080/company/companyUserSingup?confirmCode=$reserve.token
-----------------------------------------------------------------------------
24時間以内に本登録をお願いいたします。
24時間を超えると上記URLへはアクセスできなくなりますので、ご注意ください。

以上、よろしくお願いいたします。
-------------------------------------------
■ご質問・お問い合わせはこちら
NJ-Service　カスタマーセンター
お問い合わせ（https://NJ-Service.jp/support_contact）
営業時間：平日09:00～18:00　※土日祝、年末年始、メンテナンス日は除く
-------------------------------------------
","0","2023/07/07","2023/07/07");

insert into nj_email_template (email_template_name, title_cn, title_jp,text_cn,text_jp,del_flg,register_time,update_time)
values ("タレントユーザー申請"," Email地址验证通知（网红用户申请）","Emailアドレス認証のお知らせ（タレントユーザー申請）",
"To:希望注册账户的人士

请通过下记的URL完成账户的激活。
-----------------------------------------------------------------------------
http://localhost:8080/talent/talentUserSingup
-----------------------------------------------------------------------------
注意:请在24小时内注册,超过24小时后将无法访问上述URL。

以上，谢谢！
-------------------------------------------
■如有疑问・咨询，请联系如下：
NJ-Service 客户中心
咨询网址（https://NJ-Service.jp/support_contact）
营业时间：工作日09:00～18:00※周六日节假日、年末年初、维护日除外
-------------------------------------------
",
"アカウント登録を希望される方へ

下記のURLよりアカウントのアクティブ化を完了してください。
-----------------------------------------------------------------------------
http://localhost:8080/talent/talentUserSingup?confirmCode=$reserve.token
-----------------------------------------------------------------------------
24時間以内に本登録をお願いいたします。
24時間を超えると上記URLへはアクセスできなくなりますので、ご注意ください。

以上、よろしくお願いいたします。
-------------------------------------------
■ご質問・お問い合わせはこちら
NJ-Service　カスタマーセンター
お問い合わせ（https://NJ-Service.jp/support_contact）
営業時間：平日09:00～18:00　※土日祝、年末年始、メンテナンス日は除く
-------------------------------------------
",
"0","2023/07/07","2023/07/07");

insert into nj_email_template (email_template_name, title_cn, title_jp,text_cn,text_jp,del_flg,register_time,update_time)
values ("メールアドレスの変更","邮箱变更通知","メールアドレス変更のお知らせ",
"您好！

感谢您一直使用NJ-Service！
请访问下记URL，完成邮箱变更。
-----------------------------------------------------------------------------
http://localhost:8080/signup/activation?confirmCode=$reserve.token
-----------------------------------------------------------------------------

注意: 超过24小时后将无法访问上述URL。

以上，谢谢！
-------------------------------------------
■如有疑问・咨询，请联系如下：
NJ-Service 客户中心
咨询网址（https://NJ-Service.jp/support_contact）
营业时间：工作日09:00～18:00※周六日节假日、年末年初、维护日除外
-------------------------------------------
",
"平素よりNJ-Serviceをご利用いただき誠にありがとうございます。

以下のURLにアクセスしてメールアドレスの変更をお願いいたします。
-----------------------------------------------------------------------------
http://localhost:8080/signup/activation?confirmCode=$reserve.token
-----------------------------------------------------------------------------

24時間を超えると上記URLへはアクセスできなくなりますので、ご注意ください。

以上、よろしくお願いいたします。
-------------------------------------------
■ご質問・お問い合わせはこちら
NJ-Service　カスタマーセンター
お問い合わせ（https://NJ-Service.jp/support_contact）
営業時間：平日09:00～18:00　※土日祝、年末年始、メンテナンス日は除く
-------------------------------------------
",
"0","2023/07/07","2023/07/07");






