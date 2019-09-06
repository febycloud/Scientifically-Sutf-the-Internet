搭载shadowsocks

安装组件
yum install m2crypto python-setuptools
easy_install pip
pip install shadowsocks

配置参数
vi  /etc/shadowsocks.json

vi命令
i            编辑模式
esc       退出
:wq       保存并退出


写入配置
{
	"server" : "0.0.0.0",	// 购入时提供的IP Address
	"local_address" : "0.0.0.0",	 //购入时提供的IP Address
	"local_port" : "1080", 
	"port_password" : {
		"443" : "443",	// “自定义端口”：“该端口密码”
		"7777" : "7777",
		"666" : "666"
	},
	"timeout" : 300,
	"method": "aes-256-cfb",
	"fast_open": false
}


配置防火墙

安装
 yum install firewalld
启动
systemctl start firewalld
配置
firewall-cmd  - -permanent  - -zone=public --add-port=443/tcp (要开启的端口)
firewall-cmd  - -reload

开启shadowsocks服务
ssserver  -c  /etc/shadowsocks.json
