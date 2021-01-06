import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
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
String get_ts(url){
	String  path = "E://Clone Videos";											//#默认视频存储路径
	
	//String all_url = url.split('/');										//split は '/' に基づいて文字列をリストに分割します
	List<String> all_url = url.split('/');
  String url_pre = all_url.join();//'/'.join(all_url[-1]) + '/';			//最後の項目を破棄し、新しい URL にステッチします
	String url_next = all_url[-1];											//リストall_url末尾にある項目を取得します
	
	String m3u8_txt = requests.get(url, headers = {'Connection':'close'});	//#requests.get()函数返回的是requests.models.Response对象
	with open(url_next, 'wb') as m3u8_content:						//#创建m3u8文件，
		m3u8_content.write(m3u8_txt.content);						//#m3u8_txt.content是字节流
	
	String movies = [];			//#创建列表，存储获得的完整的.ts视频链接
	
	String urls = open(url_next, 'rb');
	for (line in urls.readlines()){
		line2 = line.decode();						//# bytes -> str
		if ('.ts' in line2){							//#提取.ts文件链接
			movies.append(url_pre + line2[:-1]);
    }  		//#拼接成完整的.ts网络链接，并保存在movies列表中,line2[:-1]删除掉末尾的换行符
		else{
			continue;
    }
  }    
	urls.close();									//#关闭
	return movies;									//#返回列表`
	
}


//#これは、.m3u8 リンクに従って完全な .ts ファイルへのリンクを取得する、ダウンロード の最初のステップです。
//#次に、2 番目の手順を開始し、ダウンロードします (上のコード)。

//#分片下载函数，参数movies为.ts链接。
int down_ts(movies){
    //#os.chdir(path)
    print("下载中");
    for(url in movies){
	    movie_name = _url.split('/')[-1][-6:];   //#在连接中提取后六位作为文件名           
	    error_get = [];  //#创建列表，存储出错的链接
      try{
        movie = requests.get(_url, headers = {'Connection':'close'}, timeout = 60);  //#打开.ts链接
      } on Exception catch(e){
        error_get.append(_url);
      }
      continue;
    }
    print(movie_name);
    movie_content = open('E://爬虫视频/' + movie_name, 'wb'); //#在本地创建文件
	  movie_content.writelines(movie); //#下载分片
	  if (error_get){
	    down_ts(error_get);  //#重新下载出错列表
    }
	  else{
	    print("下载成功");
    }  
        print("所有分片下载完成");
        num = len(movies);																			//#获取列表元素的个数
    return num;																					//#返回元素的个数
}

//#これまでのところ、我々はすべての.tsファイルをローカルにダウンロードし、所有者は.m3u8形式のビデオをダウンロードしようとすると、また、すべての大きな神のブログに波が押し寄わせると、コードをつなぎ合わせ、その後、単独で理解を消化し、エラーやより簡単な方法がある場合は、ガイドに行きます。
//#3. マージビデオスライスコードは、私が言いたいのは、すべてコメントです:

//#合并分片
void merge_ts(num){
	String path = "E:\\爬虫视频";

	String new_path = ("%s\out.ts" % path);
	String f = open(new_path, 'wb+');								//#二进制文件写操作

	for (i in range(0, num)){
		String filepath = ("%s\%03d.ts" % (path, i));				//#视频片段的名字及路径
		print(filepath);
		for ( String line in open(filepath, "rb")){
			f.write(line);
    }  
		f.flush();
  }  
	f.close();
	print("合并完成,开始转码");
}


//#MP4形式のビデオにトランス
//#コード ここで所有者のためのツールはffmpegであり、これは公式ウェブサイトへのリンクを添付して、追加のダウンロードを必要とします。 ダウンロード後,ffmpegをwindowsの.exeに追加する必要がある.
//#ここでは、コードです
//#转码为MP4
void change_mp4(name){
	String fn = 'E:\\爬虫视频\out.ts';
	String output = "E:\\爬虫视频\%s.mp4" % name;
	String cmd = "ffmpeg " + "-i " + fn + " -acodec copy -vcodec copy -f mp4 " + output;
	print(cmd);
	os.system(cmd);
	print("转码完成完成");
}


//#清空原始文件
void del_ts(num){
	String path = "E://爬虫视频/out.ts";						//#要删除文件的路径
	os.remove(path);										//#清除文件
	for (int i in range(0, num)){
		path = ("E://爬虫视频/%03d.ts" % i);				//#要删除文件的路径
		os.remove(path);	
  }  								//#清除文件
	print("清理完成，程序结束");
}


//#メイン関数コードを次に示します。

//if __name__ == "__main__":
	String url = 'https://d.ossrs.net:8088/live/livestream.m3u8';//input("input to .m3u8 Link-Addres：");
	String movie_name = input("input to VideoName");
	String movie_all = [];
	movie_all = get_ts(url);  
	num = down_ts(movie_all);
	merge_ts(num);
	change_mp4(movie_name);
	del_ts(num);

//#これで作業が完了し、小さなパートナーがダウンロードが遅いと感じた場合は、マルチスレッドを追加できます。 順徐ステッチコードによると、それは建物の所有者の元の完全なコードです。
//#最後に、ガイドハを歓迎します。
