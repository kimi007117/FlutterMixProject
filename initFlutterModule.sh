#！ /bin/bash

#下载flutter模块代码
#执行 ./initFlutterModule.sh flutter_module

flutterModule=$1;

if [[ -z "$flutterModule" ]]; then
	#statements
	flutterModule="flutter_module"
	echo "使用flutter_module作为默认模块名称"
fi

if [[ -d "$flutterModule" ]]; then
	#statements
	echo "执行 flutter create -t module ${flutterModule}"
	flutter create -t module ${flutterModule}
else
	echo "${flutterModule}  文件夹不存在"
fi