import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//'''
//python
//'''
//import urllib
//from urllib.request import urlretrieve



void main() => runApp(VideoPlayerApp());

class VideoPlayerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Player Demo',
      home: VideoPlayerScreen(),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  VideoPlayerScreen({Key key}) : super(key: key);
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}


void  download(n){
  var url = 'https://。。此处省。。。/2501080051b{0}.ts'; //.format(n);
  urlretrieve(url, 'C://Users/ASUS/Desktop/Merger/{0}.ts');//.format(n));
  //if __name__ == '__main__':
  try{
    for (i in range(694,1116)){
      n=(str(i).rjust(3,'0'));
      download(n);
      print(n);
    }
  } on Exception catch(e){
      // 捕まえる型を指定するには on ~~ catch を使う
      // eはException型
            print("wrong");
            print(e);
  }
}




/*''''

//# -*- coding: utf-8 -*-
"""
Created on Wed Mar 14 15:09:14 2018
@author: Y
'''
 
 
import requests
import json
 */
 
//#m3u8的文件路径
String path = InputDecoration(labelText:"Enter m3u8 file path:").replace('\\','/');
print(path);
file = open(path,'r');
operation = InputDecoration(labelText:"是否要加上前缀？y/n\n").strip();
pre_link = '';
if (operation == 'y'){
    pre_link = input("请输入前缀：").strip()
    
links = [];
for (i in file){
    if ('#' not in i){
        i = i.strip();
        links.append(pre_link+i);
    }
}        
file.close();
l = len(links);
print("总共有%d个片段..."%l);
length = len(str(len(links)));
n = 0;
txt = "";
for (link in links){
    n = n + 1;
    print("还剩%d个片段未下载..."%(l-n));
    if (len(str(n)) < length){
        name = '0'*(length-len(str(n))) + str(n) + ".ts"
    }    
    else{
        name = str(n)+".ts";
    }    
    txt = txt + "file \'" + name + "\'\n";
    jsonreq = json.dumps({'jsonrpc':'2.0', 'id':1,
               'method':'aria2.addUri',
               'params':[[link],{"out":name,"split":"5","max-connection-per-server":"16","seed-ratio":"0"}]});
    c = requests.post('http://localhost:6800/jsonrpc', jsonreq);
}
file = open("E:\\aria2data\\filelist.txt","w");
file.write(txt);
file.close();




/*
#m3u8形式のビデオファイルts転送mp4ダウンロードとキー暗号化の問題について

#DolitQin520。 2020-04-02 14:51:19。  2052  コレクション 1
#分類コラム: ビデオの暗号化 記事タグ: m3u8。 ビデオの暗号化 ビデオ Web ページの暗号化
#著作権
#1つは、ウェブサイトのブラウザF12キーを使用して、Google Chromeのプラグインを使用してビデオの.m3u8ファイルを見つけて開きます。
*/
 

 

//第二に、m3u8ファイルを開いた後、そこに.tsのリンク、およびキーのリンクがたくさんある。

 

 

//第三に、htmlファイルとして保存し、tsファイルをダウンロードし、コードは次のとおりです:マルチスレッドを追加し、プロキシを使用する必要があります。

//爬虫 123.html就是打开m3u8文件右键保存为html格式。
htmlf=open('./123.html','r',encoding="utf-8");
htmlcont=htmlf.read();
print(htmlcont);

tree = etree.HTML(htmlcont);
href = tree.xpath("//a//@href");
//print(href)
ts = href[2273:];
print(len(ts));
//print(ts)
for (i in ts){
    a = i.split("/")[-1]
}    
//print(a)
headers = {"User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.87 Safari/537.36"}
try:
    rest = requests.get(i,headers=headers)
    if rest.status_code == 200:
        with open(a,"wb") as fp:
            fp.write(rest.content)
        fp.close()
except Exception as e:
    print(e)
/*
#第四に、メソッドリファレンス1:
#参照リンク:https://gist.github.com/larvata/95df619df7109d8b74d2b965a3266354#ffmpeg-cheatsheet

# まず、key と m3u8 をダウンロードし、次にm3u8の key のパスを変更します。
# 最後に ffmpeg -i <source.m3u8> -c copy <target.ts> を ffmpeg でダウンロードします。
#IV, メソッド リファレンス 2:m3u8ファイルについて, tsファイル復号化, hls復号化. いくつかのレコードopenssl を使用して復号化します

#openssl aes-128-cbc -d -in 原.ts -out 解密后.ts -nosalt -iv 偏移量 -K key16进制
#ここで、iv オフセットと key は、通常、 にあります。 key はアドレスによってダウンロードされ、iv オフセットはオプションであり、m3u8 に iv がない場合、iv は 0 に設定できます。m3u8
#还可以直接使用 ffmpeg 直接合并文件。V, 暗号化された m3u8 ファイルの場合:

#m3u8ビデオをダウンロードするもう1つの方法は、上記の図のようにtsリンクで直接ダウンロードされたtsビデオファイルは暗号化されています(なぜ暗号化されていますか? 暗号化されていますが、ダウンロードは高速です)。

#EXT-X-KEY フィールドは、暗号化方式が AES-128 であり、key が URI を介して取得され、IV も含まれています。

 

#では、どのように復号化するのでしょうか。
#1.WEBページにURIアドレスをコピーし、あなたは自動的に16バイトのファイル
#を取得するために秒速でダウンロードします 2.ターミナルを開き、16進数を表示するためにファイルを開きます:

 

#6、 key 値を取得します。

#m3u8のkeyファイルをダウンロードし,winhex.exeアプリケーションをダウンロードし,インストール後,keyファイルをwinhexにドラッグし,16進数を自動的に生成する.

 

 

#7、合成ダウンロード良い.tsファイル:

#左下隅をクリックして実行:cmdcopy /b ファイルが格納されているディスク:\サブファイル\*.ts 格納されたフォルダ:\サブファイル\new.ts

#上の漢字をディスク文字とファイルがあるフォルダに置き換えます。

 

#8、 ts は暗号化されるため、ts ファイルを合成した後は開くできません。

#ここで,iv値は,0で代用する. これにより、復号化された ts ファイルが再生されます。

#9、注:tsファイルの順序は、順序付けする必要があり、不可欠です。

#参考 URL: 簡略書:https://www.jianshu.com/p/1b0adcc7b426
*/




/*
#pythonで書かれた小文字のダウンロード.m3u8リンクビデオは、MP4形式にトランスコードされています

#夏の夜2029 2019-03-04 21:44:58。  1828。  コレクション 5
##著作権
#はじめに: Web ページのビデオのほとんどは m3u8 形式であり、ビデオは完全なビデオを特に多くの小さなセグメントに分割し、サーバーに存在します。 ベン・シャオバイはpythonを習ったばかりなので、これをやろうとしました
*/


//必要なモジュールは次のとおりです。

//加载需要的模块
//import os
//import sys
//import requests
//from imp import reload
//reload(sys)

//取得.m3u8リンク
//この小さな白は、ここでは、Webソースを分析するためのリンクを取得する方法を提供していない、プラグインを利用する単純な暴力的な取得方法を直接共有します。 ここでは、Adobe HDS / HLS Video Saverをお勧めしますが、使用方法も簡単で、ビデオ付きの Web ページでプラグインを直接開くことができます。 ベン・シャオバイは、多くの場合、下のクリアキーをクリックして、すでに得られたリンクをきれいにすることを思い出させるためにここにいます。

//ビデオスライスをローカルにダウンロードし、コードを最初に読むのはやめましょう。

//得到ts链接，参数url为.m3u8链接
void get_ts(url){
	path = "E://爬虫视频";											//#默认视频存储路径
	
	all_url = url.split('/');										//#split根据'/'把字符串分裂成列表
	url_pre = '/'.join(all_url[:-1]) + '/';							//#舍弃末尾的一项，拼接成新的网址
	url_next = all_url[-1];											//#取all_url列表末尾的一项
	
	m3u8_txt = requests.get(url, headers = {'Connection':'close'});	//#requests.get()函数返回的是requests.models.Response对象
	with open(url_next, 'wb') as m3u8_content:						//#创建m3u8文件，
		m3u8_content.write(m3u8_txt.content);						//#m3u8_txt.content是字节流
	
	movies = [];			//#创建列表，存储获得的完整的.ts视频链接
	
	urls = open(url_next, 'rb')
	for line in urls.readlines():
		line2 = line.decode()						//# bytes -> str
		if '.ts' in line2:							//#提取.ts文件链接
			movies.append(url_pre + line2[:-1]);		//#拼接成完整的.ts网络链接，并保存在movies列表中,line2[:-1]删除掉末尾的换行符
		else:
			continue
	urls.close();									//#关闭
	return movies;									//#返回列表`
	
}


//#これは、.m3u8 リンクに従って完全な .ts ファイルへのリンクを取得する、ダウンロード の最初のステップです。
//#次に、2 番目の手順を開始し、ダウンロードします (上のコード)。

//#分片下载函数，参数movies为.ts链接。
void down_ts(movies){
    #os.chdir(path)
    print("下载中")
    for _url in movies:
	    movie_name = _url.split('/')[-1][-6:]   #在连接中提取后六位作为文件名           
	    error_get = []  #创建列表，存储出错的链接
    try:
        movie = requests.get(_url, headers = {'Connection':'close'}, timeout = 60)  #打开.ts链接
    except:
        error_get.append(_url)
    continue    
    print(movie_name)


	movie_content = open('E://爬虫视频/' + movie_name, 'wb') #在本地创建文件
	movie_content.writelines(movie) #下载分片
	if error_get:
	    down_ts(error_get)  #重新下载出错列表
	else:
	    print("下载成功")
        print("所有分片下载完成")
        num = len(movies)																			#获取列表元素的个数
    return num																					#返回元素的个数
}

//#これまでのところ、我々はすべての.tsファイルをローカルにダウンロードし、所有者は.m3u8形式のビデオをダウンロードしようとすると、また、すべての大きな神のブログに波が押し寄わせると、コードをつなぎ合わせ、その後、単独で理解を消化し、エラーやより簡単な方法がある場合は、ガイドに行きます。
//#3. マージビデオスライスコードは、私が言いたいのは、すべてコメントです:

//#合并分片
void merge_ts(num){
	path = "E:\\爬虫视频";

	new_path = ("%s\out.ts" % path);
	f = open(new_path, 'wb+');								//#二进制文件写操作

	for (i in range(0, num){
		filepath = ("%s\%03d.ts" % (path, i))				#视频片段的名字及路径
		print(filepath)
		for (line in open(filepath, "rb")){
			f.write(line)
    }  
		f.flush();
  }  
	f.close();
	print("合并完成,开始转码")
}


//#MP4形式のビデオにトランス
//#コード ここで所有者のためのツールはffmpegであり、これは公式ウェブサイトへのリンクを添付して、追加のダウンロードを必要とします。 ダウンロード後,ffmpegをwindowsの.exeに追加する必要がある.
//#ここでは、コードです
//#转码为MP4
void change_mp4(name){
	fn = 'E:\\爬虫视频\out.ts';
	output = "E:\\爬虫视频\%s.mp4" % name;
	cmd = "ffmpeg " + "-i " + fn + " -acodec copy -vcodec copy -f mp4 " + output;
	print(cmd);
	os.system(cmd);
	print("转码完成完成");
}


//#清空原始文件
void del_ts(num){
	path = "E://爬虫视频/out.ts";						//#要删除文件的路径
	os.remove(path);										//#清除文件
	for (i in range(0, num)){
		path = ("E://爬虫视频/%03d.ts" % i);				//#要删除文件的路径
		os.remove(path);	
  }  								//#清除文件
	print("清理完成，程序结束");
}


//#メイン関数コードを次に示します。

//if __name__ == "__main__":
	url = input("请输入.m3u8链接：");
	movie_name = input("请输入视频名称");
	movie_all = [];
	movie_all = get_ts(url);  
	num = down_ts(movie_all);
	merge_ts(num);
	change_mp4(movie_name);
	del_ts(num);

//#これで作業が完了し、小さなパートナーがダウンロードが遅いと感じた場合は、マルチスレッドを追加できます。 順徐ステッチコードによると、それは建物の所有者の元の完全なコードです。
//#最後に、ガイドハを歓迎します。








//# -*- coding:utf-8 -*-
//import sys
//import os
//from glob import glob
//#获取需要转换的路径
void get_user_path(argv_dir){
	if (os.path.isdir(argv_dir){
		return argv_dir
  }elseif (os.path.isabs(argv_dir){
		return argv_dir
  }  
	else{:
		return False
  }  
}

#对转换的TS文件进行排序		
def get_sorted_ts(user_path):
	ts_list = glob(os.path.join(user_path,'*.ts'))
	#print(ts_list)
	boxer = []
	for ts in ts_list:
		if os.path.exists(ts):
			#print(os.path.splitext(os.path.basename(ts)))
			file,_ = os.path.splitext(os.path.basename(ts))
			boxer.append(int(file))
	boxer.sort()
	#print(boxer)
	return boxer
#文件合并	
def convert_m3u8(boxer,o_file_name):
	#cmd_arg = str(ts0)+"+"+str(ts1)+" "+o_file_name
	tmp = []
	for ts in boxer:
		tmp.append(str(ts)+'.ts')
	cmd_str = '+'.join(tmp)
	exec_str = "copy /b "+cmd_str+' '+o_file_name
	#print("copy /b "+cmd_str+' '+o_file_name)
	os.system(exec_str)
		
		
if __name__=='__main__':
	#print(sys.argv[1:])
	argv_len = len(sys.argv)
	if argv_len == 3:
		o_dir,o_file_name =sys.argv[1:]
		#print(o_dir+":"+o_file_name)
		user_path = get_user_path(o_dir)
		#print(user_path)
		if not user_path:
			print("您输入的路径不正确，:-(");
		else:
			if os.path.exists(os.path.join(user_path,o_file_name)):
				print('目标文件已存在，程序停止运行。')
				exit(0)
			os.chdir(user_path)
			#convert_m3u8('2.ts','4.ts',o_file_name)
			boxer = get_sorted_ts(user_path)
			convert_m3u8(boxer,o_file_name)
			#print(os.getcwd())
	else:
		print("参数个数非法");










class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;
  @override
  void initState() {
    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    );
    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize();
    // Use the controller to loop the video.
    _controller.setLooping(true);
    super.initState();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Butterfly Video'),
      ),
      // Use a FutureBuilder to display a loading spinner while waiting for the
      // VideoPlayerController to finish initializing.
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the VideoPlayerController has finished initialization, use
            // the data it provides to limit the aspect ratio of the video.
            return AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              // Use the VideoPlayer widget to display the video.
              child: VideoPlayer(_controller),
            );
          } else {
            // If the VideoPlayerController is still initializing, show a
            // loading spinner.
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Wrap the play or pause in a call to `setState`. This ensures the
          // correct icon is shown.
          setState(() {
            // If the video is playing, pause it.
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              // If the video is paused, play it.
              _controller.play();
            }
          });
        },
        // Display the correct icon depending on the state of the player.
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}
